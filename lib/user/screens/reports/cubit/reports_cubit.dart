import 'dart:io';
import 'dart:math';

import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/general/utilities/utils_functions/decimal_format.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xcel;

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
      DateFormat('dd-MMM-yyyy').format(dateTimeNow);
  late DateTimeRange reportInitialDate =
      DateTimeRange(start: dateTimeNow, end: dateTimeNow);
  late DateTimeRange? reportSelectedDate;
  String reportFormattedDateFrom = '';
  String reportFormattedDateTo = '';
  late DateTime? statsSelectedDateFrom = dateTimeNow;
  late DateTime? statsSelectedDateTo = statsSelectedDateFrom!;
  String statsFormattedDateFrom = '';
  String statsFormattedDateTo = '';

  void changeReportDateRange() {
    if (reportSelectedDate != null && reportSelectedDate != reportInitialDate) {
      emit(const ReportsState.initial());
      reportInitialDate = reportSelectedDate!;
      List<String> dateParts = reportSelectedDate.toString().split(' - ');
      reportFormattedDateFrom = _formatDateTime(dateParts.first);
      reportFormattedDateTo = _formatDateTime(dateParts.last);
      if (selectedWallet != 'all' && selectedWallet.isNotEmpty) {
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
                      ) &&
                  transaction.incomeSource!.name == selectedWallet),
            )
            .toList();
      } else {
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
      }
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
  late double spentMoneyPercentage;
  late double residualMoney;
  late double residualMoneyPercentage;
  late double circleChartPercentage;
  late String moneyPercentage;

  double getUserResidualMoney(List<WalletModel> wallets) {
    double total = 0;
    for (var wallet in wallets) {
      total += wallet.totalBalance!;
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

  void createSpentMoneyPercentage() {
    spentMoneyPercentage =
        (spentMoney / totalMoney).isNaN ? 0 : (spentMoney / totalMoney);
  }

  void createResidualMoneyPercentage() {
    residualMoneyPercentage =
        (residualMoney / totalMoney).isNaN ? 0 : (residualMoney / totalMoney);
  }

  void changeMainWallet(String walletValue) {
    if (walletValue != selectedWallet) {
      emit(const ReportsState.initial());
      selectedWallet = walletValue;
      if (selectedWallet != 'all' && selectedWallet.isNotEmpty) {
        reportFilteredTransactions = transactions
            .where((transaction) =>
                transaction.incomeSource!.name == selectedWallet)
            .toList();
        getUserTotalMoney(
            [wallets.firstWhere((wallet) => wallet.name == selectedWallet)],
            reportFilteredTransactions);
      } else if (selectedWallet == 'all') {
        reportFilteredTransactions = transactions;
        getUserTotalMoney(wallets, reportFilteredTransactions);
      } else {
        reportFilteredTransactions = List.empty();
        getUserTotalMoney(wallets, transactions);
      }
      createSpentMoneyPercentage();
      createResidualMoneyPercentage();
      emit(const ReportsState.changeWallet());
    }
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
    getUserTotalMoney(wallets, transactions);
    createCategories();
    emit(const ReportsState.reportDataLoaded());
  }

  Future<void> getMainReportData() async {
    emit(const ReportsState.reportDataLoading());
    await Future.wait([getWalletData(), getTransactionsData()]);
    getUserTotalMoney(wallets, transactions);
    createSpentMoneyPercentage();
    createResidualMoneyPercentage();
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
        getUserTotalMoney(
            [wallets.firstWhere((wallet) => wallet.name == selectedWallet)],
            reportFilteredTransactions);
      } else if (selectedWallet == 'all') {
        reportFilteredTransactions = transactions;
        getUserTotalMoney(wallets, reportFilteredTransactions);
        createCategories();
      } else {
        reportFilteredTransactions = List.empty();
        getUserTotalMoney(wallets, transactions);
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
      filteredTransactions = statsTransactionsList = transactions
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
      filteredTransactions = [];
      filteredTransactions = statsSubTransactionsList = statsTransactionsList
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
      filteredTransactions = [];
      filteredTransactions = beforeDatesFilteredTransactions =
          statsSubTransactionsList
              .where((transaction) =>
                  transaction.transactionContent!.name! ==
                  selectedSubTransaction)
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
      filteredTransactions = [];
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
      filteredTransactions = [];
      statsFormattedDateTo =
          DateFormat('dd/MM/yyyy').format(statsSelectedDateTo!);
      filteredTransactions =
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

  Map<String, String> statsDetailsOptions(BuildContext context) {
    return {
      'table': tr(context, 'showTable'),
      'chart': tr(context, 'showChart'),
      'compare': tr(context, 'compareTransactions'),
    };
  }

  void showDetails(BuildContext context) {
    if (statsSelectedWallet.isEmpty) {
      CustomToast.showSimpleToast(
        msg: tr(context, 'continueInsertingData'),
        color: MyColors.primary,
      );
      return;
    }
    if (filteredTransactions.isEmpty) {
      CustomToast.showSimpleToast(
        msg: tr(context, 'noEnoughData'),
        color: MyColors.primary,
      );
      return;
    }
    // if ((wallets.isNotEmpty &&
    //         transactions.isNotEmpty &&
    //         filteredTransactions.isEmpty &&
    //         statsFormattedDateFrom.isEmpty) ||
    //     (wallets.isNotEmpty &&
    //         transactions.isNotEmpty &&
    //         filteredTransactions.isEmpty &&
    //         statsSelectedPriorities.isEmpty &&
    //         statsPrioritiesList.isNotEmpty)) {
    //   CustomToast.showSimpleToast(
    //     msg: tr(context, 'continueInsertingData'),
    //     color: MyColors.primary,
    //   );
    //   return;
    // }
    // if (statsPrioritiesList.isEmpty ||
    //     wallets.isEmpty ||
    //     transactions.isEmpty) {
    //   CustomToast.showSimpleToast(
    //     msg: tr(context, 'noEnoughData'),
    //     color: MyColors.primary,
    //   );
    //   return;
    // }
    emit(const ReportsState.showReportDetails());
  }

  late DateTimeRange compare1InitialDate =
      DateTimeRange(start: dateTimeNow, end: dateTimeNow);
  late DateTimeRange? compare1SelectedDate;
  String compare1FormattedDateFrom = '';
  String compare1FormattedDateTo = '';
  late DateTimeRange compare2InitialDate =
      DateTimeRange(start: dateTimeNow, end: dateTimeNow);
  late DateTimeRange? compare2SelectedDate;
  String compare2FormattedDateFrom = '';
  String compare2FormattedDateTo = '';

  void changeCompare1DateRange() {
    if (compare1SelectedDate != null &&
        compare1SelectedDate != compare1InitialDate) {
      emit(const ReportsState.initial());
      compare1InitialDate = compare1SelectedDate!;
      List<String> dateParts = compare1SelectedDate.toString().split(' - ');
      compare1FormattedDateFrom = _formatDateTime(dateParts.first);
      compare1FormattedDateTo = _formatDateTime(dateParts.last);
      createCompare1Transactions();
      emit(const ReportsState.changeDate());
    }
  }

  void changeCompare2DateRange() {
    if (compare2SelectedDate != null &&
        compare2SelectedDate != compare2InitialDate) {
      emit(const ReportsState.initial());
      compare2InitialDate = compare2SelectedDate!;
      List<String> dateParts = compare2SelectedDate.toString().split(' - ');
      compare2FormattedDateFrom = _formatDateTime(dateParts.first);
      compare2FormattedDateTo = _formatDateTime(dateParts.last);
      createCompare2Transactions();
      emit(const ReportsState.changeDate());
    }
  }

  void createCompare1Transactions() {
    if (selectedCompare1Wallet.isEmpty
        //  || compare1FormattedDateFrom.isEmpty
        ) {
      return;
    }
    selectedCompare1Transaction = '';
    compare1Transactions = [];
    compare1FilteredTransactions = compare1TransactionsList = transactions
        .where(
          (transaction) => (compare1FormattedDateFrom.isNotEmpty
              ? DateFormat('dd/MM/yyyy', 'en')
                      .parse(transaction.transactionDate!)
                      .isAfter(
                        compare1SelectedDate!.start.subtract(
                          const Duration(days: 1),
                        ),
                      ) &&
                  DateFormat('dd/MM/yyyy', 'en')
                      .parse(transaction.transactionDate!)
                      .isBefore(
                        compare1SelectedDate!.end.add(
                          const Duration(days: 1),
                        ),
                      ) &&
                  transaction.incomeSource!.name == selectedCompare1Wallet
              : transaction.incomeSource!.name == selectedCompare1Wallet),
        )
        .toList();
    compare1Transactions = compare1TransactionsList
        .map((transaction) => transaction.transactionType!.name!)
        .toSet()
        .toList();
  }

  void createCompare2Transactions() {
    if (selectedCompare2Wallet.isEmpty
        // || compare2FormattedDateFrom.isEmpty
        ) {
      return;
    }
    selectedCompare2Transaction = '';
    compare2Transactions = [];
    compare2FilteredTransactions = compare2TransactionsList = transactions
        .where(
          (transaction) => (compare2FormattedDateFrom.isNotEmpty
              ? DateFormat('dd/MM/yyyy', 'en')
                      .parse(transaction.transactionDate!)
                      .isAfter(
                        compare2SelectedDate!.start.subtract(
                          const Duration(days: 1),
                        ),
                      ) &&
                  DateFormat('dd/MM/yyyy', 'en')
                      .parse(transaction.transactionDate!)
                      .isBefore(
                        compare2SelectedDate!.end.add(
                          const Duration(days: 1),
                        ),
                      ) &&
                  transaction.incomeSource!.name == selectedCompare2Wallet
              : transaction.incomeSource!.name == selectedCompare2Wallet),
        )
        .toList();
    compare2Transactions = compare2TransactionsList
        .map((transaction) => transaction.transactionType!.name!)
        .toSet()
        .toList();
  }

  List<AddTransactionModel> compare1TransactionsList = [];
  List<String> compare1Transactions = [];
  late String selectedCompare1Wallet = '';
  void onCompareWallet1Select(String wallet1Value) {
    if (wallet1Value != selectedCompare1Wallet) {
      emit(const ReportsState.initial());
      selectedCompare1Wallet = wallet1Value;
      compare1InitialDate = DateTimeRange(start: dateTimeNow, end: dateTimeNow);
      compare1SelectedDate = null;
      compare1FormattedDateFrom = '';
      compare1FormattedDateTo = '';
      createCompare1Transactions();
      emit(const ReportsState.changeWallet());
    }
  }

  List<AddTransactionModel> compare2TransactionsList = [];
  List<String> compare2Transactions = [];
  late String selectedCompare2Wallet = '';
  void onCompareWallet2Select(String wallet2Value) {
    if (wallet2Value != selectedCompare2Wallet) {
      emit(const ReportsState.initial());
      selectedCompare2Wallet = wallet2Value;
      compare2InitialDate = DateTimeRange(start: dateTimeNow, end: dateTimeNow);
      compare2SelectedDate = null;
      compare2FormattedDateFrom = '';
      compare2FormattedDateTo = '';
      createCompare2Transactions();
      emit(const ReportsState.changeWallet());
    }
  }

  String selectedCompare1Transaction = '';
  late List<AddTransactionModel> compare1FilteredTransactions = List.empty();
  void onCompareTransactions1Select(String selectedTransaction1) {
    if (selectedTransaction1 != selectedCompare1Transaction) {
      emit(const ReportsState.initial());
      selectedCompare1Transaction = selectedTransaction1;
      compare1FilteredTransactions = compare1TransactionsList
          .where((transaction) =>
              transaction.transactionType!.name == selectedTransaction1)
          .toList();
      emit(const ReportsState.statsWalletsSelected());
    }
  }

  String selectedCompare2Transaction = '';
  late List<AddTransactionModel> compare2FilteredTransactions = List.empty();
  void onCompareTransactions2Select(String selectedTransaction2) {
    if (selectedTransaction2 != selectedCompare2Transaction) {
      emit(const ReportsState.initial());
      selectedCompare2Transaction = selectedTransaction2;
      compare2FilteredTransactions = compare2TransactionsList
          .where((transaction) =>
              transaction.transactionType!.name == selectedTransaction2)
          .toList();
      emit(const ReportsState.statsWalletsSelected());
    }
  }

  void showComparison(BuildContext context) {
    if (selectedCompare1Wallet.isEmpty || selectedCompare2Wallet.isEmpty) {
      CustomToast.showSimpleToast(
        msg: tr(context, 'continueInsertingData'),
        color: MyColors.primary,
      );
      return;
    }
    if (compare1FilteredTransactions.isEmpty ||
        compare2FilteredTransactions.isEmpty) {
      CustomToast.showSimpleToast(
        msg: tr(context, 'noEnoughData'),
        color: MyColors.primary,
      );
      return;
    }
    // if ((compare1FormattedDateFrom.isEmpty ||
    //         compare2FormattedDateFrom.isEmpty) ||
    //     (wallets.isNotEmpty &&
    //         (selectedCompare1Wallet.isEmpty ||
    //             selectedCompare2Wallet.isEmpty)) ||
    //     (selectedCompare1Transaction.isEmpty &&
    //         compare1TransactionsList.isNotEmpty) ||
    //     (selectedCompare2Transaction.isEmpty &&
    //         compare2TransactionsList.isNotEmpty)) {
    //   CustomToast.showSimpleToast(
    //     msg: tr(context, 'continueInsertingData'),
    //     color: MyColors.primary,
    //   );
    //   return;
    // }
    // if (compare1FilteredTransactions.isEmpty ||
    //     compare2FilteredTransactions.isEmpty ||
    //     wallets.isEmpty ||
    //     transactions.isEmpty) {
    //   CustomToast.showSimpleToast(
    //     msg: tr(context, 'noEnoughData'),
    //     color: MyColors.primary,
    //   );
    //   return;
    // }
    if (selectedCompare1Transaction.isEmpty &&
        selectedCompare2Transaction.isEmpty &&
        (selectedCompare1Wallet == selectedCompare2Wallet)) {
      CustomToast.showSimpleToast(
        msg: tr(context, 'chooseDifferentWallets'),
        color: MyColors.primary,
      );
      return;
    }
    if (selectedCompare1Transaction.isNotEmpty &&
        selectedCompare2Transaction.isNotEmpty &&
        (selectedCompare1Wallet == selectedCompare2Wallet) &&
        (selectedCompare1Transaction == selectedCompare2Transaction)) {
      CustomToast.showSimpleToast(
        msg: tr(context, 'chooseDifferentWallets'),
        color: MyColors.primary,
      );
      return;
    }
    emit(const ReportsState.showReportDetails());
  }

  String reportExcelPath = '';
  Future<void> generateAndSaveReportExcel({
    required List<ReportCategory> category,
    required BuildContext context,
    bool openFile = false,
  }) async {
    if (context.read<ReportsCubit>().transactions.isEmpty ||
        context.read<ReportsCubit>().categoriesList.isEmpty) {
      CustomToast.showSimpleToast(
        msg: tr(context, 'noRecord'),
        color: MyColors.primary,
      );
      return;
    }
    final xcel.Workbook workbook =
        xcel.Workbook(); // create a new excel workbook
    final xcel.Worksheet sheet = workbook.worksheets[
        0]; // the sheet we will be populating (only the first sheet)
    final String excelFile =
        '${tr(context, 'reports')}-$dateTimeNowFormatted'; // the name of the excel

    /// design how the data in the excel sheet will be presented
    /// you can get the cell to populate by index e.g., (1, 1) or by name e.g., (A1)
    if (reportFormattedDateFrom.isEmpty) {
      sheet.getRangeByIndex(1, 1).setText(dateTimeNowFormatted);
    } else {
      sheet.getRangeByIndex(1, 1).setText(reportFormattedDateFrom);
      sheet.getRangeByIndex(1, 2).setText(tr(context, 'to'));
      sheet.getRangeByIndex(1, 3).setText(reportFormattedDateTo);
    }

    sheet.getRangeByIndex(3, 3).setText(tr(context, 'tableWallet'));
    sheet.getRangeByIndex(3, 4).setText(selectedWallet.isEmpty
        ? tr(context, 'allWallets')
        : selectedWallet == 'all'
            ? tr(context, 'allWallets')
            : selectedWallet);
    // set the titles for the subject results we want to fetch
    sheet.getRangeByIndex(5, 3).setText(tr(context, 'reportCategory'));
    sheet.getRangeByIndex(5, 4).setText(tr(context, 'reportCash'));
    sheet.getRangeByIndex(5, 5).setText('%');

    // loop through the results to set the data in the excel sheet cells
    for (var i = 0; i < category.length; i++) {
      sheet.getRangeByIndex(i + 6, 3).setText(
          tr(context, category[i].title).isNotEmpty
              ? tr(context, category[i].title)
              : category[i].title);
      sheet
          .getRangeByIndex(i + 6, 4)
          .setText(category[i].totalMoney.toStringAsFixed(0));
      sheet.getRangeByIndex(i + 6, 5).setText(
          NumberFormat.percentPattern('en').format(category[i].percentage));
    }
    sheet
        .getRangeByIndex(category.indexOf(category.last) + 8, 3)
        .setText(tr(context, 'reportTotal'));
    sheet
        .getRangeByIndex(category.indexOf(category.last) + 8, 4)
        .setText(allSpentMoney.toStringAsFixed(0));

    // save the document in the downloads file
    final List<int> bytes = workbook.saveAsStream();

    bool dirDownloadExists = true;
    Directory? downloadsDir;
    if (Platform.isIOS) {
      downloadsDir = await getDownloadsDirectory();
    } else {
      downloadsDir = Directory("/storage/emulated/0/Download/");

      dirDownloadExists = await downloadsDir.exists();
      if (dirDownloadExists) {
        downloadsDir = Directory("/storage/emulated/0/Download/");
      } else {
        downloadsDir = Directory("/storage/emulated/0/Downloads/");
      }
    }

    final file =
        await File('${downloadsDir!.path}/$excelFile.xlsx').writeAsBytes(bytes);

    if (openFile) {
      final openResult = await OpenFile.open(file.path);
      if (openResult.type != ResultType.done) {
        // toast message to user
        CustomToast.showSimpleToast(
          msg: context.mounted ? tr(context, 'fileSaved') : '',
          color: MyColors.primary,
        );
      }
    }
    reportExcelPath = file.path;

    //dispose the workbook
    workbook.dispose();
  }

  Future<void> generateAndShareStatsTableExcel({
    required BuildContext context,
  }) async {
    if (statsSelectedWallet.isEmpty) {
      CustomToast.showSimpleToast(
        msg: tr(context, 'continueInsertingData'),
        color: MyColors.primary,
      );
      return;
    }
    if (filteredTransactions.isEmpty ||
        wallets.isEmpty ||
        transactions.isEmpty) {
      CustomToast.showSimpleToast(
        msg: tr(context, 'noEnoughData'),
        color: MyColors.primary,
      );
      return;
    }

    final xcel.Workbook workbook =
        xcel.Workbook(); // create a new excel workbook
    final xcel.Worksheet sheet = workbook.worksheets[
        0]; // the sheet we will be populating (only the first sheet)
    final String excelFile =
        '${tr(context, 'reportDetails')}-$dateTimeNowFormatted'; // the name of the excel

    /// design how the data in the excel sheet will be presented
    /// you can get the cell to populate by index e.g., (1, 1) or by name e.g., (A1)

    sheet.getRangeByIndex(1, 1).setText(statsFormattedDateFrom);
    sheet.getRangeByIndex(1, 2).setText(tr(context, 'to'));
    sheet.getRangeByIndex(1, 3).setText(statsFormattedDateTo);

    sheet.getRangeByIndex(3, 4).setText(tr(context, 'tableWallet'));
    sheet.getRangeByIndex(3, 5).setText(tr(context, 'tableTransaction'));
    sheet.getRangeByIndex(3, 6).setText(tr(context, 'tableSubTransaction'));
    sheet.getRangeByIndex(3, 7).setText(tr(context, 'tableDuration'));
    sheet.getRangeByIndex(3, 8).setText(tr(context, 'tablePriority'));
    sheet.getRangeByIndex(3, 9).setText(tr(context, 'tableAmount'));
    sheet.getRangeByIndex(3, 10).setText(tr(context, 'tableValue'));
    sheet.getRangeByIndex(3, 11).setText(tr(context, 'tableContact'));

    // loop through the results to set the data in the excel sheet cells
    for (var i = 0; i < filteredTransactions.length; i++) {
      sheet.getRangeByIndex(i + 4, 4).setText(
            tr(context, filteredTransactions[i].incomeSource!.name).isEmpty
                ? filteredTransactions[i].incomeSource?.name
                : tr(context, filteredTransactions[i].incomeSource!.name),
          );
      sheet.getRangeByIndex(i + 4, 5).setText(
            tr(context, filteredTransactions[i].transactionType!.name!).isEmpty
                ? filteredTransactions[i].transactionType?.name
                : tr(context, filteredTransactions[i].transactionType!.name!),
          );
      sheet.getRangeByIndex(i + 4, 6).setText(
            tr(context, filteredTransactions[i].transactionContent!.name!)
                    .isEmpty
                ? filteredTransactions[i].transactionContent?.name
                : tr(
                    context, filteredTransactions[i].transactionContent!.name!),
          );
      sheet
          .getRangeByIndex(i + 4, 7)
          .setText(filteredTransactions[i].transactionDate);
      sheet.getRangeByIndex(i + 4, 8).setText(
            tr(context, filteredTransactions[i].priority!.name!).isEmpty
                ? filteredTransactions[i].priority?.name
                : tr(context, filteredTransactions[i].priority!.name!),
          );
      sheet.getRangeByIndex(i + 4, 9).setText(
            tr(
                        context,
                        filteredTransactions[i].unit == null
                            ? ''
                            : filteredTransactions[i].unit!.name!)
                    .isEmpty
                ? filteredTransactions[i].unit?.name
                : tr(context, filteredTransactions[i].unit!.name!),
          );
      sheet.getRangeByIndex(i + 4, 10).setText(
          filteredTransactions[i].total!.formatToDecimal(context: context));
      sheet
          .getRangeByIndex(i + 4, 11)
          .setText(filteredTransactions[i].database?.name);
    }
    // save the document in the downloads file
    final List<int> bytes = workbook.saveAsStream();
    bool dirDownloadExists = true;
    Directory? downloadsDir;
    if (Platform.isIOS) {
      downloadsDir = await getDownloadsDirectory();
    } else {
      downloadsDir = Directory("/storage/emulated/0/Download/");

      dirDownloadExists = await downloadsDir.exists();
      if (dirDownloadExists) {
        downloadsDir = Directory("/storage/emulated/0/Download/");
      } else {
        downloadsDir = Directory("/storage/emulated/0/Downloads/");
      }
    }
    final file =
        await File('${downloadsDir!.path}/$excelFile.xlsx').writeAsBytes(bytes);

    Share.shareXFiles([
      XFile(file.path),
    ]);

    //dispose the workbook
    workbook.dispose();
  }

  Future<void> generateAndShareStatsCompareExcel({
    required BuildContext context,
  }) async {
    if (selectedCompare1Wallet.isEmpty || selectedCompare2Wallet.isEmpty) {
      CustomToast.showSimpleToast(
        msg: tr(context, 'continueInsertingData'),
        color: MyColors.primary,
      );
      return;
    }
    if (compare1FilteredTransactions.isEmpty ||
        compare2FilteredTransactions.isEmpty) {
      CustomToast.showSimpleToast(
        msg: tr(context, 'noEnoughData'),
        color: MyColors.primary,
      );
      return;
    }
    if (selectedCompare1Transaction.isEmpty &&
        selectedCompare2Transaction.isEmpty &&
        (selectedCompare1Wallet == selectedCompare2Wallet)) {
      CustomToast.showSimpleToast(
        msg: tr(context, 'chooseDifferentWallets'),
        color: MyColors.primary,
      );
      return;
    }
    if (selectedCompare1Transaction.isNotEmpty &&
        selectedCompare2Transaction.isNotEmpty &&
        (selectedCompare1Wallet == selectedCompare2Wallet) &&
        (selectedCompare1Transaction == selectedCompare2Transaction)) {
      CustomToast.showSimpleToast(
        msg: tr(context, 'chooseDifferentWallets'),
        color: MyColors.primary,
      );
      return;
    }
    final xcel.Workbook workbook =
        xcel.Workbook(); // create a new excel workbook
    final xcel.Worksheet sheet = workbook.worksheets[
        0]; // the sheet we will be populating (only the first sheet)
    final String excelFile =
        '${tr(context, 'reportDetails')}-$dateTimeNowFormatted'; // the name of the excel

    /// design how the data in the excel sheet will be presented
    /// you can get the cell to populate by index e.g., (1, 1) or by name e.g., (A1)

    sheet.getRangeByIndex(1, 2).setText(compare1FormattedDateFrom);
    sheet.getRangeByIndex(1, 3).setText(tr(context, 'to'));
    sheet.getRangeByIndex(1, 4).setText(compare1FormattedDateTo);

    sheet.getRangeByIndex(3, 3).setText(tr(context, 'firstChosen'));

    sheet.getRangeByIndex(5, 2).setText(tr(context, 'duration'));
    sheet.getRangeByIndex(5, 3).setText(tr(context, 'wallet'));
    sheet.getRangeByIndex(5, 4).setText(tr(context, 'statsTransactions'));

    // loop through the results to set the data in the excel sheet cells
    for (var i = 0; i < compare1FilteredTransactions.length; i++) {
      sheet
          .getRangeByIndex(i + 6, 2)
          .setText(compare1FilteredTransactions[i].transactionDate);
      sheet.getRangeByIndex(i + 6, 3).setText(
            tr(context, compare1FilteredTransactions[i].incomeSource!.name)
                    .isEmpty
                ? compare1FilteredTransactions[i].incomeSource?.name
                : tr(context,
                    compare1FilteredTransactions[i].incomeSource!.name),
          );
      sheet.getRangeByIndex(i + 6, 4).setText(
            tr(
                        context,
                        compare1FilteredTransactions[i]
                            .transactionContent!
                            .name!)
                    .isEmpty
                ? compare1FilteredTransactions[i].transactionContent?.name
                : tr(context,
                    compare1FilteredTransactions[i].transactionContent!.name!),
          );
    }

    sheet
        .getRangeByIndex(
            compare1FilteredTransactions
                    .indexOf(compare1FilteredTransactions.last) +
                9,
            2)
        .setText(compare2FormattedDateFrom);
    sheet
        .getRangeByIndex(
            compare1FilteredTransactions
                    .indexOf(compare1FilteredTransactions.last) +
                9,
            3)
        .setText(tr(context, 'to'));
    sheet
        .getRangeByIndex(
            compare1FilteredTransactions
                    .indexOf(compare1FilteredTransactions.last) +
                9,
            4)
        .setText(compare2FormattedDateTo);

    sheet
        .getRangeByIndex(
            compare1FilteredTransactions
                    .indexOf(compare1FilteredTransactions.last) +
                11,
            3)
        .setText(tr(context, 'secondChosen'));

    sheet
        .getRangeByIndex(
            compare1FilteredTransactions
                    .indexOf(compare1FilteredTransactions.last) +
                13,
            2)
        .setText(tr(context, 'duration'));
    sheet
        .getRangeByIndex(
            compare1FilteredTransactions
                    .indexOf(compare1FilteredTransactions.last) +
                13,
            3)
        .setText(tr(context, 'wallet'));
    sheet
        .getRangeByIndex(
            compare1FilteredTransactions
                    .indexOf(compare1FilteredTransactions.last) +
                13,
            4)
        .setText(tr(context, 'statsTransactions'));

    // loop through the results to set the data in the excel sheet cells
    for (var i = 0; i < compare2FilteredTransactions.length; i++) {
      sheet
          .getRangeByIndex(
              i +
                  compare1FilteredTransactions
                      .indexOf(compare1FilteredTransactions.last) +
                  14,
              2)
          .setText(compare2FilteredTransactions[i].transactionDate);
      sheet
          .getRangeByIndex(
              i +
                  compare1FilteredTransactions
                      .indexOf(compare1FilteredTransactions.last) +
                  14,
              3)
          .setText(
            tr(context, compare2FilteredTransactions[i].incomeSource!.name)
                    .isEmpty
                ? compare2FilteredTransactions[i].incomeSource?.name
                : tr(context,
                    compare2FilteredTransactions[i].incomeSource!.name),
          );
      sheet
          .getRangeByIndex(
              i +
                  compare1FilteredTransactions
                      .indexOf(compare1FilteredTransactions.last) +
                  14,
              4)
          .setText(
            tr(
                        context,
                        compare2FilteredTransactions[i]
                            .transactionContent!
                            .name!)
                    .isEmpty
                ? compare2FilteredTransactions[i].transactionContent?.name
                : tr(context,
                    compare2FilteredTransactions[i].transactionContent!.name!),
          );
    }
    // save the document in the downloads file
    final List<int> bytes = workbook.saveAsStream();
    bool dirDownloadExists = true;
    Directory? downloadsDir;
    if (Platform.isIOS) {
      downloadsDir = await getDownloadsDirectory();
    } else {
      downloadsDir = Directory("/storage/emulated/0/Download/");

      dirDownloadExists = await downloadsDir.exists();
      if (dirDownloadExists) {
        downloadsDir = Directory("/storage/emulated/0/Download/");
      } else {
        downloadsDir = Directory("/storage/emulated/0/Downloads/");
      }
    }
    final file =
        await File('${downloadsDir!.path}/$excelFile.xlsx').writeAsBytes(bytes);

    Share.shareXFiles([
      XFile(file.path),
    ]);

    //dispose the workbook
    workbook.dispose();
  }
}
