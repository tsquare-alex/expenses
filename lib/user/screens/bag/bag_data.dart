part of 'bag_imports.dart';

class BagData{

  initialTransaction(BagModel model) async {
    // if (model.name == "الالتزامات") {
    //   final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
    //   var boxItems = box.values.cast<TransactionTypeModel>().toList();
    //   var content = model.content;
    //   for (var item in content!) {
    //     // Check if the name of the item in list1 is not equal to any name in list2
    //     if (!boxItems.any((element) => element.name == item.name)) {
    //       // Add the item to list2
    //       box.add(item);
    //     }
    //   }
    //   fetchData();
    //   transactionType = box.values.cast<TransactionTypeModel>().toList();
    //   print(transactionType[0].content?[0].name);
    //   transactionTypeCubit.onUpdateData(transactionType);
    //   await box.close();
    //}
  }
}
