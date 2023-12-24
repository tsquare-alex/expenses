import 'package:hive/hive.dart';
part 'budget_model.g.dart';

@HiveType(typeId: 30)
class BudgetModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String selectTransaction;
  @HiveField(2)
  String selectWallet;
  @HiveField(3)
  String budgetPeriod;
  @HiveField(4)
  String? transactionRepeat;

  BudgetModel(
      {required this.selectTransaction,
      required this.selectWallet,
      required this.budgetPeriod,
      this.transactionRepeat,
      required this.name});
}
