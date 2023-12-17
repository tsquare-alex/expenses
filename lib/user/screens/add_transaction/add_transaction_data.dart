part of 'add_transaction_imports.dart';

class AddTransactionData{

  GenericBloc<bool> contentCubit = GenericBloc(false);
  GenericBloc<bool> walletCubit = GenericBloc(false);
  final GlobalKey<DropdownSearchState> commitmentDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> commitmentContentDropKey = GlobalKey();

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController newContentController = TextEditingController();


  void onSelectTime(
      BuildContext context,) {
    FocusScope.of(context).requestFocus(FocusNode());
    var local = context.read<LangCubit>().state.locale.languageCode;
    AdaptivePicker.timePicker(
        context: context,
        onConfirm: (date) {
          timeController.text = DateFormat("hh:mm aa",local).format(date!);

        },
        title: '');


  }

  void onSelectDate(
      BuildContext context,) {
    FocusScope.of(context).requestFocus(FocusNode());
    var local = context.read<LangCubit>().state.locale.languageCode;
    AdaptivePicker.datePicker(
        context: context,
        onConfirm: (date) {
          dateController.text = DateFormat("dd MMMM yyyy", local).format(date!);
        },
        title: '');

  }

  GenericBloc<List<TransactionTypeModel>> transactionTypeCubit = GenericBloc([]);
  GenericBloc<List<TransactionTypeModel>> shoppingTypeCubit = GenericBloc([]);
  GenericBloc<List<TransactionContentModel>> transactionContentCubit = GenericBloc([]);

  List<TransactionTypeModel> transactionType = [];
  List<TransactionTypeModel> shoppingType = [];

  initialTransaction(TransactionModel model) async{
    if(model.name == "الالتزامات"){
      final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
      var boxItems  = box.values.cast<TransactionTypeModel>().toList();
      var content = model.content;
      for (var item in content!) {
        // Check if the name of the item in list1 is not equal to any name in list2
        if (!boxItems.any((element) => element.name == item.name)) {
          // Add the item to list2
          box.add(item);
        }
      }
      //box.addAll(boxItems);
      fetchData();
      transactionType = box.values.cast<TransactionTypeModel>().toList();
      print(transactionType[0].content?[0].name);
      transactionTypeCubit.onUpdateData(transactionType);
      await box.close();
    }else if(model.name == "التسوق والشراء"){
      final box = await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
      var boxItems  = box.values.cast<TransactionTypeModel>().toList();
      var content = model.content;
      for (var item in content!) {
        // Check if the name of the item in list1 is not equal to any name in list2
        if (!boxItems.any((element) => element.name == item.name)) {
          // Add the item to list2
          box.add(item);
        }
      }
      //box.addAll(boxItems);
      //box.addAll(model.content as Iterable<TransactionTypeModel>);
      fetchShoppingData();
      shoppingType = box.values.cast<TransactionTypeModel>().toList();
      print(shoppingType[0].content?[0].name);
      shoppingTypeCubit.onUpdateData(shoppingType);
      await box.close();
    }
  }

  addTransactionType(TransactionTypeModel model,String type) async{
    if(type=="الالتزامات"){
      final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
      box.add(model);
      print(box.values.length);
      print('success');
      transactionType = box.values.cast<TransactionTypeModel>().toList();
      transactionTypeCubit.onUpdateData(transactionType);
      print(transactionType[1].name);
    }
    else if(type == "التسوق والشراء"){
      final box = await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
      box.add(model);
      print(box.values.length);
      print('success');
      shoppingType = box.values.cast<TransactionTypeModel>().toList();
      shoppingTypeCubit.onUpdateData(shoppingType);
      print(shoppingType[1].name);
    }
  }


  addTransactionContent(TransactionContentModel model,String type) async{
    if(type=="الالتزامات"){
      final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
      int modelIndex = box.values.toList().indexWhere((model) => model.name == commitmentId);
      var transactionType = box.getAt(modelIndex);
      print(modelIndex);
      transactionType?.content?.add(model);
      box.putAt(modelIndex, transactionType!);
      print(transactionType.content?[0].name);
      print(box.values.length);
      print('success');
    }
    else if(type == "التسوق والشراء"){
      final box = await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
      int modelIndex = box.values.toList().indexWhere((model) => model.name == commitmentId);
      var shoppingType = box.getAt(modelIndex);
      print(modelIndex);
      shoppingType?.content?.add(model);
      box.putAt(modelIndex, shoppingType!);
      print(shoppingType.content?[0].name);
      print(box.values.length);
      print('success');
    }
  }

  Future<void> fetchShoppingData() async {
    final box = await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
    try {
      var list = box.values.map((dynamic value) {
        if (value is TransactionTypeModel) {
          return value;
        } else {
          return TransactionTypeModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
      shoppingType.addAll(list);
      shoppingTypeCubit.onUpdateData(shoppingType);
    } catch (e) {
      print('Error fetching data from Hive: $e');
    } finally {
      await box.close();
    }
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



  void clearBoxData(String boxName) async {
    final box = await Hive.openBox<TransactionTypeModel>(boxName);

    try {
      // Clear all data in the box
      await box.clear();
      print('Box data cleared successfully');
    } catch (e) {
      print('Error clearing box data: $e');
    } finally {
      // Close the Hive box
      await box.close();
    }
  }

  addTransactionModel(BuildContext context,String type) {
    showModalBottomSheet(

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      context: context,
      builder: (context) =>
          SizedBox(height: 400.h,child: BuildAddTransactionModel(data: this, type: type,)),
    );
  }
  addTransactionContentModel(BuildContext context,String type) {
    showModalBottomSheet(

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      context: context,
      builder: (context) =>
          SizedBox(height: 300.h,child: BuildAddTransactionContent(data: this, type: type,)),
    );
  }



  String? commitmentId;
  String? commitmentContentId;
  TransactionTypeModel? selectedCommitment;
  TransactionContentModel? selectedCommitmentContent;



  Future<List<TransactionTypeModel>> getCommitments(BuildContext context,List<TransactionTypeModel> model) async {
    List<TransactionTypeModel> total = [];
    total.addAll(model);
    return total;
  }
  Future<List<TransactionContentModel>> getCommitmentsContent(BuildContext context,) async {
    List<TransactionContentModel> total = [];
    total.addAll(transactionContentCubit.state.data);
    return total;
  }

  void setSelectCommitment(TransactionTypeModel? model) {
    selectedCommitment = model;
    commitmentId = model?.name;
    print(commitmentId);
    transactionContentCubit.onUpdateData(model?.content??[]);
  }

  void setSelectCommitmentContent(TransactionContentModel? model) {
    selectedCommitmentContent = model;
  }
}