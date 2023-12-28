part of 'transaction_type_imports.dart';

class TransactionTypeData{

  GenericBloc<List<TransactionContentModel>> transactionContentCubit = GenericBloc([]);
  GenericBloc<List<TransactionTypeModel>> transactionTypeCubit = GenericBloc([]);
  List<TransactionTypeModel> transactionType = [];

  initialTransaction(TransactionModel model) async {
      final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
      var boxItems = box.values.cast<TransactionTypeModel>().toList();
      var content = model.content;
      for (var item in content!) {
        // Check if the name of the item in list1 is not equal to any name in list2
        if (!boxItems.any((element) => element.name == item.name)) {
          // Add the item to list2
          box.add(item);
        }
      }
      fetchData();
      transactionType = box.values.cast<TransactionTypeModel>().toList();
      print(transactionType[0].content?[0].name);
      transactionTypeCubit.onUpdateData(transactionType);
      await box.close();
    }

  Future<void> fetchData() async {
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
    } finally {
      await box.close();
    }
  }

  addTransactionType(TransactionTypeModel model, String type) async {
      final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
      box.add(model);
      print(box.values.length);
      print('success');
      transactionType = box.values.cast<TransactionTypeModel>().toList();
      transactionTypeCubit.onUpdateData(transactionType);
      print(transactionType[1].name);

  }

  // addTransactionContent(TransactionContentModel model, String type) async {
  //     final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
  //     int modelIndex =
  //     box.values.toList().indexWhere((model) => model.name == commitmentId);
  //     var transactionType = box.getAt(modelIndex);
  //     print(modelIndex);
  //     transactionType?.content?.add(model);
  //     box.putAt(modelIndex, transactionType!);
  //     transactionContentCubit.onUpdateData(transactionType.content!);
  //     print(transactionType.content?[0].name);
  //     print(box.values.length);
  //     print('success');
  // }
}