import 'dart:io';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/general/utilities/utils_functions/decimal_format.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/reports/statistics/widgets/chart/chart_pdf_page.dart';
import 'package:expenses/user/screens/reports/statistics/widgets/compare/compare_pdf_page.dart';
import 'package:expenses/user/screens/reports/statistics/widgets/table/table_pdf_page.dart';
import 'package:expenses/user/screens/reports/widgets/report_pdf_page.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
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

  String filePathDate() {
    final DateTime dateNow = DateTime.now();
    return '${dateNow.day}-${dateNow.month}-${dateNow.year}_${dateNow.hour}-${dateNow.minute}-${dateNow.second}';
  }

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
      getUserTotalMoney(wallets, transactions);
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
      if (transaction.transactionName == 'الاهداف المالية المستهدفة') {
        total += transaction.initialValue!;
      } else {
        total += double.parse(transaction.total!);
      }
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

  int selectedValueIndex = -1;
  void changeMainWallet(WalletModel? wallet) {
    if (wallet != null && wallet.name != selectedWallet) {
      emit(const ReportsState.initial());
      selectedWallet = wallet.name;
      selectedValueIndex = wallets.indexOf(wallet);
      reportFilteredTransactions = transactions
          .where(
              (transaction) => transaction.incomeSource!.name == selectedWallet)
          .toList();
      getUserTotalMoney(
          [wallets.firstWhere((wallet) => wallet.name == selectedWallet)],
          reportFilteredTransactions);

      createSpentMoneyPercentage();
      createResidualMoneyPercentage();
      emit(const ReportsState.changeWallet());
    } else {
      if (selectedWallet.isNotEmpty) {
        emit(const ReportsState.initial());
        selectedWallet = '';
        selectedValueIndex = -1;
        reportFilteredTransactions = transactions;
        getUserTotalMoney(wallets, reportFilteredTransactions);
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
      if (transaction.transactionName == 'الاهداف المالية المستهدفة') {
        totalMoney += transaction.initialValue!;
      } else {
        totalMoney += double.parse(transaction.total!);
      }
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

  List<PdfColor> randomPDFColors = [
    PdfColors.deepOrangeAccent,
    PdfColors.yellow,
    PdfColors.green,
    PdfColors.orange,
    PdfColors.blue,
    PdfColors.purple,
    PdfColors.teal,
    PdfColors.pink,
    PdfColors.indigo,
    PdfColors.brown,
    PdfColors.grey,
    PdfColors.cyan,
    PdfColors.amber,
    PdfColors.deepPurple,
    PdfColors.lime,
    PdfColors.lightBlue,
    PdfColors.deepOrange,
    PdfColors.lightGreen,
    PdfColors.blueGrey,
    PdfColors.lightGreenAccent,
    PdfColors.indigoAccent,
    PdfColors.red,
    PdfColors.tealAccent,
    PdfColors.purpleAccent,
    PdfColors.deepOrangeAccent,
    PdfColors.yellow,
    PdfColors.green,
    PdfColors.orange,
    PdfColors.blue,
    PdfColors.purple,
    PdfColors.teal,
    PdfColors.pink,
    PdfColors.indigo,
    PdfColors.brown,
    PdfColors.grey,
    PdfColors.cyan,
    PdfColors.amber,
    PdfColors.deepPurple,
    PdfColors.lime,
    PdfColors.lightBlue,
    PdfColors.deepOrange,
    PdfColors.lightGreen,
    PdfColors.blueGrey,
    PdfColors.lightGreenAccent,
    PdfColors.indigoAccent,
    PdfColors.red,
    PdfColors.tealAccent,
    PdfColors.purpleAccent,
    PdfColors.deepOrangeAccent,
    PdfColors.yellow,
    PdfColors.green,
    PdfColors.orange,
    PdfColors.blue,
    PdfColors.purple,
    PdfColors.teal,
    PdfColors.pink,
    PdfColors.indigo,
    PdfColors.brown,
    PdfColors.grey,
    PdfColors.cyan,
    PdfColors.amber,
    PdfColors.deepPurple,
    PdfColors.lime,
    PdfColors.lightBlue,
    PdfColors.deepOrange,
    PdfColors.lightGreen,
    PdfColors.blueGrey,
    PdfColors.lightGreenAccent,
    PdfColors.indigoAccent,
    PdfColors.red,
    PdfColors.tealAccent,
    PdfColors.purpleAccent,
    PdfColors.deepOrangeAccent,
    PdfColors.yellow,
    PdfColors.green,
    PdfColors.orange,
    PdfColors.blue,
    PdfColors.purple,
    PdfColors.teal,
    PdfColors.pink,
    PdfColors.indigo,
    PdfColors.brown,
    PdfColors.grey,
    PdfColors.cyan,
    PdfColors.amber,
    PdfColors.deepPurple,
    PdfColors.lime,
    PdfColors.lightBlue,
    PdfColors.deepOrange,
    PdfColors.lightGreen,
    PdfColors.blueGrey,
    PdfColors.lightGreenAccent,
    PdfColors.indigoAccent,
    PdfColors.red,
    PdfColors.tealAccent,
    PdfColors.purpleAccent,
    PdfColors.deepOrangeAccent,
    PdfColors.yellow,
    PdfColors.green,
    PdfColors.orange,
    PdfColors.blue,
    PdfColors.purple,
    PdfColors.teal,
    PdfColors.pink,
    PdfColors.indigo,
    PdfColors.brown,
    PdfColors.grey,
    PdfColors.cyan,
    PdfColors.amber,
    PdfColors.deepPurple,
    PdfColors.lime,
    PdfColors.lightBlue,
    PdfColors.deepOrange,
    PdfColors.lightGreen,
    PdfColors.blueGrey,
    PdfColors.lightGreenAccent,
    PdfColors.indigoAccent,
    PdfColors.red,
    PdfColors.tealAccent,
    PdfColors.purpleAccent,
    PdfColors.deepOrangeAccent,
    PdfColors.yellow,
    PdfColors.green,
    PdfColors.orange,
    PdfColors.blue,
    PdfColors.purple,
    PdfColors.teal,
    PdfColors.pink,
    PdfColors.indigo,
    PdfColors.brown,
    PdfColors.grey,
    PdfColors.cyan,
    PdfColors.amber,
    PdfColors.deepPurple,
    PdfColors.lime,
    PdfColors.lightBlue,
    PdfColors.deepOrange,
    PdfColors.lightGreen,
    PdfColors.blueGrey,
    PdfColors.lightGreenAccent,
    PdfColors.indigoAccent,
    PdfColors.red,
    PdfColors.tealAccent,
    PdfColors.purpleAccent,
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
  void onWalletSelect(context, String selectedWallet) {
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
      filteredTransactions = statsPrioritiesList = statsSubTransactionsList =
          beforeDatesFilteredTransactions = statsTransactionsList = transactions
              .where((transaction) =>
                  transaction.incomeSource!.name == selectedWallet)
              .toList();
      statsTransactions = statsTransactionsList
          .map((transaction) => transaction.transactionType!.name!)
          .toSet()
          .toList();
      statsSubTransactions = statsSubTransactionsList
          .map((transaction) => transaction.transactionContent != null
              ? transaction.transactionContent!.name!
              : transaction.transactionType!.name!)
          .toSet()
          .toList();
      statsPriorities = statsPrioritiesList
          .map((transaction) => transaction.priority != null
              ? transaction.priority!.name!
              : tr(context, 'nothing'))
          .toSet()
          .toList();
      emit(const ReportsState.statsWalletsSelected());
    }
  }

  void changeStatsDateFrom(context) {
    if (statsSelectedDateFrom != null) {
      emit(const ReportsState.initial());
      statsSelectedTransaction = '';
      statsTransactions = [];
      statsTransactionsList = [];
      statsSelectedSubTransaction = '';
      statsSubTransactions = [];
      statsSubTransactionsList = [];
      statsSelectedPriorities = '';
      statsPriorities = [];
      statsPrioritiesList = [];
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
      changeStatsDateTo(context);
      emit(const ReportsState.changeDate());
      return;
    }
    statsSelectedDateFrom ??= statsFormattedDateFrom.isEmpty
        ? dateTimeNow
        : DateFormat('dd/MM/yyyy').parse(statsFormattedDateFrom);
  }

  void changeStatsDateTo(context) {
    if (statsSelectedDateTo != null) {
      emit(const ReportsState.initial());
      statsSelectedTransaction = '';
      statsTransactions = [];
      statsTransactionsList = [];
      statsSelectedSubTransaction = '';
      statsSubTransactions = [];
      statsSubTransactionsList = [];
      statsSelectedPriorities = '';
      statsPriorities = [];
      statsPrioritiesList = [];
      filteredTransactions = [];
      statsFormattedDateTo =
          DateFormat('dd/MM/yyyy').format(statsSelectedDateTo!);
      filteredTransactions = statsPrioritiesList = statsSubTransactionsList =
          statsTransactionsList = beforeDatesFilteredTransactions
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
      statsTransactions = statsTransactionsList
          .map((transaction) => transaction.transactionType!.name!)
          .toSet()
          .toList();
      statsSubTransactions = statsSubTransactionsList
          .map((transaction) => transaction.transactionContent != null
              ? transaction.transactionContent!.name!
              : transaction.transactionType!.name!)
          .toSet()
          .toList();
      statsPriorities = statsPrioritiesList
          .map((transaction) => transaction.priority != null
              ? transaction.priority!.name!
              : tr(context, 'nothing'))
          .toSet()
          .toList();
      emit(const ReportsState.changeDate());
      return;
    }
    statsSelectedDateTo ??= statsFormattedDateTo.isEmpty
        ? statsSelectedDateFrom
        : DateFormat('dd/MM/yyyy').parse(statsFormattedDateTo);
  }

  String statsSelectedTransaction = '';
  void onTransactionsSelect(context, String selectedTransaction) {
    if (selectedTransaction != statsSelectedTransaction) {
      emit(const ReportsState.initial());
      statsSelectedTransaction = selectedTransaction;
      statsSelectedSubTransaction = '';
      statsSubTransactions = [];
      statsSubTransactionsList = [];
      statsSelectedPriorities = '';
      statsPriorities = [];
      statsPrioritiesList = [];
      filteredTransactions = [];
      filteredTransactions = statsPrioritiesList = statsSubTransactionsList =
          statsTransactionsList
              .where((transaction) =>
                  transaction.transactionType!.name == selectedTransaction)
              .toList();
      statsSubTransactions = statsSubTransactionsList
          .map((transaction) => transaction.transactionContent != null
              ? transaction.transactionContent!.name!
              : transaction.transactionType!.name!)
          .toSet()
          .toList();
      statsPriorities = statsPrioritiesList
          .map((transaction) => transaction.priority != null
              ? transaction.priority!.name!
              : tr(context, 'nothing'))
          .toSet()
          .toList();
      emit(const ReportsState.statsWalletsSelected());
    }
  }

  String statsSelectedSubTransaction = '';
  void onSubTransactionsSelect(context, String selectedSubTransaction) {
    if (selectedSubTransaction != statsSelectedSubTransaction) {
      emit(const ReportsState.initial());
      statsSelectedSubTransaction = selectedSubTransaction;
      statsSelectedPriorities = '';
      statsPriorities = [];
      statsPrioritiesList = [];
      filteredTransactions = [];
      filteredTransactions = statsPrioritiesList = statsSubTransactionsList
          .where((transaction) =>
              (transaction.transactionContent != null
                  ? transaction.transactionContent!.name!
                  : transaction.transactionType!.name!) ==
              selectedSubTransaction)
          .toList();
      statsPriorities = statsPrioritiesList
          .map((transaction) => transaction.priority != null
              ? transaction.priority!.name!
              : tr(context, 'nothing'))
          .toSet()
          .toList();
      emit(const ReportsState.statsWalletsSelected());
    }
  }

  String statsSelectedPriorities = '';
  void onPrioritiesSelect(context, String selectedPriority) {
    if (selectedPriority != statsSelectedPriorities) {
      emit(const ReportsState.initial());
      statsSelectedPriorities = selectedPriority;
      if (selectedPriority != tr(context, 'nothing')) {
        filteredTransactions = statsPrioritiesList
            .where((transaction) =>
                transaction.priority!.name! == selectedPriority)
            .toList();
      }
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
    final xcel.Style style = workbook.styles.add('Style1');
    style.hAlign = xcel.HAlignType.center;
    sheet.getRangeByName('A1:Z200').cellStyle = style;
    sheet.getRangeByName('A1:Z200').columnWidth = 16;

    final String excelFile =
        '${tr(context, 'reports')}-${filePathDate()}'; // the name of the excel
    /// design how the data in the excel sheet will be presented
    /// you can get the cell to populate by index e.g., (1, 1) or by name e.g., (A1)
    sheet.getRangeByIndex(2, 2).setText(dateTimeNowFormatted);
    sheet.getRangeByName('D1').setText(tr(context, 'reports'));

    sheet.getRangeByIndex(3, 3).setText(tr(context, 'source'));
    sheet.getRangeByIndex(3, 4).setText(selectedWallet.isEmpty
        ? tr(context, 'all')
        : selectedWallet == 'all'
            ? tr(context, 'all')
            : selectedWallet);
    sheet.getRangeByIndex(4, 3).setText(tr(context, 'duration'));
    if (reportFormattedDateFrom.isEmpty) {
      sheet.getRangeByIndex(4, 4).setText(tr(context, 'all'));
    } else {
      sheet.getRangeByIndex(4, 4).setText(reportFormattedDateFrom);
      sheet.getRangeByIndex(4, 5).setText(tr(context, 'to'));
      sheet.getRangeByIndex(4, 6).setText(reportFormattedDateTo);
    }
    // set the titles for the subject results we want to fetch
    sheet.getRangeByIndex(6, 3).setText(tr(context, 'reportCategory'));
    sheet.getRangeByIndex(6, 4).setText(tr(context, 'reportCash'));
    sheet.getRangeByIndex(6, 5).setText('%');

    // loop through the results to set the data in the excel sheet cells
    for (var i = 0; i < categoriesList.length; i++) {
      sheet.getRangeByIndex(i + 7, 3).setText(
          tr(context, categoriesList[i].title).isNotEmpty
              ? tr(context, categoriesList[i].title)
              : categoriesList[i].title);
      sheet.getRangeByIndex(i + 7, 4).setText(categoriesList[i]
          .totalMoney
          .toString()
          .formatToDecimal(context: context));
      sheet.getRangeByIndex(i + 7, 5).setText(NumberFormat.percentPattern('en')
          .format(categoriesList[i].percentage));
    }
    sheet
        .getRangeByIndex(categoriesList.indexOf(categoriesList.last) + 9, 3)
        .setText(tr(context, 'reportTotal'));
    sheet
        .getRangeByIndex(categoriesList.indexOf(categoriesList.last) + 9, 4)
        .setText(residualMoney.toString().formatToDecimal(context: context));
    sheet
        .getRangeByIndex(categoriesList.indexOf(categoriesList.last) + 10, 3)
        .setText(tr(context, 'reportTotalResidual'));
    sheet
        .getRangeByIndex(categoriesList.indexOf(categoriesList.last) + 10, 4)
        .setText(allSpentMoney.toString().formatToDecimal(context: context));
    sheet
        .getRangeByIndex(categoriesList.indexOf(categoriesList.last) + 11, 3)
        .setText(tr(context, 'totalSources'));
    sheet
        .getRangeByIndex(categoriesList.indexOf(categoriesList.last) + 11, 4)
        .setText(totalMoney.toString().formatToDecimal(context: context));

    sheet.tableCollection.create(
        'Table',
        sheet.getRangeByIndex(
            6, 3, categoriesList.indexOf(categoriesList.last) + 7, 5));

    final ByteData data = await rootBundle.load(Res.logo);
    final List<int> imageBytes = data.buffer.asUint8List();
    sheet.pictures.addStream(1, 1, imageBytes);
    final xcel.Picture picture = sheet.pictures[0];
    picture.height = 60;
    picture.width = 60;

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
        await File('${downloadsDir!.path}$excelFile.xlsx').writeAsBytes(bytes);

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
    final xcel.Style style = workbook.styles.add('Style1');
    style.hAlign = xcel.HAlignType.center;
    sheet.getRangeByName('A1:Z200').cellStyle = style;
    sheet.getRangeByName('A1:Z200').columnWidth = 16;

    final String excelFile =
        '${tr(context, 'reportDetails')}-${filePathDate()}'; // the name of the excel

    /// design how the data in the excel sheet will be presented
    /// you can get the cell to populate by index e.g., (1, 1) or by name e.g., (A1)
    sheet.getRangeByIndex(2, 2).setText(dateTimeNowFormatted);
    sheet.getRangeByName('F1').setText(tr(context, 'reportDetails'));

    sheet.getRangeByIndex(3, 6).setText(tr(context, 'duration'));
    if (statsFormattedDateFrom.isEmpty) {
      sheet.getRangeByIndex(3, 7).setText(tr(context, 'all'));
    } else {
      sheet.getRangeByIndex(3, 7).setText(statsFormattedDateFrom);
      sheet.getRangeByIndex(3, 8).setText(tr(context, 'to'));
      sheet.getRangeByIndex(3, 9).setText(statsFormattedDateTo);
    }

    sheet.getRangeByIndex(5, 3).setText(tr(context, 'tableWallet'));
    sheet.getRangeByIndex(5, 4).setText(tr(context, 'tableTransaction'));
    sheet.getRangeByIndex(5, 5).setText(tr(context, 'tableSubTransaction'));
    sheet.getRangeByIndex(5, 6).setText(tr(context, 'tableDuration'));
    sheet.getRangeByIndex(5, 7).setText(tr(context, 'tablePriority'));
    sheet.getRangeByIndex(5, 8).setText(tr(context, 'tableAmount'));
    sheet.getRangeByIndex(5, 9).setText(tr(context, 'tableValue'));
    sheet.getRangeByIndex(5, 10).setText(tr(context, 'tableContact'));

    // loop through the results to set the data in the excel sheet cells
    final excelSortedTransactions = filteredTransactions
      ..sort(
        (a, b) => DateFormat('dd/MM/yyyy', 'en')
            .parse(b.transactionDate!)
            .compareTo(
                DateFormat('dd/MM/yyyy', 'en').parse(a.transactionDate!)),
      );
    for (var i = 0; i < excelSortedTransactions.length; i++) {
      sheet.getRangeByIndex(i + 6, 3).setText(
            tr(context, excelSortedTransactions[i].incomeSource!.name).isEmpty
                ? excelSortedTransactions[i].incomeSource?.name
                : tr(context, excelSortedTransactions[i].incomeSource!.name),
          );
      sheet.getRangeByIndex(i + 6, 4).setText(
            tr(context, excelSortedTransactions[i].transactionType!.name!)
                    .isEmpty
                ? excelSortedTransactions[i].transactionType?.name
                : tr(
                    context, excelSortedTransactions[i].transactionType!.name!),
          );
      sheet.getRangeByIndex(i + 6, 5).setText(
            excelSortedTransactions[i].transactionContent != null
                ? tr(
                            context,
                            excelSortedTransactions[i]
                                .transactionContent!
                                .name!)
                        .isEmpty
                    ? excelSortedTransactions[i].transactionContent?.name
                    : tr(context,
                        excelSortedTransactions[i].transactionContent!.name!)
                : tr(context, excelSortedTransactions[i].transactionType!.name!)
                        .isEmpty
                    ? excelSortedTransactions[i].transactionType?.name
                    : tr(context,
                        excelSortedTransactions[i].transactionType!.name!),
          );
      sheet
          .getRangeByIndex(i + 6, 6)
          .setText(excelSortedTransactions[i].transactionDate);
      sheet.getRangeByIndex(i + 6, 7).setText(
            excelSortedTransactions[i].priority != null
                ? tr(context, excelSortedTransactions[i].priority!.name!)
                        .isEmpty
                    ? excelSortedTransactions[i].priority?.name
                    : tr(context, excelSortedTransactions[i].priority!.name!)
                : tr(context, 'nothing'),
          );
      sheet.getRangeByIndex(i + 6, 8).setText(
            tr(
                        context,
                        excelSortedTransactions[i].unit == null
                            ? ''
                            : excelSortedTransactions[i].unit!.name!)
                    .isEmpty
                ? excelSortedTransactions[i].unit?.name
                : tr(context, excelSortedTransactions[i].unit!.name!),
          );
      sheet.getRangeByIndex(i + 6, 9).setText(
          excelSortedTransactions[i].total!.formatToDecimal(context: context));
      sheet
          .getRangeByIndex(i + 6, 10)
          .setText(excelSortedTransactions[i].database?.name);
    }

    sheet.tableCollection.create(
        'Table',
        sheet.getRangeByIndex(
            5,
            3,
            excelSortedTransactions.indexOf(excelSortedTransactions.last) + 6,
            10));

    final ByteData data = await rootBundle.load(Res.logo);
    final List<int> imageBytes = data.buffer.asUint8List();
    sheet.pictures.addStream(1, 1, imageBytes);
    final xcel.Picture picture = sheet.pictures[0];
    picture.height = 60;
    picture.width = 60;
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
        await File('${downloadsDir!.path}$excelFile.xlsx').writeAsBytes(bytes);

    Share.shareXFiles([
      XFile(file.path),
    ]);

    //dispose the workbook
    workbook.dispose();
  }

  Future<void> generateAndShareStatsChartExcel({
    required BuildContext context,
  }) async {
    if (state is! ShowReportDetails) {
      showDetails(context);
      return;
    }

    final xcel.Workbook workbook =
        xcel.Workbook(); // create a new excel workbook
    final xcel.Worksheet sheet = workbook.worksheets[
        0]; // the sheet we will be populating (only the first sheet)
    final xcel.Style style = workbook.styles.add('Style1');
    style.hAlign = xcel.HAlignType.center;
    sheet.getRangeByName('A1:Z200').cellStyle = style;
    sheet.getRangeByName('A1:Z200').columnWidth = 16;

    final String excelFile =
        '${tr(context, 'reportDetails')}-${filePathDate()}'; // the name of the excel

    /// design how the data in the excel sheet will be presented
    /// you can get the cell to populate by index e.g., (1, 1) or by name e.g., (A1)
    sheet.getRangeByIndex(2, 2).setText(dateTimeNowFormatted);
    sheet.getRangeByName('E1').setText(tr(context, 'reportDetails'));

    sheet.getRangeByIndex(3, 4).setText(tr(context, 'duration'));
    if (statsFormattedDateFrom.isEmpty) {
      sheet.getRangeByIndex(3, 5).setText(tr(context, 'all'));
    } else {
      sheet.getRangeByIndex(3, 5).setText(statsFormattedDateFrom);
      sheet.getRangeByIndex(3, 6).setText(tr(context, 'to'));
      sheet.getRangeByIndex(3, 7).setText(statsFormattedDateTo);
    }

    sheet.getRangeByIndex(4, 4).setText(tr(context, 'source'));
    if (statsSelectedWallet.isEmpty) {
      sheet.getRangeByIndex(4, 5).setText(tr(context, 'all'));
    } else {
      sheet.getRangeByIndex(4, 5).setText(
            tr(context, statsSelectedWallet).isEmpty
                ? statsSelectedWallet
                : tr(context, statsSelectedWallet),
          );
    }

    sheet.getRangeByIndex(5, 4).setText(tr(context, 'transaction'));
    if (statsSelectedTransaction.isEmpty) {
      sheet.getRangeByIndex(5, 5).setText(tr(context, 'all'));
    } else {
      sheet.getRangeByIndex(5, 5).setText(
            tr(context, statsSelectedTransaction).isEmpty
                ? statsSelectedTransaction
                : tr(context, statsSelectedTransaction),
          );
    }

    sheet.getRangeByIndex(6, 4).setText(tr(context, 'tableSubTransaction'));
    if (statsSelectedSubTransaction.isEmpty) {
      sheet.getRangeByIndex(6, 5).setText(tr(context, 'all'));
    } else {
      sheet.getRangeByIndex(6, 5).setText(
            tr(context, statsSelectedSubTransaction).isEmpty
                ? statsSelectedSubTransaction
                : tr(context, statsSelectedSubTransaction),
          );
    }

    sheet.getRangeByIndex(7, 4).setText(tr(context, 'tablePriority'));
    if (statsSelectedPriorities.isEmpty) {
      sheet.getRangeByIndex(7, 5).setText(tr(context, 'all'));
    } else {
      sheet.getRangeByIndex(7, 5).setText(
            tr(context, statsSelectedPriorities).isEmpty
                ? statsSelectedPriorities
                : tr(context, statsSelectedPriorities),
          );
    }

    final ByteData data = await rootBundle.load(Res.logo);
    final List<int> imageBytes = data.buffer.asUint8List();
    sheet.pictures.addStream(1, 1, imageBytes);
    final xcel.Picture picture = sheet.pictures[0];
    picture.height = 60;
    picture.width = 60;

    late Uint8List chartImage;
    if (context.mounted) {
      chartImage = await ReportsCubit.get(context).renderChartAsImage();
    }
    sheet.pictures.addStream(9, 3, chartImage);
    final xcel.Picture picture1 = sheet.pictures[1];
    picture1.height = 500;
    picture1.width = 500;
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
        await File('${downloadsDir!.path}$excelFile.xlsx').writeAsBytes(bytes);

    Share.shareXFiles([
      XFile(file.path),
    ]);

    //dispose the workbook
    workbook.dispose();
  }

  Future<void> generateAndShareStatsCompareExcel({
    required BuildContext context,
  }) async {
    if (state is! ShowReportDetails) {
      showComparison(context);
      return;
    }

    final xcel.Workbook workbook =
        xcel.Workbook(); // create a new excel workbook
    final xcel.Worksheet sheet = workbook.worksheets[
        0]; // the sheet we will be populating (only the first sheet)
    final xcel.Style style = workbook.styles.add('Style1');
    style.hAlign = xcel.HAlignType.center;
    sheet.getRangeByName('A1:Z200').cellStyle = style;
    sheet.getRangeByName('A1:Z200').columnWidth = 16;

    final String excelFile =
        '${tr(context, 'reportDetails')}-${filePathDate()}'; // the name of the excel

    /// design how the data in the excel sheet will be presented
    /// you can get the cell to populate by index e.g., (1, 1) or by name e.g., (A1)
    sheet.getRangeByIndex(2, 2).setText(dateTimeNowFormatted);
    sheet.getRangeByName('G1').setText(tr(context, 'reportDetails'));

    /// design how the data in the excel sheet will be presented
    /// you can get the cell to populate by index e.g., (1, 1) or by name e.g., (A1)

    sheet.getRangeByIndex(3, 4).setText(tr(context, 'firstChosen'));
    sheet.getRangeByIndex(5, 3).setText(tr(context, 'duration'));
    if (compare1FormattedDateFrom.isEmpty) {
      sheet.getRangeByIndex(5, 4).setText(tr(context, 'all'));
    } else {
      sheet.getRangeByIndex(5, 4).setText(compare1FormattedDateFrom);
      sheet.getRangeByIndex(5, 5).setText(tr(context, 'to'));
      sheet.getRangeByIndex(5, 6).setText(compare1FormattedDateTo);
    }
    sheet.getRangeByIndex(6, 3).setText(tr(context, 'transaction'));
    if (selectedCompare1Transaction.isEmpty) {
      sheet.getRangeByIndex(6, 4).setText(tr(context, 'all'));
    } else {
      sheet.getRangeByIndex(6, 4).setText(
            tr(context, selectedCompare1Transaction).isEmpty
                ? selectedCompare1Transaction
                : tr(context, selectedCompare1Transaction),
          );
    }

    sheet.getRangeByIndex(8, 3).setText(tr(context, 'tableDuration'));
    sheet.getRangeByIndex(8, 4).setText(tr(context, 'wallet'));
    sheet.getRangeByIndex(8, 5).setText(tr(context, 'statsTransactions'));

    // loop through the results to set the data in the excel sheet cells
    final excelSortedTransactions1 = compare1FilteredTransactions
      ..sort(
        (a, b) => DateFormat('dd/MM/yyyy', 'en')
            .parse(b.transactionDate!)
            .compareTo(
                DateFormat('dd/MM/yyyy', 'en').parse(a.transactionDate!)),
      );
    for (var i = 0; i < excelSortedTransactions1.length; i++) {
      sheet
          .getRangeByIndex(i + 9, 3)
          .setText(excelSortedTransactions1[i].transactionDate);
      sheet.getRangeByIndex(i + 9, 4).setText(
            tr(context, excelSortedTransactions1[i].incomeSource!.name).isEmpty
                ? excelSortedTransactions1[i].incomeSource?.name
                : tr(context, excelSortedTransactions1[i].incomeSource!.name),
          );
      sheet.getRangeByIndex(i + 9, 5).setText(
            excelSortedTransactions1[i].transactionContent != null
                ? tr(
                            context,
                            excelSortedTransactions1[i]
                                .transactionContent!
                                .name!)
                        .isEmpty
                    ? excelSortedTransactions1[i].transactionContent?.name
                    : tr(context,
                        excelSortedTransactions1[i].transactionContent!.name!)
                : tr(context,
                            excelSortedTransactions1[i].transactionType!.name!)
                        .isEmpty
                    ? excelSortedTransactions1[i].transactionType?.name
                    : tr(context,
                        excelSortedTransactions1[i].transactionType!.name!),
          );
    }

    sheet.tableCollection.create(
        'Table1',
        sheet.getRangeByIndex(
            8,
            3,
            excelSortedTransactions1.indexOf(excelSortedTransactions1.last) + 9,
            5));

    sheet.getRangeByIndex(3, 10).setText(tr(context, 'secondChosen'));
    sheet.getRangeByIndex(5, 9).setText(tr(context, 'duration'));
    if (compare2FormattedDateFrom.isEmpty) {
      sheet.getRangeByIndex(5, 10).setText(tr(context, 'all'));
    } else {
      sheet.getRangeByIndex(5, 10).setText(compare2FormattedDateFrom);
      sheet.getRangeByIndex(5, 11).setText(tr(context, 'to'));
      sheet.getRangeByIndex(5, 12).setText(compare2FormattedDateTo);
    }
    sheet.getRangeByIndex(6, 9).setText(tr(context, 'transaction'));
    if (selectedCompare2Transaction.isEmpty) {
      sheet.getRangeByIndex(6, 10).setText(tr(context, 'all'));
    } else {
      sheet.getRangeByIndex(6, 11).setText(
            tr(context, selectedCompare2Transaction).isEmpty
                ? selectedCompare2Transaction
                : tr(context, selectedCompare2Transaction),
          );
    }

    sheet.getRangeByIndex(8, 9).setText(tr(context, 'tableDuration'));
    sheet.getRangeByIndex(8, 10).setText(tr(context, 'wallet'));
    sheet.getRangeByIndex(8, 11).setText(tr(context, 'statsTransactions'));

    // loop through the results to set the data in the excel sheet cells
    final excelSortedTransactions2 = compare2FilteredTransactions
      ..sort(
        (a, b) => DateFormat('dd/MM/yyyy', 'en')
            .parse(b.transactionDate!)
            .compareTo(
                DateFormat('dd/MM/yyyy', 'en').parse(a.transactionDate!)),
      );
    for (var i = 0; i < excelSortedTransactions2.length; i++) {
      sheet
          .getRangeByIndex(i + 9, 9)
          .setText(excelSortedTransactions2[i].transactionDate);
      sheet.getRangeByIndex(i + 9, 10).setText(
            tr(context, excelSortedTransactions2[i].incomeSource!.name).isEmpty
                ? excelSortedTransactions2[i].incomeSource?.name
                : tr(context, excelSortedTransactions2[i].incomeSource!.name),
          );
      sheet.getRangeByIndex(i + 9, 11).setText(
            excelSortedTransactions2[i].transactionContent != null
                ? tr(
                            context,
                            excelSortedTransactions2[i]
                                .transactionContent!
                                .name!)
                        .isEmpty
                    ? excelSortedTransactions2[i].transactionContent?.name
                    : tr(context,
                        excelSortedTransactions2[i].transactionContent!.name!)
                : tr(context,
                            excelSortedTransactions2[i].transactionType!.name!)
                        .isEmpty
                    ? excelSortedTransactions2[i].transactionType?.name
                    : tr(context,
                        excelSortedTransactions2[i].transactionType!.name!),
          );
    }

    sheet.tableCollection.create(
        'Table2',
        sheet.getRangeByIndex(
            8,
            9,
            excelSortedTransactions2.indexOf(excelSortedTransactions2.last) + 9,
            11));

    final ByteData data = await rootBundle.load(Res.logo);
    final List<int> imageBytes = data.buffer.asUint8List();
    sheet.pictures.addStream(1, 1, imageBytes);
    final xcel.Picture picture = sheet.pictures[0];
    picture.height = 60;
    picture.width = 60;

    late Uint8List chartImage;
    if (context.mounted) {
      chartImage = await ReportsCubit.get(context).renderChartAsImage();
    }
    sheet.pictures.addStream(
        excelSortedTransactions2.indexOf(excelSortedTransactions2.last) + 11,
        5,
        chartImage);
    final xcel.Picture picture1 = sheet.pictures[1];
    picture1.height = 500;
    picture1.width = 500;
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
        await File('${downloadsDir!.path}$excelFile.xlsx').writeAsBytes(bytes);

    Share.shareXFiles([
      XFile(file.path),
    ]);

    //dispose the workbook
    workbook.dispose();
  }

  String reportPdfPath = '';

  Future<void> generateAndSaveReportPDF({
    required BuildContext context,
    bool openFile = false,
  }) async {
    final String pdfFile = '${tr(context, 'reports')}-${filePathDate()}';

    final doc = await generateReportPDF(
      context: context,
      data: categoriesList,
    );

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

    final file = await File('${downloadsDir!.path}$pdfFile.pdf')
        .writeAsBytes(await doc.save());

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
    reportPdfPath = file.path;
  }

  Future<void> generateAndShareStatsTablePDF({
    required BuildContext context,
    // bool openFile = false,
  }) async {
    final String pdfFile = '${tr(context, 'reportDetails')}-${filePathDate()}';

    final doc = await generateAndSaveStatsTablePDF(
      context: context,
      data: filteredTransactions
        ..sort(
          (a, b) => DateFormat('dd/MM/yyyy', 'en')
              .parse(b.transactionDate!)
              .compareTo(
                  DateFormat('dd/MM/yyyy', 'en').parse(a.transactionDate!)),
        ),
    );

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

    final file = await File('${downloadsDir!.path}$pdfFile.pdf')
        .writeAsBytes(await doc.save());

    // if (openFile) {
    //   final openResult = await OpenFile.open(file.path);
    //   if (openResult.type != ResultType.done) {
    //     // toast message to user
    //     CustomToast.showSimpleToast(
    //       msg: context.mounted ? tr(context, 'fileSaved') : '',
    //       color: MyColors.primary,
    //     );
    //   }
    // }

    Share.shareXFiles([
      XFile(file.path),
    ]);
  }

  Future<void> generateAndShareStatsChartPDF({
    required BuildContext context,
    // bool openFile = false,
  }) async {
    if (state is! ShowReportDetails) {
      showDetails(context);
      return;
    }
    final String pdfFile = '${tr(context, 'reportDetails')}-${filePathDate()}';

    final doc = await generateAndSaveChartPDF(context: context);

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

    final file = await File('${downloadsDir!.path}$pdfFile.pdf')
        .writeAsBytes(await doc.save());

    // if (openFile) {
    //   final openResult = await OpenFile.open(file.path);
    //   if (openResult.type != ResultType.done) {
    //     // toast message to user
    //     CustomToast.showSimpleToast(
    //       msg: context.mounted ? tr(context, 'fileSaved') : '',
    //       color: MyColors.primary,
    //     );
    //   }
    // }

    Share.shareXFiles([
      XFile(file.path),
    ]);
  }

  Future<void> generateAndShareComparePDF({
    required BuildContext context,
    // bool openFile = false,
  }) async {
    if (state is! ShowReportDetails) {
      showComparison(context);
      return;
    }
    final String pdfFile = '${tr(context, 'reportDetails')}-${filePathDate()}';

    final doc = await generateAndSaveComparePDF(
      context: context,
      data1: compare1FilteredTransactions
        ..sort(
          (a, b) => DateFormat('dd/MM/yyyy', 'en')
              .parse(b.transactionDate!)
              .compareTo(
                  DateFormat('dd/MM/yyyy', 'en').parse(a.transactionDate!)),
        ),
      data2: compare2FilteredTransactions
        ..sort(
          (a, b) => DateFormat('dd/MM/yyyy', 'en')
              .parse(b.transactionDate!)
              .compareTo(
                  DateFormat('dd/MM/yyyy', 'en').parse(a.transactionDate!)),
        ),
    );

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

    final file = await File('${downloadsDir!.path}$pdfFile.pdf')
        .writeAsBytes(await doc.save());

    // if (openFile) {
    //   final openResult = await OpenFile.open(file.path);
    //   if (openResult.type != ResultType.done) {
    //     // toast message to user
    //     CustomToast.showSimpleToast(
    //       msg: context.mounted ? tr(context, 'fileSaved') : '',
    //       color: MyColors.primary,
    //     );
    //   }
    // }

    Share.shareXFiles([
      XFile(file.path),
    ]);
  }

  final GlobalKey<SfCartesianChartState> cartesianChartKey = GlobalKey();

  Future<Uint8List> renderChartAsImage() async {
    final ui.Image data =
        await cartesianChartKey.currentState!.toImage(pixelRatio: 3.0);
    final ByteData? bytes =
        await data.toByteData(format: ui.ImageByteFormat.png);
    return bytes!.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
  }
}
