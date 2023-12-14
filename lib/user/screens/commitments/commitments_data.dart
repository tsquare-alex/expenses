part of 'commitments_imports.dart';

class CommitmentsData{
  GenericBloc<bool> contentCubit = GenericBloc(false);
  GenericBloc<List<TransactionTypeModel>> transactionTypeCubit = GenericBloc([]);

  TextEditingController nameController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  List<TransactionTypeModel> transactionType = [];

  Future<void> fetchData() async {
    final box = Hive.box<TransactionTypeModel>("transactionTypeBox");
    transactionType = box.values.cast<TransactionTypeModel>().toList();
    transactionTypeCubit.onUpdateData(transactionType);
    await box.close();
  }
  addTransactionModel(BuildContext context,) {
    showModalBottomSheet(

      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      context: context,
      builder: (context) =>
          SizedBox(height: 300.h,child: BuildAddTransactionModel(data: this,)),
    );
  }

  List<DropdownModel> contents=[
    DropdownModel(
      id: 0,
      name: "كهرباء",
    ),
    DropdownModel(
      id: 1,
      name: "مياه",
    ),
    DropdownModel(
      id: 2,
      name: "غاز",
    ),
  ];

}