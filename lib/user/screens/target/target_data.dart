part of 'target_imports.dart';

class TargetData{
  TransactionModel model = TransactionModel(
    name: "الاهداف المالية المستهدفة",
  );

  GenericBloc<List<AddTransactionModel>> addTransactionCubit = GenericBloc([]);

  List<AddTransactionModel> addTransactionList = [];

  Future<void> initData(TransactionModel model) async {
    final box = await Hive.openBox<TransactionTypeModel>("targetBox");
    var boxItems = box.values.cast<TransactionTypeModel>().toList();
    var content = model.content;
    for (var item in content!) {
      // Check if the name of the item in list1 is not equal to any name in list2
      if (!boxItems.any((element) => element.name == item.name)) {
        // Add the item to list2
        box.add(item);
      }
    }
    getTargets();
    transactionType = box.values.cast<TransactionTypeModel>().toList();
    transactionTypeCubit.onUpdateData(transactionType);
    await box.close();

  }

  List<TransactionTypeModel> transactionType = [];

  GenericBloc<List<TransactionTypeModel>> transactionTypeCubit =
  GenericBloc([]);

  Future<void> getTargets() async {
    final box = await Hive.openBox<TransactionTypeModel>("targetBox");
    try {
      var list = box.values.map((dynamic value) {
        if (value is TransactionTypeModel) {
          return value;
        } else {
          return TransactionTypeModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
      transactionType.addAll(list);
      transactionTypeCubit.onUpdateData(transactionType);
    } catch (e) {
      print('Error fetching data from Hive: $e');
    } finally {
      await box.close();
    }
  }

  Future<void> fetchData() async {
    addTransactionList.clear();
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

  TextEditingController typeNameController = TextEditingController();

  addTransactionType(TransactionTypeModel model) async {
    final box = await Hive.openBox<TransactionTypeModel>("targetBox");
    box.add(model);
    print(box.values.length);
    print('success');
    transactionType = box.values.cast<TransactionTypeModel>().toList();
    transactionTypeCubit.onUpdateData(transactionType);
    print(transactionType[1].name);

  }

  addTransactionModel(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      context: context,
      builder: (context) => SizedBox(
          height: 550.h,
          child: BuildAddTarget(
            data: this,
          )),
    );
  }

}
