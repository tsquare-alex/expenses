part of 'target_imports.dart';

class TargetData{
  TransactionModel model = TransactionModel(
    name: "الاهداف المالية المستهدفة",
  );

  GenericBloc<List<AddTransactionModel>> addTransactionCubit = GenericBloc([]);

  List<AddTransactionModel> addTransactionList = [];


  Future<void> fetchData() async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    try {
      var list = box.values.map((dynamic value) {
        if (value is AddTransactionModel) {
          return value;
        } else {
          return AddTransactionModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
      for (AddTransactionModel item in list) {
        if (item.transactionName == "الاهداف المالية المستهدفة") {
          addTransactionList.add(item);
        }
      }
      addTransactionCubit.onUpdateData(addTransactionList);
    } catch (e) {
      print('Error fetching data from Hive: $e');
    } finally {
      await box.close();
    }
  }

  Future<void> deleteItem(AddTransactionModel targetModel) async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    // Find the index of the target model in the list
    var modelList =box.values.toList();
    int index = modelList.indexWhere((model) => model.key == targetModel.key);
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    var walletList = walletBox.values.toList();
    WalletModel? targetWallet = walletList.firstWhere(
          (item) => item.name == targetModel.incomeSource?.name,
    );
    double total = double.parse(targetModel.total!);
    targetWallet.balance = targetWallet.balance + total;
    print("balance ${targetWallet.balance}");
    await walletBox.put(targetWallet.key, targetWallet);
    box.deleteAt(index);
    var boxList = box.values.toList();
    List<AddTransactionModel> newList = [];
    for (AddTransactionModel item in boxList) {
      if (item.transactionName == "الاهداف المالية المستهدفة") {
        newList.add(item);
      }
    }
    addTransactionCubit.onUpdateData(newList);
    if (index != -1) {
      print('Index of the target model: $index');
    } else {
      print('Target model not found in the list.');
    }
  }

  double percent =0.0;
  GenericBloc<double> percentCubit = GenericBloc(0.0);

  calculateTargetPrice(AddTransactionModel model,BuildContext context){
    // Calculate and decrement total on a daily basis
    DateTime firstDate = DateFormat("dd MMMM yyyy","en").parse(model.startDate!);
    DateTime lastDate = DateFormat("dd MMMM yyyy","en").parse(model.endDate!);
    double total = double.parse(model.total!);
    if(model.repeated?.name == "يوميا" ){
      int days=lastDate.difference(firstDate).inDays;
      double dailyPrice = total / days;
      percent = dailyPrice > 0 ? dailyPrice / total : 0.0;
      print(percent);
      for (int day = 0; day <= days; day++) {
        DateTime currentDate = firstDate.add(Duration(days: day));
        print(currentDate);
        Timer(
            Duration(days: day),
                () {
              if(currentDate== DateTime.now()){
                var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
                var walletList = walletBox.values.toList();
                WalletModel? targetModel = walletList.firstWhere(
                      (item) => item.name == model.incomeSource?.name,
                );
                targetModel.balance =targetModel.balance-total;
              }
            }
        );
      }
    }else if(model.repeated?.name == "شهريا"){}

  }

}
