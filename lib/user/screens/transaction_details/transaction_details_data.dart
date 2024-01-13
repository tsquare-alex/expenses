part of 'transaction_details_imports.dart';

class TransactionDetailsData {
  final GlobalKey<FormState> formKey = GlobalKey();

  GenericBloc<bool> iterateCubit = GenericBloc(false);
  GenericBloc<bool> notifyCubit = GenericBloc(false);
  GenericBloc<bool> ratioCubit = GenericBloc(false);
  GenericBloc<bool> remainderCubit = GenericBloc(false);

  final GlobalKey<DropdownSearchState> commitmentDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> commitmentContentDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> unitsDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> priorityDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> iterateTransactionDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> walletDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> budgetDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> ratioDropKey = GlobalKey();

  TextEditingController transactionTypeController = TextEditingController();
  TextEditingController transactionContentController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController initialValueController = TextEditingController();
  TextEditingController requiredValueController = TextEditingController();
  TextEditingController walletController = TextEditingController();
  TextEditingController partyController = TextEditingController();
  TextEditingController transactionDateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController brandNameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  fetchData(AddTransactionModel model,BuildContext context) {
    // var text = tr(context, model.transactionType!.name!).isNotEmpty?tr(context, model.transactionType?.name??""):model.transactionType?.name??"";

    transactionTypeController.text = model.transactionType?.name??"";
        // "${model.transactionName == "الالتزامات" || model.transactionName == "التسوق والشراء" ? model.transactionType?.name??"" : model.transactionName == "الاهداف المالية المستهدفة" ? model.targetType?.name : model.transactionName == "المعاملات النقدية" ? model.cashTransactionType?.name : ""}";
    transactionContentController.text = model.transactionContent?.name ?? "";
    totalController.text = model.total.toString();
    amountController.text =
        model.amount.toString().isNotEmpty ? model.amount.toString() : "1";
    walletController.text = model.incomeSource!.name;
    partyController.text = model.database?.name ?? '';
    transactionDateController.text = model.transactionDate ?? "";
    timeController.text = model.time ?? "";
    brandNameController.text = model.brandName ?? "";
    startDateController.text = model.startDate ?? "";
    endDateController.text = model.endDate ?? "";
    initialValueController.text = "${model.initialValue??""}";
    requiredValueController.text = "${model.requiredValue??""}";
    descriptionController.text = model.description??"";
  }

  int? unitId;
  int? priorityId;
  int? ratioId;
  int? iterateTransactionId;
  DropdownModel? selectedUnit;
  DropdownModel? selectedPriority;
  DropdownModel? selectedIterateTransaction;
  DropdownModel? selectedRatio;


  List<DropdownModel> priorities = [
    DropdownModel(id: 0, name: "necessary"),
    DropdownModel(id: 1, name: "important"),
    DropdownModel(id: 2, name: "normal"),
  ];

  List<DropdownModel> ratio = [
    DropdownModel(id: 0, name: "10 %"),
    DropdownModel(id: 1, name: "20 %"),
    DropdownModel(id: 2, name: "30 %"),
    DropdownModel(id: 2, name: "40 %"),
    DropdownModel(id: 2, name: "50 %"),
    DropdownModel(id: 2, name: "60 %"),
    DropdownModel(id: 2, name: "70 %"),
    DropdownModel(id: 2, name: "80 %"),
    DropdownModel(id: 2, name: "90 %"),
    DropdownModel(id: 2, name: "100 %"),
  ];

