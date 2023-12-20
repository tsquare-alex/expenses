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
    box.deleteAt(index);
    fetchData();
    if (index != -1) {
    print('Index of the target model: $index');
    } else {
    print('Target model not found in the list.$index');
    }
  }
}
