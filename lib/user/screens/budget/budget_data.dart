part of 'budget_imports.dart';

class BudgetData {
  List<String> repeatTransaction = [
    "يومياً",
    "اسبوعياً",
    "شهرياً",
    "ربع سنوياً",
    "نصف سنوياً",
    "سنوياً",
  ];

  Future<void> fetchData() async {
    var budgetBox = Hive.box<BudgetModel>("budgetBox");
    var budgetList = budgetBox.values.toList();
  }

  double? totalSalary;
  double? percent;
  Future<double> getPercent(BudgetModel model) async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    var transactions = box.values.toList();
    var budgetTransactions =
        transactions.where((element) => element.budget?.name == model.name);
    totalSalary = budgetTransactions.fold(
        0, (acc, model) => acc! + double.parse(model.total!));
    percent = totalSalary! / model.value;
    var budgetBox = Hive.box<BudgetModel>("budgetBox");
    var budgetList = budgetBox.values.toList();
    var index = budgetList.indexWhere((element) => element == model);
    var key = budgetBox.keyAt(index);
    var item = BudgetModel(
        selectTransaction: model.selectTransaction,
        name: model.name,
        selectWallet: model.selectWallet,
        budgetPeriod: model.budgetPeriod,
        value: model.value,
      percentValue: percent,
    );
    budgetBox.put(key, item);
    print(percent);
    return percent!;
  }
}