  List<DropdownModel> units = [
    DropdownModel(id: 0, name: "time1"),
    DropdownModel(id: 1, name: "length"),
    DropdownModel(id: 2, name: "weight"),
    DropdownModel(id: 3, name: "mass"),
    DropdownModel(id: 4, name: "speed"),
    DropdownModel(id: 5, name: "power"),
    DropdownModel(id: 6, name: "pressure"),
    DropdownModel(id: 7, name: "energy"),
    DropdownModel(id: 8, name: "electric"),
  ];
  List<DropdownModel> iterateTransaction = [
    DropdownModel(id: 0, name: "daily"),
    DropdownModel(id: 1, name: "weekly"),
    DropdownModel(id: 2, name: "monthly"),
    DropdownModel(id: 3, name: "quarterly"),
    DropdownModel(id: 4, name: "SemiAnnually"),
    DropdownModel(id: 5, name: "annually"),
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

  Future<List<DropdownModel>> getRatio(BuildContext context) async {
    return ratio;
  }

  void setSelectPriority(DropdownModel? model) {
    selectedPriority = model;
    priorityId = model?.id;
  }

  void setSelectRatio(DropdownModel? model) {
    selectedRatio = model;
    ratioId = model?.id;
  }

  void setSelectUnit(DropdownModel? model) {
    selectedUnit = model;
    unitId = model?.id;
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
          transactionDateController.text =
              DateFormat("dd MMMM yyyy", local).format(date!);
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
        minDate: DateTime.now().subtract(Duration(days: 30)),
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

  editTransaction(BuildContext context, AddTransactionModel model) async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    if (model.transactionName == "الالتزامات") {
      AddTransactionModel editModel = AddTransactionModel(
        transactionName: "الالتزامات",
        transactionType: model.transactionType,
        transactionContent: model.transactionContent,
        incomeSource: selectedWalletModel,
        budget: selectedBudget,
        //unit: selectedUnit,
        //amount: amountController.text,
        total: totalController.text,
        database: model.database,
        priority: selectedPriority ?? model.priority,
        time: timeController.text,
        transactionDate: transactionDateController.text,
        repeated: iterateCubit.state.data != false
            ? selectedIterateTransaction ?? model.repeated
            : null,
        notify: notifyCubit.state.data,
      );
      var total = double.parse(totalController.text);
      var lastTotal = double.parse(model.total!);
      if (total < lastTotal) {
        var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
        var walletList = walletBox.values.toList();
        WalletModel? targetModel = walletList.firstWhere(
          (item) => item.name == model.incomeSource?.name,
        );
        var edit = lastTotal - total;
        print("object ${targetModel.name}");
        targetModel.balance = targetModel.balance + edit;
        print("balance ${targetModel.balance}");
        await walletBox.put(targetModel.key, targetModel);
        print(selectedWalletModel!.balance);
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
        AutoRouter.of(context).replace(HomeRoute(index: 0));
      } else if (total > lastTotal) {
        var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
        var walletList = walletBox.values.toList();
        WalletModel? targetModel = walletList.firstWhere(
          (item) => item.name == selectedWalletModel?.name,
        );
        var edit = total - lastTotal;
        print("object ${targetModel.name}");
        targetModel.balance = targetModel.balance - edit;
        print("balance ${targetModel.balance}");
        await walletBox.put(targetModel.key, targetModel);
        print(selectedWalletModel!.balance);
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
        AutoRouter.of(context).replace(HomeRoute(index: 0));
      } else {
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
        AutoRouter.of(context).replace(HomeRoute(index: 0));
      }
    }
    else if (model.transactionName == "التسوق والشراء") {
      AddTransactionModel editModel = AddTransactionModel(
        transactionName: "التسوق والشراء",
        transactionType: model.transactionType,
        transactionContent: model.transactionContent,
        database: model.database,
        incomeSource: selectedWalletModel,
        budget: selectedBudget,
        unit: selectedUnit,
        amount: amountController.text,
        total: totalController.text,
        brandName: brandNameController.text,
        priority: selectedPriority ?? model.priority,
        time: timeController.text,
        transactionDate: transactionDateController.text,
        image: model.image,
        repeated: iterateCubit.state.data != false
            ? selectedIterateTransaction ?? model.repeated
            : null,
        notify: notifyCubit.state.data,
      );
      var total = double.parse(totalController.text);
      var lastTotal = double.parse(model.total!);
      if (total < lastTotal) {
        var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
        var walletList = walletBox.values.toList();
        WalletModel? targetModel = walletList.firstWhere(
          (item) => item.name == selectedWalletModel?.name,
        );
        var edit = lastTotal - total;
        print("object ${targetModel.name}");
        targetModel.balance = targetModel.balance + edit;
        print("balance ${targetModel.balance}");
        await walletBox.put(targetModel.key, targetModel);
        print(model.incomeSource!.balance);
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
        AutoRouter.of(context).replace(HomeRoute(index: 0));
      } else if (total > lastTotal) {
        var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
        var walletList = walletBox.values.toList();
        WalletModel? targetModel = walletList.firstWhere(
          (item) => item.name == model.incomeSource?.name,
        );
        var edit = total - lastTotal;
        print("object ${targetModel.name}");
        targetModel.balance = targetModel.balance - edit;
        print("balance ${targetModel.balance}");
        await walletBox.put(targetModel.key, targetModel);
        print(model.incomeSource!.balance);
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
        AutoRouter.of(context).replace(HomeRoute(index: 0));
      } else {
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
        AutoRouter.of(context).replace(HomeRoute(index: 0));
      }
    }
    else if (model.transactionName == "الاهداف المالية المستهدفة") {
      AddTransactionModel editModel = AddTransactionModel(
        transactionName: "الاهداف المالية المستهدفة",
        targetType: model.targetType,
        total: totalController.text,
        incomeSource: selectedWalletModel,
        budget: selectedBudget,
        targetValue: totalController.text,
        startDate: startDateController.text,
        endDate: endDateController.text,
        time: timeController.text,
        image: model.image,
        initialValue: double.parse(initialValueController.text),
        requiredValue: double.parse(requiredValueController.text),
        priority: selectedPriority,
        completedNotify: ratioCubit.state.data,
        putReminderInWallet: remainderCubit.state.data,
        transactionDate: transactionDateController.text,
        repeated: iterateCubit.state.data != false
            ? selectedIterateTransaction ?? model.repeated
            : null,
        notify: notifyCubit.state.data,
      );
      var total = double.parse(totalController.text);
      var lastTotal = double.parse(model.total!);
      if (total < lastTotal) {
        var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
        var walletList = walletBox.values.toList();
        WalletModel? targetModel = walletList.firstWhere(
          (item) => item.name == model.incomeSource?.name,
        );
        var edit = lastTotal - total;
        print("object ${targetModel.name}");
        targetModel.balance = targetModel.balance + edit;
        print("balance ${targetModel.balance}");
        await walletBox.put(targetModel.key, targetModel);
        print(model.incomeSource!.balance);
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
        AutoRouter.of(context).replace(HomeRoute(index: 0));
      } else if (total > lastTotal) {
        var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
        var walletList = walletBox.values.toList();
        WalletModel? targetModel = walletList.firstWhere(
          (item) => item.name == model.incomeSource?.name,
        );
        var edit = total - lastTotal;
        print("object ${targetModel.name}");
        targetModel.balance = targetModel.balance - edit;
        print("balance ${targetModel.balance}");
        await walletBox.put(targetModel.key, targetModel);
        print(model.incomeSource!.balance);
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
        AutoRouter.of(context).replace(HomeRoute(index: 0));
      } else {
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
        AutoRouter.of(context).replace(HomeRoute(index: 0));
      }
    }
    else if (model.transactionName == "المعاملات النقدية") {
      AddTransactionModel editModel = AddTransactionModel(
        transactionName: "المعاملات النقدية",
        cashTransactionType: model.cashTransactionType,
        incomeSource: selectedWalletModel,
        budget: selectedBudget,
        database: model.database,
        priority: selectedPriority ?? model.priority,
        total: totalController.text,
        time: timeController.text,
        transactionDate: transactionDateController.text,
        repeated: iterateCubit.state.data != false
            ? selectedIterateTransaction ?? model.repeated
            : null,
        notify: notifyCubit.state.data,
      );
      var total = double.parse(totalController.text);
      var lastTotal = double.parse(model.total!);
      if (total < lastTotal) {
        var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
        var walletList = walletBox.values.toList();
        WalletModel? targetModel = walletList.firstWhere(
          (item) => item.name == model.incomeSource?.name,
        );
        var edit = lastTotal - total;
        print("object ${targetModel.name}");
        targetModel.balance = targetModel.balance + edit;
        print("balance ${targetModel.balance}");
        await walletBox.put(targetModel.key, targetModel);
        print(model.incomeSource!.balance);
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
        AutoRouter.of(context).replace(HomeRoute(index: 0));
      } else if (total > lastTotal) {
        var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
        var walletList = walletBox.values.toList();
        WalletModel? targetModel = walletList.firstWhere(
          (item) => item.name == model.incomeSource?.name,
        );
        var edit = total - lastTotal;
        print("object ${targetModel.name}");
        targetModel.balance = targetModel.balance - edit;
        print("balance ${targetModel.balance}");
        await walletBox.put(targetModel.key, targetModel);
        print(model.incomeSource!.balance);
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
        AutoRouter.of(context).replace(HomeRoute(index: 0));
      } else {
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
        AutoRouter.of(context).replace(HomeRoute(index: 0));
      }
    }
  }


  WalletModel? selectedWalletModel;
  BudgetModel? selectedBudget;
  String? walletName;
  String? budgetName;


  void setSelectWalletModel(WalletModel? model) {
    selectedWalletModel = model;
    walletName = model?.name;
  }

  Future<List<WalletModel>> getWalletData(BuildContext context) async {
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    List<WalletModel> total = walletBox.values.toList();
    return total;
  }

  void setSelectBudgetModel(BudgetModel? model) {
    selectedBudget = model;
    budgetName = model?.name;
  }

  Future<List<BudgetModel>> getBudgetData(BuildContext context) async {
    var budgetData = Hive.box<BudgetModel>("budgetBox");
    List<BudgetModel> total = budgetData.values.toList();
    return total;
  }
}
