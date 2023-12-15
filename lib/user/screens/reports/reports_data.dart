part of 'reports_imports.dart';

class ReportsData {
  final DateTime dateTimeNow = DateTime.now();
  DateTime? selectedDate = DateTime.now();
  late String formattedDate =
      DateFormat('EEE, dd MMM yyyy').format(dateTimeNow);

  void changeDate() {
    if (selectedDate != null) {
      formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate!);
      // emit(TaskDateChanged());
      return;
    }
    selectedDate ??= DateTime.parse(formattedDate.split('-').reversed.join(''));
  }
}
