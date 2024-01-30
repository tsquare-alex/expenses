part of 'add_cart_imports.dart';

class AddCartData {
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormState> formKey1 = GlobalKey();
  final GlobalKey<FormState> formKey2 = GlobalKey();

  TextEditingController typeController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateCreatedController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController estimatedValueController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  GenericBloc<List<CartTypeModel>> cartTypeCubit = GenericBloc([]);
  GenericBloc<List<CartContentModel>> cartContentCubit = GenericBloc([]);

  final GlobalKey<DropdownSearchState> cartDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> cartContentDropKey = GlobalKey();

  List<CartTypeModel> cartType = [];

  initData(CartModel model) async {
    final box = await Hive.openBox<CartTypeModel>("cartTypeBox");
    var boxItems = box.values.cast<CartTypeModel>().toList();
    var content = model.content;
    for (var item in content!) {
      // Check if the name of the item in list1 is not equal to any name in list2
      if (!boxItems.any((element) => element.name == item.name)) {
        // Add the item to list2
        box.add(item);
      }
    }
    fetchShoppingData();
    cartType = box.values.cast<CartTypeModel>().toList();
    print(cartType[0].content?[0].name);
    cartTypeCubit.onUpdateData(cartType);
    await box.close();
  }

  Future<void> fetchShoppingData() async {
    final box = await Hive.openBox<CartTypeModel>("cartTypeBox");
    try {
      var list = box.values.map((dynamic value) {
        if (value is CartTypeModel) {
          return value;
        } else {
          return CartTypeModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
      cartType.addAll(list);
      cartTypeCubit.onUpdateData(cartType);
    } catch (e) {
      print('Error fetching data from Hive: $e');
    }
  }

  String? cartId;
  String? cartContentId;
  CartTypeModel? selectedCart;
  CartContentModel? selectedCartContent;

  Future<List<CartTypeModel>> getCartTypes(
      BuildContext context, List<CartTypeModel> model) async {
    List<CartTypeModel> total = [];
    total.addAll(model);
    return total;
  }

  Future<List<CartContentModel>> getCartTypeContent(
      BuildContext context,
      ) async {
    List<CartContentModel> total = [];
    total.addAll(cartContentCubit.state.data);
    return total;
  }

  void setSelectCart(CartTypeModel? model) {
    selectedCart = model;
    cartId = model?.name;
    print(cartId);
    cartContentCubit.onUpdateData(model?.content ?? []);
  }

  void setSelectCartContent(CartContentModel? model) {
    selectedCartContent = model;
    cartContentId = model?.name;
    print(cartContentId);
  }

  addCartType(
    CartTypeModel model,
  ) async {
    final box = await Hive.openBox<CartTypeModel>("cartTypeBox");
    box.add(model);
    print(box.values.length);
    print('success');
    cartType = box.values.cast<CartTypeModel>().toList();
    cartTypeCubit.onUpdateData(cartType);
    print(cartType[1].name);
  }

  addCartModel(
    BuildContext context,
  ) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      context: context,
      builder: (context) => SizedBox(
          height: 500.h,
          child: BuildAddCartType(
            data: this,
          )),
    );
  }

  addTransactionContent(CartContentModel model, BuildContext context,
      CartTypeModel typeModel) async {
    final box = await Hive.openBox<CartTypeModel>("cartTypeBox");
    int modelIndex =
        box.values.toList().indexWhere((model) => model.key == typeModel.key);
    var transactionType = box.getAt(modelIndex);
    transactionType?.content?.add(model);
    box.putAt(modelIndex, transactionType!);
    cartContentCubit.onUpdateData(transactionType.content!);
    cartTypeCubit.onUpdateData(box.values.toList());
    print(box.values.length);
    cartContentCubit.onUpdateData(transactionType.content!);
    getCartTypeContent(context);
    print('success');
  }

  addTransactionContentModel(
      BuildContext context, CartTypeModel typeModel) {
    if(typeModel.name !=null){
      return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.r),
            topLeft: Radius.circular(20.r),
          ),
        ),
        context: context,
        builder: (context) => SizedBox(
          height: 500.h,
          child: BuildAddCartContent(
            data: this,
            typeModel: typeModel,
          ),
        ),
      );
    }else {
      return CustomToast.showSimpleToast(msg: "اختر المعاملة اولا",color: Colors.red,);
    }
  }

  void onSelectTime(
      BuildContext context,
      ) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.timePicker(
        context: context,
        onConfirm: (date) {
          timeController.text = DateFormat("hh:mm aa", "en").format(date!);
        },
        title: '');
  }

  void onSelectDate(
      BuildContext context,
      ) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.datePicker(
        context: context,
        minDate: DateTime.now().subtract(Duration(days:30)),
        onConfirm: (date) {
          dateController.text = DateFormat("dd/MM/yyyy", "en").format(date!);
        },
        title: '');
  }

  void onSelectCreateDate(
      BuildContext context,
      ) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.datePicker(
        context: context,
        minDate: DateTime.now().subtract(Duration(days:30)),
        onConfirm: (date) {
          dateCreatedController.text = DateFormat("dd/MM/yyyy", "en").format(date!);
        },
        title: '');
  }

  final GenericBloc<Uint8List?> imageBloc = GenericBloc(null);
  GenericBloc<bool> alertCubit = GenericBloc(false);

  setGalleryImages(BuildContext context) async {
    var image = await Utils.getImage(false);
    imageBloc.onUpdateData(image);
  }

  setCameraImages(BuildContext context) async {
    var images = await Utils.getImage(true);
    imageBloc.onUpdateData(images);
  }

  void removeImage(BuildContext context) async {
    imageBloc.onUpdateData(null);
  }

  addCart(BuildContext context) async{
    if(formKey.currentState!.validate() &&formKey1.currentState!.validate() &&formKey2.currentState!.validate()){
      if(selectedCart !=null && selectedCartContent !=null){
        showCustomDialog(context);
      }else{
        CustomToast.showSimpleToast(msg: "msg");
      }
    }
  }


  RadioModel? selectedCartType;

  GenericBloc<List<RadioModel>> radioCart = GenericBloc([]);

  List<RadioModel> cartTypes = [
    RadioModel(
      id: 0,
      title: "readyModels",
      image: Res.readyModels,
      active: false,
    ),
    RadioModel(
      id: 1,
      title: "previouslyUsed",
      image: Res.previouslyUsed,
      active: false,
    ),
  ];

  selectMethod(bool value, int index) {
    cartTypes.map((e) => e.active = false).toList();
    cartTypes[index].active = !value;
    radioCart.onUpdateData(cartTypes);
    selectedCartType = radioCart.state.data[index];
    print(selectedCartType?.title);
    print(selectedCartType?.id);
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          content: BuildChooseCartType(data: this,),

        );
      },
    );
  }

}
