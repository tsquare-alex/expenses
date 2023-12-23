part of 'reports_imports.dart';

class ReportsData {}

class TransactionsModel {
  final int id;
  final String title;
  final String time;
  final String cost;

  TransactionsModel({
    required this.id,
    required this.title,
    required this.time,
    required this.cost,
  });
}
