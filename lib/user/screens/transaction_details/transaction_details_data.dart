part of 'transaction_details_imports.dart';

class TransactionDetailsData{
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController transactionTypeController = TextEditingController();
  TextEditingController transactionContentController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController transactionDateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController notifyController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController startValueController = TextEditingController();
  TextEditingController targetValueController = TextEditingController();


  // // Find the index of the target model in the list
  // int index = modelList.indexWhere((model) => model == targetModel);
  //
  // if (index != -1) {
  // print('Index of the target model: $index');
  // } else {
  // print('Target model not found in the list.');
  // }

}