part of 'transaction_details_imports.dart';

class TransactionDetailsData{
  final GlobalKey<FormState> formKey = GlobalKey();

  GenericBloc<bool> iterateCubit = GenericBloc(false);
  GenericBloc<bool> notifyCubit = GenericBloc(false);

  final GlobalKey<DropdownSearchState> commitmentDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> commitmentContentDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> unitsDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> priorityDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> iterateTransactionDropKey = GlobalKey();

  TextEditingController transactionTypeController = TextEditingController();
  TextEditingController transactionContentController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController walletController = TextEditingController();
  TextEditingController partyController = TextEditingController();
  TextEditingController transactionDateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  fetchData(AddTransactionModel model){
    transactionTypeController.text = "${model.transactionName == "الالتزامات" ||
        model.transactionName == "التسوق والشراء"?model.transactionType!.name!:model.transactionName == "الاهداف المالية المستهدفة"?model.targetType?.name:model.transactionName == "المعاملات النقدية"?model.cashTransactionType?.name:""}";
    transactionContentController.text = model.transactionContent?.name??"";
    totalController.text = model.total.toString();
    amountController.text = model.amount.toString().isNotEmpty?model.amount.toString():"1";
    walletController.text = model.incomeSource!.name;
    partyController.text = model.database?.name??"";
    transactionDateController.text = model.transactionDate??"";
    timeController.text = model.time??"";
    brandNameController.text = model.brandName??"";
    startDateController.text = model.startDate??"";
    endDateController.text = model.endDate??"";
  }


  String? commitmentId;
  String? commitmentContentId;
  int? unitId;
  int? priorityId;
  int? iterateTransactionId;
  TransactionTypeModel? selectedCommitment;
  TransactionContentModel? selectedCommitmentContent;
  DropdownModel? selectedUnit;
  DropdownModel? selectedPriority;
  DropdownModel? selectedIterateTransaction;

  List<DropdownModel> units = [
    DropdownModel(id: 0, name: "كيلوغرام"),
    DropdownModel(id: 1, name: "غرام"),
    DropdownModel(id: 2, name: "طن"),
    DropdownModel(id: 3, name: "متر"),
    DropdownModel(id: 4, name: "كيلومتر"),
    DropdownModel(id: 5, name: "سنتيمتر"),
  ];
  List<DropdownModel> priorities = [
    DropdownModel(id: 0, name: "ضروري"),
    DropdownModel(id: 1, name: "هام"),
    DropdownModel(id: 2, name: "عادي"),
  ];
  List<DropdownModel> iterateTransaction = [
    DropdownModel(id: 0, name: "يوميا"),
    DropdownModel(id: 1, name: "أسبوعيا"),
    DropdownModel(id: 2, name: "شهريا"),
    DropdownModel(id: 3, name: "ربع سنويا"),
    DropdownModel(id: 4, name: "نصف سنويا"),
    DropdownModel(id: 5, name: "سنويا"),
  ];

  Future<List<DropdownModel>> getIterateTransaction(
      BuildContext context) async {
    return iterateTransaction;
  }
  void setSelectIterateTransaction(DropdownModel? model) {
    selectedIterateTransaction = model;
    iterateTransactionId = model?.id;
  }
  Future<List<DropdownModel>> getUnits(BuildContext context) async {
    return units;
  }

  Future<List<DropdownModel>> getPriority(BuildContext context) async {
    return priorities;
  }
  void setSelectPriority(DropdownModel? model) {
    selectedPriority = model;
    priorityId = model?.id;
  }
  void setSelectUnit(DropdownModel? model) {
    selectedUnit = model;
    unitId = model?.id;
  }

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


  void onSelectTime(
      BuildContext context,
      ) {
    FocusScope.of(context).requestFocus(FocusNode());
    var local = context.read<LangCubit>().state.locale.languageCode;
    AdaptivePicker.timePicker(
        context: context,
        onConfirm: (date) {
          timeController.text = DateFormat("hh:mm aa", local).format(date!);
        },
        title: '');
  }

  void onSelectDate(
      BuildContext context,
      ) {
    FocusScope.of(context).requestFocus(FocusNode());
    var local = context.read<LangCubit>().state.locale.languageCode;
    AdaptivePicker.datePicker(
        context: context,
        onConfirm: (date) {
          transactionDateController.text = DateFormat("dd MMMM yyyy", local).format(date!);
        },
        title: '');
  }

  void onSelectStartDate(
      BuildContext context,
      ) {
    FocusScope.of(context).requestFocus(FocusNode());
    var local = context.read<LangCubit>().state.locale.languageCode;
    AdaptivePicker.datePicker(
        context: context,
        minDate:DateTime.now().subtract(Duration(days: 30)),
        onConfirm: (date) {
          startDateController.text =
              DateFormat("dd MMMM yyyy", local).format(date!);
        },
        title: '');
  }

  void onSelectEndDate(
      BuildContext context,
      ) {
    FocusScope.of(context).requestFocus(FocusNode());
    var local = context.read<LangCubit>().state.locale.languageCode;
    AdaptivePicker.datePicker(
        initial: startDateController.text.isNotEmpty
            ? DateFormat("dd MMMM yyyy", local).parse(startDateController.text)
            : DateTime.now(),
        minDate: startDateController.text.isNotEmpty
            ? DateFormat("dd MMMM yyyy", local).parse(startDateController.text)
            : DateTime.now(),
        context: context,
        onConfirm: (date) {
          endDateController.text =
              DateFormat("dd MMMM yyyy", local).format(date!);
        },
        title: '');
  }

}