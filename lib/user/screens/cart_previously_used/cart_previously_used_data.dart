part of 'cart_previously_used_imports.dart';

class CartPreviouslyUsedData{

  GenericBloc<List<AddCartModel>> addCartCubit = GenericBloc([]);
  List<AddCartModel> addCartList = [];

  GenericBloc<bool> checkCubit = GenericBloc(false);

  Future<void> fetchData(BuildContext context) async {
    final box = await Hive.openBox<AddCartModel>("addCartBox");
    var boxList = box.values.toList();
    print(boxList.length);
    try {
      var list = box.values.map((dynamic value) {
        if (value is AddCartModel) {
          return value;
        } else {
          return AddCartModel();
        }
      }).toList();
      for (AddCartModel item in list) {
        if (item.cartType?.id == 1) {
          addCartList.add(item);
        }
      }
      addCartCubit.onUpdateData(addCartList);
      print(addCartCubit.state.data.length);
    } catch (e) {
      print('Error fetching data from Hive: $e');
    } finally {
      await box.close();
    }
  }

  Future<void> editItem(AddCartModel targetModel,BuildContext context) async {
    final box = await Hive.openBox<AddCartModel>("addCartBox");
    var modelList = box.values.toList();
    int i = modelList.indexWhere((model) => model.key == targetModel.key);
    var key = box.keyAt(i);
    var model = AddCartModel(
      type: targetModel.type,
      amount: targetModel.amount,
      image: targetModel.image,
      name: targetModel.name,
      description: targetModel.description,
      total: targetModel.total,
      address: targetModel.address,
      brand: targetModel.brand,
      cartType: targetModel.cartType,
      contentModel: targetModel.contentModel,
      date: targetModel.date,
      dateCreated: targetModel.dateCreated,
      estimatedValue: targetModel.estimatedValue,
      number: targetModel.number,
      time: targetModel.time,
      typeModel: targetModel.typeModel,
      isCompleted: checkCubit.state.data,
    );
    print(key);
    box.put(key, model);
    var itemList = box.values.toList().where((element) => element.cartType?.id==1);
    addCartList.clear();
    addCartList.addAll(itemList);
    addCartCubit.onUpdateData(addCartList);
  }

  Future<void> deleteItem(AddCartModel targetModel) async {
    final box = await Hive.openBox<AddCartModel>("addCartBox");
    var modelList = box.values.toList();
    int index = modelList.indexWhere((model) => model.key == targetModel.key);
    box.deleteAt(index);
    var itemList = box.values.toList().where((element) => element.cartType?.id==1);
    addCartList.clear();
    addCartList.addAll(itemList);
    addCartCubit.onUpdateData(addCartList);
  }
}