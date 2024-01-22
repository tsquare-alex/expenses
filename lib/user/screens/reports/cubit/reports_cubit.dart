import 'dart:math';

import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
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
            (transaction) => (DateFormat('dd/MM/yyyy', 'en')
                    .parse(transaction.transactionDate!)
                    .isAfter(
                      reportSelectedDate!.start.subtract(
                        const Duration(days: 1),
                      ),
                    ) &&
                DateFormat('dd/MM/yyyy', 'en')
                    .parse(transaction.transactionDate!)
                    .isBefore(
                      reportSelectedDate!.end.add(
                        const Duration(days: 1),
                      ),
                    )),
          )
          .toList();
      createCategories();
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
    for (var transaction
        in selectedWallet.isEmpty ? transactions : reportFilteredTransactions) {
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
    if ((selectedWallet != 'all' && selectedWallet.isNotEmpty) ||
        (selectedWallet != 'all' &&
            selectedWallet.isNotEmpty &&
            reportSelectedDate != null &&
            reportSelectedDate != reportInitialDate)) {
      final percentage = getCategoryTotalMoney(category) /
          (allSpentMoney = getUserSpentMoney(reportFilteredTransactions));
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
    Colors.yellow,
    Colors.green,
    Colors.orange,
    Colors.blue,
    Colors.purple,
    Colors.teal,
    Colors.pink,
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
    Colors.lightGreenAccent,
    Colors.indigoAccent,
    Colors.red,
    Colors.tealAccent,
    Colors.purpleAccent,
  ];

  Future<void> getStatsData() async {
    emit(const ReportsState.statsDataLoading());
    await Future.wait([getWalletData(), getTransactionsData()]);
    emit(const ReportsState.statsDataLoaded());
  }

  List<AddTransactionModel> statsTransactionsList = [];
  List<String> statsTransactions = [];

  List<AddTransactionModel> statsSubTransactionsList = [];
  List<String> statsSubTransactions = [];

  List<AddTransactionModel> beforeDatesFilteredTransactions = [];

  List<AddTransactionModel> statsPrioritiesList = [];
  List<String> statsPriorities = [];

  List<AddTransactionModel> filteredTransactions = [];

  String statsSelectedWallet = '';
  void onWalletSelect(String selectedWallet) {
    if (selectedWallet != statsSelectedWallet) {
      emit(const ReportsState.initial());
      statsSelectedWallet = selectedWallet;
      statsSelectedTransaction = '';
      statsTransactions.clear();
      statsTransactionsList.clear();
      statsSelectedSubTransaction = '';
      statsSubTransactions.clear();
      statsSubTransactionsList.clear();
      statsSelectedPriorities = '';
      statsPriorities.clear();
      statsPrioritiesList.clear();
      beforeDatesFilteredTransactions.clear();
      clearStatsDates();
      filteredTransactions.clear();
      statsTransactionsList = transactions
          .where(
              (transaction) => transaction.incomeSource!.name == selectedWallet)
          .toList();
      statsTransactions = statsTransactionsList
          .map((transaction) => transaction.transactionType!.name!)
          .toSet()
          .toList();
      emit(const ReportsState.statsWalletsSelected());
    }
  }

  String statsSelectedTransaction = '';
  void onTransactionsSelect(String selectedTransaction) {
    if (selectedTransaction != statsSelectedTransaction) {
      emit(const ReportsState.initial());
      statsSelectedTransaction = selectedTransaction;
      statsSelectedSubTransaction = '';
      statsSubTransactions.clear();
      statsSubTransactionsList.clear();
      statsSelectedPriorities = '';
      statsPriorities.clear();
      statsPrioritiesList.clear();
      beforeDatesFilteredTransactions.clear();
      clearStatsDates();
      filteredTransactions.clear();
      statsSubTransactionsList = statsTransactionsList
          .where((transaction) =>
              transaction.transactionType!.name == selectedTransaction)
          .toList();
      statsSubTransactions = statsSubTransactionsList
          .map((transaction) => transaction.transactionContent!.name!)
          .toSet()
          .toList();
      emit(const ReportsState.statsWalletsSelected());
    }
  }

  String statsSelectedSubTransaction = '';
  void onSubTransactionsSelect(String selectedSubTransaction) {
    if (selectedSubTransaction != statsSelectedSubTransaction) {
      emit(const ReportsState.initial());
      statsSelectedSubTransaction = selectedSubTransaction;
      beforeDatesFilteredTransactions.clear();
      clearStatsDates();
      statsSelectedPriorities = '';
      statsPriorities.clear();
      statsPrioritiesList.clear();
      filteredTransactions.clear();
      beforeDatesFilteredTransactions = statsSubTransactionsList
          .where((transaction) =>
              transaction.transactionContent!.name! == selectedSubTransaction)
          .toList();
      emit(const ReportsState.statsWalletsSelected());
    }
  }

  void changeStatsDateFrom() {
    if (statsSelectedDateFrom != null) {
      emit(const ReportsState.initial());
      statsSelectedPriorities = '';
      statsPriorities.clear();
      statsPrioritiesList.clear();
      filteredTransactions.clear();
      statsFormattedDateFrom =
          DateFormat('dd/MM/yyyy').format(statsSelectedDateFrom!);

      if (statsSelectedDateTo!.isBefore(statsSelectedDateFrom!) ||
          statsFormattedDateTo.isEmpty) {
        statsSelectedDateTo = statsSelectedDateFrom;
        if (statsFormattedDateTo.isNotEmpty) {
          statsFormattedDateTo =
              DateFormat('dd/MM/yyyy').format(statsSelectedDateTo!);
        }
      }
      changeStatsDateTo();
      emit(const ReportsState.changeDate());
      return;
    }
    statsSelectedDateFrom ??= statsFormattedDateFrom.isEmpty
        ? dateTimeNow
        : DateFormat('dd/MM/yyyy').parse(statsFormattedDateFrom);
  }

  void changeStatsDateTo() {
    if (statsSelectedDateTo != null) {
      emit(const ReportsState.initial());
      statsSelectedPriorities = '';
      statsPriorities.clear();
      statsPrioritiesList.clear();
      filteredTransactions.clear();
      statsFormattedDateTo =
          DateFormat('dd/MM/yyyy').format(statsSelectedDateTo!);
      statsPrioritiesList = beforeDatesFilteredTransactions
          .where(
            (transaction) => (DateFormat('dd/MM/yyyy')
                    .parse(transaction.transactionDate!)
                    .isAfter(
                      statsSelectedDateFrom!.subtract(
                        const Duration(days: 1),
                      ),
                    ) &&
                DateFormat('dd/MM/yyyy')
                    .parse(transaction.transactionDate!)
                    .isBefore(
                      statsSelectedDateTo!.add(
                        const Duration(days: 1),
                      ),
                    )),
          )
          .toList();
      statsPriorities = statsPrioritiesList
          .map((transaction) => transaction.priority!.name!)
          .toSet()
          .toList();
      emit(const ReportsState.changeDate());
      return;
    }
    statsSelectedDateTo ??= statsFormattedDateTo.isEmpty
        ? statsSelectedDateFrom
        : DateFormat('dd/MM/yyyy').parse(statsFormattedDateTo);
  }

  String statsSelectedPriorities = '';
  void onPrioritiesSelect(String selectedPriority) {
    if (selectedPriority != statsSelectedPriorities) {
      emit(const ReportsState.initial());
      statsSelectedPriorities = selectedPriority;
      filteredTransactions = statsPrioritiesList
          .where(
              (transaction) => transaction.priority!.name! == selectedPriority)
          .toList();
      emit(const ReportsState.statsWalletsSelected());
    }
  }

  void clearStatsDates() {
    statsSelectedDateFrom = dateTimeNow;
    statsSelectedDateTo = statsSelectedDateFrom;
    statsFormattedDateFrom = '';
    statsFormattedDateTo = '';
  }

  Map<String, String> statsDetailsOptions = {
    'table': 'استعرض في جدول',
    'chart': 'استعرض في رسم بياني',
    'compare': 'المقارنة بين المعاملات',
  };

  void showDetails() {
    if ((filteredTransactions.isEmpty && statsFormattedDateFrom.isEmpty) ||
        (filteredTransactions.isEmpty &&
            statsSelectedPriorities.isEmpty &&
            statsPrioritiesList.isNotEmpty)) {
      CustomToast.showSimpleToast(
        msg: 'برجاء استكمال ادخال البيانات',
        color: MyColors.primary,
      );
      return;
    }
    if (statsPrioritiesList.isEmpty) {
      CustomToast.showSimpleToast(
        msg: 'لا يوجد بيانات',
        color: MyColors.primary,
      );
      return;
    }
    emit(const ReportsState.showReportDetails());
  }
}
