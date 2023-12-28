part of 'bag_imports.dart';

class BagData{

  TextEditingController transactionController = TextEditingController();


  List<DropdownModel> cart = [
    DropdownModel(id: 0, name: "خضار"),
    DropdownModel(id: 1, name: "فاكهة"),
    DropdownModel(id: 2, name: "بقوليات"),
    DropdownModel(id: 3, name: "زيوت"),
  ];

  List<DropdownModel> bagList = [];
  GenericBloc<List<DropdownModel>> bagCubit = GenericBloc([]);
  GenericBloc<DropdownModel?> typeCubit = GenericBloc(null);


  initialTransaction() async {
    final box = await Hive.openBox<DropdownModel>("bagBox");
    var boxItems = box.values.cast<DropdownModel>().toList();
    for (var item in cart) {
      // Check if the name of the item in list1 is not equal to any name in list2
      if (!boxItems.any((element) => element.name == item.name)) {
        // Add the item to list2
        box.add(item);
      }
    }
    fetchBagData();
    bagList = box.values.cast<DropdownModel>().toList();
    print(bagList[0].name);
    bagCubit.onUpdateData(bagList);
    await box.close();
  }

  Future<void> fetchBagData() async {
    final box = Hive.box<DropdownModel>("bagBox");
    try {
      var list = box.values.map((dynamic value) {
        if (value is DropdownModel) {
          return value;
        } else {
          return DropdownModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
      bagList.addAll(list);
      bagCubit.onUpdateData(bagList);
    } catch (e) {
      print('Error fetching data from Hive: $e');
    }
  }
}
