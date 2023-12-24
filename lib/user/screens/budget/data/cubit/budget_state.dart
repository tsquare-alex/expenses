import 'package:equatable/equatable.dart';
import 'package:expenses/user/screens/budget/data/model/budget_model.dart';

class BudgetState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddBudgetInitial extends BudgetState {}

class AddBudgetLoading extends BudgetState {}

class AddBudgetSuccess extends BudgetState {}

class OpenBudget extends BudgetState {}

class SuccessFetchData extends BudgetState {
  final List<BudgetModel> budgets;

  SuccessFetchData({required this.budgets});
}

class AddBudgetFaliuer extends BudgetState {
  final String message;

  AddBudgetFaliuer({required this.message});
}

class BudgetValu extends BudgetState {
  final double value;

  BudgetValu({required this.value});
}
