part of 'shopping_imports.dart';

class ShoppingData{
  GenericBloc<List<AddTransactionModel>> addTransactionCubit = GenericBloc([]);

  List<AddTransactionModel> addTransactionList = [];

  TransactionModel model = TransactionModel(
    name: "التسوق والشراء",
    image: Res.bag,
    content: [
      TransactionTypeModel(
        name: "سوبر ماركت",
        content: [
          TransactionContentModel(
            name: "خضار",
          ),
          TransactionContentModel(
            name: "فاكهة",
          ),
          TransactionContentModel(
            name: "بقوليات",
          ),
          TransactionContentModel(
            name: "زيوت",
          ),
        ],
      ),
      TransactionTypeModel(
        name: "بقالة",
        content: [
        ],
      ),
      TransactionTypeModel(
        name: "محل",
        content: [
        ],
      ),
      TransactionTypeModel(
        name: "شركة",
        content: [
        ],
      ),
      TransactionTypeModel(
        name: "سوق",
        content: [
        ],
      ),
      TransactionTypeModel(
        name: "مصنع",
        content: [
        ],
      ),
      TransactionTypeModel(
        name: "ورشة",
        content: [
        ],
      ),
      TransactionTypeModel(
        name: "شخص",
        content: [
        ],
      ),
      TransactionTypeModel(
        name: "موقع الأكتروني",
        content: [
        ],
      ),
      TransactionTypeModel(
        name: "فيسبوك",
        content: [
        ],
      ),
      TransactionTypeModel(
        name: "انستجرام",
        content: [
        ],
      ),
      TransactionTypeModel(
        name: "اعلان",
        content: [
        ],
      ),
      TransactionTypeModel(
        name: "تيكتوك",
        content: [
        ],
      ),
      TransactionTypeModel(
        name: "عيادة",
        content: [
        ],
      ),
      TransactionTypeModel(
        name: "مستشفي",
        content: [
        ],
      ),

    ],
  );

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
        if (item.transactionName == "التسوق والشراء") {
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
      if (item.transactionName == "التسوق والشراء") {
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
}