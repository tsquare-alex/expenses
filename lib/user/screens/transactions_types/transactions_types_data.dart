part of 'transactions_types_imports.dart';

class TransactionsTypesData{
  GenericBloc<bool> contentCubit = GenericBloc(false);

  TextEditingController nameController = TextEditingController();
  TextEditingController contentController = TextEditingController();

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
  // TransactionTypeModel transactionTypeModel = TransactionTypeModel(
  //   name: nameController.text,
  //   content: [
  //     TransactionContentModel(
  //         name: contentController.text
  //     ),
  //   ],
  // );
}