import 'package:hive/hive.dart';
part 'budget_model.g.dart';

@HiveType(typeId: 8)
class BudgetModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String selectTransaction;
  @HiveField(2)
  String selectWallet;
  @HiveField(3)
  String startBudget;
  @HiveField(4)
  String endBudget;
  @HiveField(5)
  String transactionRepeat;

  BudgetModel(
      {required this.endBudget,
      required this.selectTransaction,
      required this.selectWallet,
      required this.startBudget,
      required this.transactionRepeat,
      required this.name});
}
