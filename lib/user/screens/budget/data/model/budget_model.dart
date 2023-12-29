import 'package:hive/hive.dart';
part 'budget_model.g.dart';

@HiveType(typeId: 30)
class BudgetModel extends HiveObject {
  @HiveField(0)
  double value;
  @HiveField(1)
  String selectTransaction;
  @HiveField(2)
  String selectWallet;
  @HiveField(3)
  String budgetPeriod;
  @HiveField(4)
  String? transactionRepeat;
  @HiveField(5)
  double? percentValue;
  @HiveField(6)
  String budgetName;

  BudgetModel(
      {required this.selectTransaction,
      required this.budgetName,
      required this.selectWallet,
      required this.budgetPeriod,
      this.transactionRepeat,
      this.percentValue,
      required this.value});
}
