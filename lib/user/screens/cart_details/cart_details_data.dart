part of 'cart_details_imports.dart';

class CartDetailsData{

  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController cartTypeController = TextEditingController();
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

  void fetchCartData(AddCartModel model,BuildContext context){
    nameController.text = model.name??"";
    addressController.text = model.address??"";
    dateCreatedController.text = model.dateCreated??"";
    dateController.text = model.date??"";
    timeController.text = model.time??"";
    numberController.text = model.number.toString();
    amountController.text = model.amount.toString();
    brandController.text = model.brand??"";
    typeController.text = model.type??"";
    estimatedValueController.text = model.estimatedValue.toString();
    totalController.text = model.total.toString();
    descriptionController.text = model.description.toString();
  }

  void editCart(AddCartModel model,BuildContext context) async{
    final box = await Hive.openBox<AddCartModel>("addCartBox");
    var cartList = box.values.toList();
    var targetModel = cartList.firstWhere((element) => element.key == model.key);
    AddCartModel newModel = AddCartModel(
      image: model.image,
      name: nameController.text,
      description: descriptionController.text,
      time: timeController.text,
      amount: double.parse(amountController.text),
      total: double.parse(totalController.text),
      isCompleted: model.isCompleted,
      cartType: model.cartType,
      typeModel: model.typeModel,
      number: double.parse(numberController.text),
      estimatedValue: double.parse(estimatedValueController.text),
      dateCreated: dateCreatedController.text,
      contentModel: model.contentModel,
      brand: brandController.text,
      address: addressController.text,
      date: dateController.text,
      type: typeController.text,
    );
    box.put(targetModel.key, newModel);
    AutoRouter.of(context).pop();
  }
}