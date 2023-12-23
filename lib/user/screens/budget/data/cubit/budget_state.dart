import 'package:equatable/equatable.dart';

class BudgetState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddBudgetInitial extends BudgetState {}

class AddBudgetLoading extends BudgetState {}

class AddBudgetSuccess extends BudgetState {}

class AddBudgetFaliuer extends BudgetState {}
