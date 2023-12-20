import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

import '../reports_imports.dart';

part 'reports_cubit.freezed.dart';
part 'reports_state.dart';

class ReportsCubit extends Cubit<ReportsState> {
  ReportsCubit() : super(const ReportsState.initial());

  static ReportsCubit get(context) => BlocProvider.of<ReportsCubit>(context);

  final DateTime dateTimeNow = DateTime.now();
  late String dateTimeNowFormatted =
      DateFormat('EEE, dd MMM yyyy', Intl.defaultLocale).format(dateTimeNow);
  DateTime? selectedDate = DateTime.now();
  late String formattedDate =
      DateFormat('EEE, dd MMM yyyy', Intl.defaultLocale).format(dateTimeNow);

  void changeDate() {
    emit(const ReportsState.initial());
    if (selectedDate != null) {
      formattedDate = DateFormat('EEE, dd MMM yyyy', Intl.defaultLocale)
          .format(selectedDate!);
      emit(const ReportsState.changeDate());
      return;
    }
    selectedDate ??=
        DateFormat('EEE, dd MMM yyyy', Intl.defaultLocale).parse(formattedDate);
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
}
