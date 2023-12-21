part of 'transaction_details_imports.dart';

class TransactionDetailsData{
  final GlobalKey<FormState> formKey = GlobalKey();

  final GlobalKey<DropdownSearchState> commitmentDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> commitmentContentDropKey = GlobalKey();

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


  String? commitmentId;
  String? commitmentContentId;
  TransactionTypeModel? selectedCommitment;
  TransactionContentModel? selectedCommitmentContent;

  Future<List<TransactionTypeModel>> getCommitments(
      BuildContext context) async {
    final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
    List<TransactionTypeModel> total = box.values.toList();
    return total;
  }

  Future<List<TransactionContentModel>> getCommitmentsContent(
      BuildContext context,
      TransactionTypeModel model
      ) async {
    List<TransactionContentModel> content = [];
    if(model.name != selectedCommitment?.name){
      content = model.content!;
    }else{
      content == selectedCommitment?.content;
    }
    return content;
  }



  void setSelectCommitment(TransactionTypeModel? model) {
    selectedCommitment = model;
    commitmentId = model?.name;
    print(selectedCommitment?.name);
  }

  void setSelectCommitmentContent(TransactionContentModel? model) {
    selectedCommitmentContent = model;
    commitmentContentId = model?.name;
  }

}