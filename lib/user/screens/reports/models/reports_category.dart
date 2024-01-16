import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class ReportCategory extends Equatable {
  const ReportCategory({
    required this.color,
    required this.title,
    required this.totalMoney,
    required this.percentage,
  });

  final String title;
  final Color color;
  final double percentage;
  final double totalMoney;

  @override
  List<Object> get props => [color, title, totalMoney, percentage];
}
