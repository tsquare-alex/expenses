import 'dart:math';

import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../../../general/constants/constants.dart';
import '../../../models/add_transaction_model/add_transaction_model.dart';
import '../models/reports_category.dart';

part 'reports_cubit.freezed.dart';
part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(const ReportsState.initial());

  static ReportsCubit get(context) => BlocProvider.of<ReportsCubit>(context);

  final DateTime dateTimeNow = DateTime.now();
  late String dateTimeNowFormatted =
      DateFormat('EEE, dd MMM yyyy').format(dateTimeNow);
  late DateTimeRange reportInitialDate =
      DateTimeRange(start: dateTimeNow, end: dateTimeNow);
  late DateTimeRange? reportSelectedDate;
  // late DateTime? reportSelectedDateFrom;
  // late DateTime? reportSelectedDateTo;
  late DateTime? statsSelectedDateFrom = dateTimeNow;
  late DateTime? statsSelectedDateTo = statsSelectedDateFrom!;
  String reportFormattedDateFrom = '';
  String reportFormattedDateTo = '';
  String statsFormattedDateFrom = '';
  String statsFormattedDateTo = '';

  void changeReportDateRange() {
    if (reportSelectedDate != null && reportSelectedDate != reportInitialDate) {
      emit(const ReportsState.initial());
      reportInitialDate = reportSelectedDate!;
      List<String> dateParts = reportSelectedDate.toString().split(' - ');
      reportFormattedDateFrom = _formatDateTime(dateParts.first);
      reportFormattedDateTo = _formatDateTime(dateParts.last);
      reportFilteredTransactions = transactions
          .where(
            (transaction) => (DateFormat('dd MMMM yyyy', 'en')
                    .parse(transaction.transactionDate!)
                    .isAfter(
                      reportSelectedDate!.start.subtract(
                        const Duration(days: 1),
                      ),
                    ) &&
                DateFormat('dd MMMM yyyy', 'en')
                    .parse(transaction.transactionDate!)
                    .isBefore(
                      reportSelectedDate!.end.add(
                        const Duration(days: 1),
                      ),
                    )),
          )
          .toList();
      emit(const ReportsState.changeDate());
      return;
    }
  }

  void resetDates() {
    reportInitialDate = DateTimeRange(start: dateTimeNow, end: dateTimeNow);
    reportSelectedDate = null;
    reportFormattedDateFrom = '';
    reportFormattedDateTo = '';
  }

  String _formatDateTime(String dateTimeString) {
    final parsedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss.SSS', 'en').parse(dateTimeString);
    return DateFormat('dd-MM-yyyy').format(parsedDate);
  }

  void changeStatsDateFrom() {
    emit(const ReportsState.initial());
    if (statsSelectedDateFrom != null) {
      statsFormattedDateFrom =
          DateFormat('EEE, dd-MM-yyyy').format(statsSelectedDateFrom!);

      if (statsSelectedDateTo!.isBefore(statsSelectedDateFrom!) ||
          statsFormattedDateTo.isEmpty) {
        statsSelectedDateTo = statsSelectedDateFrom;
        if (statsFormattedDateTo.isNotEmpty) {
          statsFormattedDateTo =
              DateFormat('EEE, dd-MM-yyyy').format(statsSelectedDateTo!);
        }
      }
      emit(const ReportsState.changeDate());
      return;
    }
    statsSelectedDateFrom ??= statsFormattedDateFrom.isEmpty
        ? dateTimeNow
        : DateFormat('EEE, dd-MM-yyyy').parse(statsFormattedDateFrom);
  }

  void changeStatsDateTo() {
    emit(const ReportsState.initial());
    if (statsSelectedDateTo != null) {
      statsFormattedDateTo =
          DateFormat('EEE, dd-MM-yyyy').format(statsSelectedDateTo!);
      emit(const ReportsState.changeDate());
      return;
    }
    statsSelectedDateTo ??= statsFormattedDateTo.isEmpty
        ? statsSelectedDateFrom
        : DateFormat('EEE, dd-MM-yyyy').parse(statsFormattedDateTo);
  }

  final List<double> weeklySpending = [
    Random().nextDouble() * 100,
    Random().nextDouble() * 100,
    Random().nextDouble() * 100,
    Random().nextDouble() * 100,
    Random().nextDouble() * 100,
    Random().nextDouble() * 100,
    Random().nextDouble() * 100,
  ];

  String getCurrentLocale(BuildContext context) =>
      Localizations.localeOf(context).toString();

  Map<String, String> statsDetailsOptions = {
    'table': 'استعرض في جدول',
    'chart': 'استعرض في رسم بياني',
    'compare': 'المقارنة بين المعاملات',
  };

  void showDetails() {
    emit(const ReportsState.initial());

    emit(const ReportsState.showReportDetails());
  }

  late double totalMoney;
  late double spentMoney;
  late double residualMoney;
  late double circleChartPercentage;
  late String moneyPercentage;

  double getUserResidualMoney(List<WalletModel> wallets) {
    double total = 0;
    for (var wallet in wallets) {
      total += wallet.balance;
    }
    return residualMoney = total;
  }

  double getUserSpentMoney(List<AddTransactionModel> transactions) {
    double total = 0;
    for (var transaction in transactions) {
      total += double.parse(transaction.total!);
    }
    return spentMoney = total;
  }

  double getUserTotalMoney(
      List<WalletModel> wallets, List<AddTransactionModel> transactions) {
    return totalMoney =
        getUserResidualMoney(wallets) + getUserSpentMoney(transactions);
  }

  late List<WalletModel> wallets;
  Future<void> getWalletData() async {
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    List<WalletModel> data = walletBox.values.toList();
    wallets = data;
  }

  void createMoneyPercentage(
      List<WalletModel> wallets, List<AddTransactionModel> transactions) {
    getUserTotalMoney(wallets, transactions);
    circleChartPercentage = spentMoney / totalMoney;
    // moneyPercentage = '${(circleChartPercentage * 100).round()}';
  }

  late List<AddTransactionModel> transactions;
  Future<void> getTransactionsData() async {
    final box = await Hive.openBox<AddTransactionModel>('addTransactionBox');
    var transactionsBox = Hive.box<AddTransactionModel>('addTransactionBox');
    List<AddTransactionModel> data = transactionsBox.values.toList();
    box.close();
    data.sort((a, b) => b.transactionDate!.compareTo(a.transactionDate!));
    transactions = data;
  }

  Future<void> getReportData() async {
    emit(const ReportsState.reportDataLoading());
    await Future.wait([getWalletData(), getTransactionsData()]);
    if (wallets.isEmpty) {
      emit(const ReportsState.initial());
      return;
    }
    createMoneyPercentage(wallets, transactions);
    createCategories();
    emit(const ReportsState.reportDataLoaded());
  }

  Future<void> getMainReportData() async {
    emit(const ReportsState.reportDataLoading());
    await Future.wait([getWalletData(), getTransactionsData()]);
    createMoneyPercentage(wallets, transactions);
    emit(const ReportsState.reportDataLoaded());
  }

  late String selectedWallet = '';
  late List<AddTransactionModel> reportFilteredTransactions = List.empty();
  void changeWallet(String walletValue) {
    if (walletValue != selectedWallet) {
      emit(const ReportsState.initial());
      selectedWallet = walletValue;
      if (selectedWallet != 'all' && selectedWallet.isNotEmpty) {
        reportFilteredTransactions = transactions
            .where((transaction) =>
                transaction.incomeSource!.name == selectedWallet)
            .toList();
        createCategories();
        createMoneyPercentage(
            [wallets.firstWhere((wallet) => wallet.name == selectedWallet)],
            reportFilteredTransactions);
      } else if (selectedWallet == 'all') {
        reportFilteredTransactions = transactions;
        createCategories();
        createMoneyPercentage(wallets, transactions);
      } else {
        reportFilteredTransactions = List.empty();
        createMoneyPercentage(wallets, transactions);
        createCategories();
      }
      resetDates();
      emit(const ReportsState.changeWallet());
    }
  }

  List<ReportCategory> categoriesList = [];

  void createCategories() {
    categoriesList.clear();
    for (var category in getTransactionsCategories()) {
      addCategory(category);
    }
  }

  Set<String> getTransactionsCategories() {
    Set<String> transactionsCategories = {};
    for (var transaction in reportFilteredTransactions.isEmpty
        ? transactions
        : reportFilteredTransactions) {
      transactionsCategories.add(transaction.transactionType!.name!);
    }
    return transactionsCategories;
  }

  double getCategoryTotalMoney(String category) {
    double totalMoney = 0;
    final transactionsList = reportFilteredTransactions.isEmpty
        ? transactions
            .where((element) => element.transactionType!.name == category)
            .toList()
        : reportFilteredTransactions
            .where((element) => element.transactionType!.name == category)
            .toList();
    for (var transaction in transactionsList) {
      totalMoney += double.parse(transaction.total!);
    }
    return totalMoney;
  }

  double allSpentMoney = 0;
  void addCategory(String category) {
    // final transactionsList = reportFilteredTransactions
    //     .where((element) => element.transactionType!.name == category)
    //     .toList();
    if (selectedWallet != 'all' && selectedWallet.isNotEmpty) {
      final percentage = getCategoryTotalMoney(category) /
          getUserSpentMoney(reportFilteredTransactions);
      categoriesList.add(
        ReportCategory(
          title: category,
          totalMoney: getCategoryTotalMoney(category),
          percentage: percentage,
        ),
      );
    } else {
      final percentage = getCategoryTotalMoney(category) /
          (allSpentMoney = getUserSpentMoney(reportFilteredTransactions.isEmpty
              ? transactions
              : reportFilteredTransactions));
      categoriesList.add(
        ReportCategory(
          title: category,
          totalMoney: getCategoryTotalMoney(category),
          percentage: percentage,
        ),
      );
    }
  }

  List<Color> randomColors = [
    Colors.deepOrangeAccent,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.brown,
    Colors.grey,
    Colors.cyan,
    Colors.amber,
    Colors.deepPurple,
    Colors.lime,
    Colors.lightBlue,
    Colors.deepOrange,
    Colors.lightGreen,
    Colors.blueGrey,
    Colors.indigoAccent,
    Colors.lightGreenAccent,
    Colors.red,
    Colors.purpleAccent,
    Colors.tealAccent,
  ];

  Future<void> getStatsData() async {
    emit(const ReportsState.statsDataLoading());
    await Future.wait([getWalletData(), getTransactionsData()]);
    convertMap();
    emit(const ReportsState.statsDataLoaded());
  }

  void convertMap() {
    selectedWalletsMap = {for (var item in wallets) item.name: false};
  }

  Map selectedWalletsMap = {};
  List selectedWallets = [];
  List<AddTransactionModel> statsTransactions = [];
  Map statsTransactionsMap = {};
  List selectedTransactions = [];
  List<AddTransactionModel> statsSubTransactions = [];
  Map statsSubTransactionsMap = {};
  List selectedSubTransactions = [];
  List<AddTransactionModel> statsPriorities = [];
  Map statsPrioritiesMap = {};
  List selectedPriorities = [];
  List<AddTransactionModel> filteredTransactions = [];

  void onWalletMapSelect(String key) {
    emit(const ReportsState.initial());
    selectedWalletsMap[key]
        ? selectedWalletsMap[key] = false
        : selectedWalletsMap[key] = true;
    selectedWalletsMap.forEach((key, value) {
      if (value && !selectedWallets.contains(key)) {
        selectedWallets.add(key);
      } else if (!value && selectedWallets.contains(key)) {
        selectedWallets.remove(key);
      }
    });
    statsTransactions = transactions
        .where((transaction) =>
            selectedWallets.contains(transaction.incomeSource!.name))
        .toList();
    statsTransactionsMap = {
      for (var item in statsTransactions) item.transactionName: false
    };
    emit(const ReportsState.statsWalletsSelected());
    print(statsTransactionsMap);
  }

  void onTransactionsMapSelect(String key) {
    emit(const ReportsState.initial());
    statsTransactionsMap[key]
        ? statsTransactionsMap[key] = false
        : statsTransactionsMap[key] = true;
    statsTransactionsMap.forEach((key, value) {
      if (value && !selectedTransactions.contains(key)) {
        selectedTransactions.add(key);
      } else if (!value && selectedTransactions.contains(key)) {
        selectedTransactions.remove(key);
      }
    });
    statsSubTransactions = transactions
        .where((transaction) =>
            selectedTransactions.contains(transaction.transactionName))
        .toList();
    // statsSubTransactionsMap = {
    //   for (var item in statsSubTransactions) item.database!.adjective: false
    // };
    emit(const ReportsState.statsWalletsSelected());
    print(statsSubTransactionsMap);
  }

  void onSubTransactionsMapSelect(String key) {
    emit(const ReportsState.initial());
    statsSubTransactionsMap[key]
        ? statsSubTransactionsMap[key] = false
        : statsSubTransactionsMap[key] = true;
    statsSubTransactionsMap.forEach((key, value) {
      if (value && !selectedSubTransactions.contains(key)) {
        selectedSubTransactions.add(key);
      } else if (!value && selectedSubTransactions.contains(key)) {
        selectedSubTransactions.remove(key);
      }
    });
    // statsPriorities = transactions
    //     .where((transaction) =>
    //         // selectedSubTransactions.contains(transaction.database!.adjective))
    //     .toList();
    statsPrioritiesMap = {
      for (var item in statsPriorities) item.priority: false
    };
    emit(const ReportsState.statsWalletsSelected());
    print(statsPrioritiesMap);
  }

  void onPrioritiesMapSelect(String key) {
    emit(const ReportsState.initial());
    statsPrioritiesMap[key]
        ? statsPrioritiesMap[key] = false
        : statsPrioritiesMap[key] = true;
    statsPrioritiesMap.forEach((key, value) {
      if (value && !selectedPriorities.contains(key)) {
        selectedPriorities.add(key);
      } else if (!value && selectedPriorities.contains(key)) {
        selectedPriorities.remove(key);
      }
    });
    // filteredTransactions = transactions
    //     .where((transaction) =>
    //         selectedPriorities.contains(transaction.priority) &&
    //         // selectedSubTransactions.contains(transaction.database!.adjective))
    //     .toList();

    emit(const ReportsState.statsWalletsSelected());
    print(filteredTransactions);
  }
}
