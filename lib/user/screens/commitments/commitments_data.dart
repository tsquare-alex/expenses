part of 'commitments_imports.dart';

class CommitmentsData{


  List<TransactionTypeModel> transactionType = [];

  GenericBloc<List<TransactionTypeModel>> transactionTypeCubit =
  GenericBloc([]);

  TextEditingController nameController = TextEditingController();


  Future<void> initData(TransactionModel model) async {
    final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
    var boxItems = box.values.cast<TransactionTypeModel>().toList();
    var content = model.content;
    for (var item in content!) {
      if (!boxItems.any((element) => element.key != item.key)) {
        box.add(item);
      }
    }
    getCommitments();
    transactionType = box.values.cast<TransactionTypeModel>().toList();
    print(transactionType[0].content?[0].name);
    transactionTypeCubit.onUpdateData(transactionType);
    await box.close();
  }

  Future<void> getCommitments() async {
    final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
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
    }
  }

  GenericBloc<List<AddTransactionModel>> addTransactionCubit = GenericBloc([]);

  List<AddTransactionModel> addTransactionList = [];

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
        if (item.transactionName == "الالتزامات") {
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
          (item) => item.id == targetModel.incomeSource?.id,
    );
    double total = double.parse(targetModel.total!);
    targetWallet.balance = targetWallet.balance + total;
    print("balance ${targetWallet.balance}");
    await walletBox.put(targetWallet.key, targetWallet);
    box.deleteAt(index);
    var boxList = box.values.toList();
    List<AddTransactionModel> newList = [];
    for (AddTransactionModel item in boxList) {
      if (item.transactionName == "الالتزامات") {
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

  addTransactionType(TransactionTypeModel model) async {
    final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
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
          child: BuildAddCommitment(
            data: this,
          )),
    );
  }

}