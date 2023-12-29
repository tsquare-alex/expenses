part of 'bag_imports.dart';

class BagData{
  final GlobalKey<FormState> formKey = GlobalKey();


  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final GlobalKey<DropdownSearchState> unitsDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> priorityDropKey = GlobalKey();

  int? priorityId;
  int? unitId;
  DropdownModel? selectedPriority;
  DropdownModel? selectedUnit;


  List<DropdownModel> priorities = [
    DropdownModel(id: 0, name: "ضروري"),
    DropdownModel(id: 1, name: "هام"),
    DropdownModel(id: 2, name: "عادي"),
  ];

  List<DropdownModel> units = [
    DropdownModel(id: 0, name: "زمن"),
    DropdownModel(id: 1, name: "طول"),
    DropdownModel(id: 2, name: "وزن"),
    DropdownModel(id: 3, name: "كتلة"),
    DropdownModel(id: 4, name: "حجم"),
    DropdownModel(id: 5, name: "سرعة"),
    DropdownModel(id: 6, name: "قوة"),
    DropdownModel(id: 7, name: "ضغط"),
    DropdownModel(id: 8, name: "طاقة"),
    DropdownModel(id: 9, name: "كهرباء"),
  ];

  List<DropdownModel> cart = [
    DropdownModel(id: 0, name: "خضار"),
    DropdownModel(id: 1, name: "فاكهة"),
    DropdownModel(id: 2, name: "بقوليات"),
    DropdownModel(id: 3, name: "زيوت"),
  ];

  List<DropdownModel> bagList = [];
  GenericBloc<List<DropdownModel>> bagCubit = GenericBloc([]);
  GenericBloc<DropdownModel?> typeCubit = GenericBloc(null);


  void setSelectUnit(DropdownModel? model) {
    selectedUnit = model;
    unitId = model?.id;
  }
  void setSelectPriority(DropdownModel? model) {
    selectedPriority = model;
    priorityId = model?.id;
  }

  Future<List<DropdownModel>> getUnits(BuildContext context) async {
    return units;
  }
  Future<List<DropdownModel>> getPriority(BuildContext context) async {
    return priorities;
  }


  initialTransaction() async {
    final box = await Hive.openBox<DropdownModel>("bagTransactionBox");
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
    final box = Hive.box<DropdownModel>("bagTransactionBox");
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

  addBagItem(DropdownModel model) async {
    final box = await Hive.openBox<DropdownModel>("bagTransactionBox");
    box.add(model);
    print(box.values.length);
    print('success');
    print(model.name);
    bagCubit.onUpdateData(box.values.toList());
  }

  addBagModel(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      context: context,
      builder: (context) => SizedBox(
          height: 400.h,
          child: BuildAddBagModel(
            data: this,
          )),
    );
  }

  List<BagModel> itemsList = [];
  GenericBloc<List<BagModel>> cartCubit = GenericBloc([]);

  addToCart(BuildContext context) async {
    final box = await Hive.openBox<BagModel>("bagBox");
    if (typeCubit.state.data!=null&&formKey.currentState!.validate()) {
      double amount = double.parse(amountController.text);
      BagModel model = BagModel(
        type: typeCubit.state.data?.name,
        unit: selectedUnit,
        amount: amount,
        priority: selectedPriority,
      );
      box.add(model);
      cartCubit.onUpdateData(box.values.toList());
      AutoRouter.of(context).replace(HomeRoute(index: 0,pageIndex: 15));

      } else  {
      CustomToast.showSimpleToast(
          msg: "أكمل بيانات الإضافة أولا لاتمام اضافة المعاملة",
          color: Colors.red);
      }
    }
  }


