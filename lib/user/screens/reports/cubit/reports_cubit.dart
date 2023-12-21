import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

import '../../../../general/constants/constants.dart';
import '../../../models/add_transaction_model/add_transaction_model.dart';
import '../../wallet/data/model/wallet_model.dart';
import '../reports_imports.dart';

part 'reports_cubit.freezed.dart';
part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(const ReportsState.initial());

  static ReportsCubit get(context) => BlocProvider.of<ReportsCubit>(context);

  final DateTime dateTimeNow = DateTime.now();
  late String dateTimeNowFormatted =
      DateFormat('EEE, dd MMM yyyy', Intl.defaultLocale).format(dateTimeNow);
  late DateTime? selectedDateFrom = dateTimeNow;
  late DateTime? selectedDateTo = selectedDateFrom!;
  String formattedDateFrom = '';
  String formattedDateTo = '';

  void changeDateFrom() {
    emit(const ReportsState.initial());
    if (selectedDateFrom != null) {
      formattedDateFrom = DateFormat('EEE, dd-MM-yyyy', Intl.defaultLocale)
          .format(selectedDateFrom!);

      if (selectedDateTo!.isBefore(selectedDateFrom!) ||
          formattedDateTo.isEmpty) {
        selectedDateTo = selectedDateFrom;
        if (formattedDateTo.isNotEmpty) {
          formattedDateTo = DateFormat('EEE, dd-MM-yyyy', Intl.defaultLocale)
              .format(selectedDateTo!);
        }
      }

      emit(const ReportsState.changeDate());
      return;
    }
    selectedDateFrom ??= formattedDateFrom.isEmpty
        ? dateTimeNow
        : DateFormat('EEE, dd-MM-yyyy', Intl.defaultLocale)
            .parse(formattedDateFrom);
  }

  void changeDateTo() {
    emit(const ReportsState.initial());
    if (selectedDateTo != null) {
      formattedDateTo = DateFormat('EEE, dd-MM-yyyy', Intl.defaultLocale)
          .format(selectedDateTo!);
      emit(const ReportsState.changeDate());
      return;
    }
    selectedDateTo ??= formattedDateTo.isEmpty
        ? selectedDateFrom
        : DateFormat('EEE, dd-MM-yyyy', Intl.defaultLocale)
            .parse(formattedDateTo);
  }

  final List<TransactionsModel> transactions = [
    TransactionsModel(
      id: 0,
      title: 'Upwork',
      time: 'Today',
      cost: '+ \$ 850.00',
    ),
    TransactionsModel(
      id: 0,
      title: 'Transfer',
      time: 'Today',
      cost: '- \$ 85.00',
    ),
    TransactionsModel(
      id: 0,
      title: 'Paypal',
      time: 'Today',
      cost: '+ \$ 1406.00',
    ),
  ];

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

  final String arLocale = 'ar_EG';

  Map<String, String> statsDetailsOptions = {
    'table': 'استعراض في جدول',
    'chart': 'استعراض في رسم بياني',
    'compare': 'المقارنة بين المعاملات',
  };

  void showDetails() {
    emit(const ReportsState.initial());

    emit(const ReportsState.showReportDetails());
  }

  late List<WalletModel> wallets;
  Future<void> getWalletData(BuildContext context) async {
    var walletBox = Hive.box<WalletModel>(database);
    List<WalletModel> data = walletBox.values.toList();
    wallets = data;
    for (var element in data) {
      print(element.name);
    }
    // return wallets;
  }

  late List<AddTransactionModel> transactionsList;
  Future<void> getTransactionsData(BuildContext context) async {
    final box = await Hive.openBox<AddTransactionModel>('addTransactionBox');
    var transactionsBox = Hive.box<AddTransactionModel>('addTransactionBox');
    List<AddTransactionModel> data = transactionsBox.values.toList();
    box.close();
    transactionsList = data;
    for (var element in data) {
      print(element.total);
    }
    // return transactions;
  }

  Future<void> getReportData(BuildContext context) async {
    await Future.wait([getWalletData(context), getTransactionsData(context)]);
  }
}
