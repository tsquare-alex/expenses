import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../../models/add_transaction_model/add_transaction_model.dart';
import '../../wallet/data/model/wallet_model.dart';
import '../../wallet/widgets/constants.dart';

part 'reports_cubit.freezed.dart';
part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(const ReportsState.initial());

  static ReportsCubit get(context) => BlocProvider.of<ReportsCubit>(context);

  final DateTime dateTimeNow = DateTime.now();
  late String dateTimeNowFormatted =
      DateFormat('EEE, dd MMM yyyy').format(dateTimeNow);
  late DateTime? selectedDateFrom = dateTimeNow;
  late DateTime? statsSelectedDateFrom = dateTimeNow;
  late DateTime? selectedDateTo = selectedDateFrom!;
  late DateTime? statsSelectedDateTo = selectedDateFrom!;
  String formattedDateFrom = '';
  String statsFormattedDateFrom = '';
  String formattedDateTo = '';
  String statsFormattedDateTo = '';

  void changeDateFrom() {
    emit(const ReportsState.initial());
    if (selectedDateFrom != null) {
      formattedDateFrom =
          DateFormat('EEE, dd-MM-yyyy').format(selectedDateFrom!);

      if (selectedDateTo!.isBefore(selectedDateFrom!) ||
          formattedDateTo.isEmpty) {
        selectedDateTo = selectedDateFrom;
        if (formattedDateTo.isNotEmpty) {
          formattedDateTo =
              DateFormat('EEE, dd-MM-yyyy').format(selectedDateTo!);
        }
      }

      emit(const ReportsState.changeDate());
      return;
    }
    selectedDateFrom ??= formattedDateFrom.isEmpty
        ? dateTimeNow
        : DateFormat('EEE, dd-MM-yyyy').parse(formattedDateFrom);
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

  void changeDateTo() {
    emit(const ReportsState.initial());
    if (selectedDateTo != null) {
      formattedDateTo = DateFormat('EEE, dd-MM-yyyy').format(selectedDateTo!);
      emit(const ReportsState.changeDate());
      return;
    }
    selectedDateTo ??= formattedDateTo.isEmpty
        ? selectedDateFrom
        : DateFormat('EEE, dd-MM-yyyy').parse(formattedDateTo);
  }

  void changeStatsDateTo() {
    emit(const ReportsState.initial());
    if (statsSelectedDateTo != null) {
      statsFormattedDateTo = DateFormat('EEE, dd-MM-yyyy').format(statsSelectedDateTo!);
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
    'table': 'استعراض في جدول',
    'chart': 'استعراض في رسم بياني',
    'compare': 'المقارنة بين المعاملات',
  };

  void showDetails() {
    emit(const ReportsState.initial());

    emit(const ReportsState.showReportDetails());
  }

  late double totalMoney;
  late double spentMoney;
  late double circleChartPercentage;
  late String moneyPercentage;

  double getUserResidualMoney() {
    double total = 0;
    for (var wallet in wallets) {
      total += wallet.balance;
    }
    return total;
  }

  double getUserSpentMoney() {
    double total = 0;
    for (var transaction in transactions) {
      total += double.parse(transaction.total!);
    }
    return spentMoney = total;
  }

  double getUserTotalMoney() {
    return totalMoney = getUserResidualMoney() + getUserSpentMoney();
  }

  late List<WalletModel> wallets;
  Future<void> getWalletData(BuildContext context) async {
    var walletBox = Hive.box<WalletModel>(databaseBox);
    List<WalletModel> data = walletBox.values.toList();
    wallets = data;
  }

  void createMoneyPercentage() {
    getUserTotalMoney();
    circleChartPercentage = spentMoney / totalMoney;
    moneyPercentage = '${(circleChartPercentage * 100).round()}';
  }

  late List<AddTransactionModel> transactions;
  Future<void> getTransactionsData(BuildContext context) async {
    final box = await Hive.openBox<AddTransactionModel>('addTransactionBox');
    var transactionsBox = Hive.box<AddTransactionModel>('addTransactionBox');
    List<AddTransactionModel> data = transactionsBox.values.toList();
    box.close();
    data.sort((a, b) => b.transactionDate!.compareTo(a.transactionDate!));
    transactions = data;
  }

  Future<void> getReportData(BuildContext context) async {
    emit(const ReportsState.reportDataLoading());
    await Future.wait([getWalletData(context), getTransactionsData(context)]);
    createMoneyPercentage();
    emit(const ReportsState.reportDataLoaded());
  }

  Future<void> getStatsData(BuildContext context) async {
    emit(const ReportsState.statsDataLoading());
    await Future.wait([getWalletData(context), getTransactionsData(context)]);
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
    statsSubTransactionsMap = {
      for (var item in statsSubTransactions) item.database!.adjective: false
    };
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
    statsPriorities = transactions
        .where((transaction) =>
            selectedSubTransactions.contains(transaction.database!.adjective))
        .toList();
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
    filteredTransactions = transactions
        .where((transaction) =>
            selectedPriorities.contains(transaction.priority) &&
            selectedSubTransactions.contains(transaction.database!.adjective))
        .toList();

    emit(const ReportsState.statsWalletsSelected());
    print(filteredTransactions);
  }
}
