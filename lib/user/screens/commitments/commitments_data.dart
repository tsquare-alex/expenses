part of 'commitments_imports.dart';

class CommitmentsData{
  GenericBloc<List<AddTransactionModel>> addTransactionCubit = GenericBloc([]);

  List<AddTransactionModel> addTransactionList = [];

  TransactionModel model = TransactionModel(
      name: "الالتزامات",
      isSelected: true,
      image: Res.commitment,
      content: [
        TransactionTypeModel(
          name: "فواتير",
          content: [
            TransactionContentModel(
              name: "كهرباء",
            ),
            TransactionContentModel(
              name: "مياه",
            ),
            TransactionContentModel(
              name: "غاز",
            ),
            TransactionContentModel(
              name: "تليفون أرضي",
            ),
            TransactionContentModel(
              name: "رصيد",
            ),
            TransactionContentModel(
              name: "انترنت",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "إيجار",
          content: [
            TransactionContentModel(
              name: "منزل",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "أقساط",
          content: [
            TransactionContentModel(
              name: "موبايل",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "تأمينات",
          content: [
            TransactionContentModel(
              name: "سيارة",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "اشتراكات",
          content: [
            TransactionContentModel(
              name: "نادي",
            ),
            TransactionContentModel(
              name: "جيم",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "مصاريف سيارة",
          content: [
            TransactionContentModel(
              name: "نظافة",
            ),
            TransactionContentModel(
              name: "صيانة",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "تبرعات و اعانات",
          content: [
            TransactionContentModel(
              name: "الهلال الأحمر",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "ادوية",
          content: [
            TransactionContentModel(
              name: "أدوية الضغط",
            ),
          ],
        ),
        TransactionTypeModel(
          name: "مواصلات",
          content: [
            TransactionContentModel(
              name: "سفر",
            ),
          ],
        ),
      ]
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

}