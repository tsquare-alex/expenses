part of 'reports_imports.dart';

class ReportsData {
  final DateTime dateTimeNow = DateTime.now();
  DateTime? selectedDate = DateTime.now();
  late String formattedDate =
      DateFormat('EEE, dd MMM yyyy').format(dateTimeNow);

  void changeDate() {
    if (selectedDate != null) {
      formattedDate = DateFormat('EEE, dd MMM yyyy').format(selectedDate!);
      // emit(TaskDateChanged());
      return;
    }
    selectedDate ??= DateFormat('EEE, dd MMM yyyy').parse(formattedDate);
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
}

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