import 'package:equatable/equatable.dart';

class ReportCategory extends Equatable {
  const ReportCategory({
    required this.title,
    required this.totalMoney,
    required this.percentage,
  });

  final String title;
  final double percentage;
  final double totalMoney;

  @override
  List<Object> get props => [title, totalMoney, percentage];
}
