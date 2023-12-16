part of 'transactions_types_imports.dart';

class TransactionsTypesData{
  GenericBloc<bool> transactionContentCubit = GenericBloc(false);

  TextEditingController nameController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController newContentController = TextEditingController();

  GenericBloc<bool> contentCubit = GenericBloc(false);
  GenericBloc<List<TransactionTypeModel>> transactionTypeCubit = GenericBloc([]);
  GenericBloc<List<TransactionTypeModel>> shippingTypeCubit = GenericBloc([]);
  GenericBloc<List<DropdownModel>> commitmentsCubit = GenericBloc([]);


  List<DropdownModel> commitments=[
    DropdownModel(
      name: "الالتزامات"
    ),
    DropdownModel(
        name: "التسوق والشراء"
    ),
  ];

  getCommitments(){
    commitmentsCubit.onUpdateData(commitments);
  }

  List<TransactionTypeModel> transactionType = [];

  addTransactionType(TransactionTypeModel model) async{
    final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
    box.add(model);
    print(box.values.length);
    fetchData();
    print('success');
    transactionType = box.values.cast<TransactionTypeModel>().toList();
    print(transactionType[1].name);
  }


  addTransactionContent(TransactionContentModel model,int index) async{
    final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
    var transactionType = box.getAt(index);
    transactionType?.content?.add(model);
    box.putAt(index, transactionType!);
    fetchData();
    print(transactionType.content?[1].name);
    print(box.values.length);
    print('success');
  }

  Future<void> fetchData() async {
    final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
    try {
      transactionType = box.values.map((dynamic value) {
        if (value is TransactionTypeModel) {
          return value;
        } else {
          return TransactionTypeModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
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
      fetchData();
      print('Box data cleared successfully');
    } catch (e) {
      print('Error clearing box data: $e');
    } finally {
      // Close the Hive box
      await box.close();
    }
  }

  addTransactionModel(BuildContext context,) {
    showModalBottomSheet(

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      context: context,
      builder: (context) =>
          SizedBox(height: 200.h,child: BuildAddTransactionModel(data: this,)),
    );
  }
  addTransactionContentModel(BuildContext context,int index) {
    showModalBottomSheet(

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      context: context,
      builder: (context) =>
          SizedBox(height: 300.h,child: BuildAddTransactionContent(data: this, index: index,)),
    );
  }

  List<TransactionTypeModel> shippingType = [];

  addShipping(TransactionTypeModel model) async{
    final box = await Hive.openBox<TransactionTypeModel>("shippingBox");
    box.add(model);
    print(box.values.length);
    fetchData();
    print('success');
    shippingType = box.values.cast<TransactionTypeModel>().toList();
    print(shippingType[1].name);
  }

  addShippingContent(TransactionContentModel model,int index) async{
    final box = await Hive.openBox<TransactionTypeModel>("shippingBox");
    var shippingType = box.getAt(index);
    shippingType?.content?.add(model);
    box.putAt(index, shippingType!);
    fetchShippingData();
    print(shippingType.content?[1].name);
    print(box.values.length);
    print('success');
  }

  Future<void> fetchShippingData() async {
    final box = await Hive.openBox<TransactionTypeModel>("shippingBox");
    try {
      shippingType = box.values.map((dynamic value) {
        if (value is TransactionTypeModel) {
          return value;
        } else {
          return TransactionTypeModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
      shippingTypeCubit.onUpdateData(shippingType);
    } catch (e) {
      print('Error fetching data from Hive: $e');
    } finally {
      await box.close();
    }
  }


}