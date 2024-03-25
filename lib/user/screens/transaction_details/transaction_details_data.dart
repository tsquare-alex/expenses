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
        onConfirm: (date) {
          transactionDateController.text =
              DateFormat("dd/MM/yyyy", "en").format(date!);
        },
        title: '');
  }

  void onSelectStartDate(
    BuildContext context,
  ) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.datePicker(
        context: context,
        minDate: DateTime.now().subtract(Duration(days: 30)),
        onConfirm: (date) {
          startDateController.text =
              DateFormat("dd/MM/yyyy", "en").format(date!);
        },
        title: '');
  }

  void onSelectEndDate(
    BuildContext context,
  ) {
    FocusScope.of(context).requestFocus(FocusNode());
    AdaptivePicker.datePicker(
        initial: startDateController.text.isNotEmpty
            ? DateFormat("dd/MM/yyyy", "en").parse(startDateController.text)
            : DateTime.now(),
        minDate: startDateController.text.isNotEmpty
            ? DateFormat("dd/MM/yyyy", "en").parse(startDateController.text)
            : DateTime.now(),
        context: context,
        onConfirm: (date) {
          endDateController.text =
              DateFormat("dd/MM/yyyy", "en").format(date!);
        },
        title: '');
  }

  editTransaction(BuildContext context, AddTransactionModel model) async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    if (model.transactionName == "الالتزامات") {
      AddTransactionModel editModel = AddTransactionModel(
        id: model.id,
        transactionName: "الالتزامات",
        transactionType: model.transactionType,
        transactionContent: model.transactionContent,
        incomeSource: selectedWalletModel,
        budget: selectedBudget,
        description: descriptionController.text,
        total: totalController.text,
        database: model.database,
        priority: selectedPriority ?? model.priority,
        time: timeController.text,
        initialStaticValue: model.initialStaticValue,
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
      } else {
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
      }
    } else if (model.transactionName == "التسوق والشراء") {
      AddTransactionModel editModel = AddTransactionModel(
        id: model.id,
        transactionName: "التسوق والشراء",
        transactionType: model.transactionType,
        transactionContent: model.transactionContent,
        description: descriptionController.text,
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
        initialStaticValue: model.initialStaticValue,
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
      } else {
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
      }
    } else if (model.transactionName == "الاهداف المالية المستهدفة") {
      AddTransactionModel editModel = AddTransactionModel(
        id: model.id,
        transactionName: "الاهداف المالية المستهدفة",
        transactionType: model.transactionType,
        total: totalController.text,
        incomeSource: selectedWalletModel,
        description: descriptionController.text,
        budget: selectedBudget,
        initialStaticValue: model.initialStaticValue,
        targetValue: totalController.text,
        startDate: startDateController.text,
        endDate: endDateController.text,
        time: timeController.text,
        image: model.image,
        initialValue: double.parse(initialValueController.text),
        requiredValue: double.parse(requiredValueController.text),
        priority: selectedPriority,
        completedNotify: selectedRatio!=null?true:false,
        ratio: ratioCubit.state.data != false
            ? selectedRatio ?? null
            : null,
        putReminderInWallet: remainderCubit.state.data,
        transactionDate: transactionDateController.text,
        repeated: selectedIterateTransaction,
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
      } else {
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
      }
    } else if (model.transactionName == "المعاملات النقدية") {
      AddTransactionModel editModel = AddTransactionModel(
        id: model.id,
        transactionName: "المعاملات النقدية",
        cashTransactionType: model.cashTransactionType,
        initialStaticValue: model.initialStaticValue,
        incomeSource: selectedWalletModel,
        budget: selectedBudget,
        description: descriptionController.text,
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
      } else {
        box.put(model.key, editModel);
        AutoRouter.of(context).pop();
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
    // budgetName = model?.budgetName;
  }

  Future<List<BudgetModel>> getBudgetData(BuildContext context) async {
    var budgetData = Hive.box<BudgetModel>("budgetBox");
    List<BudgetModel> total = budgetData.values.toList();
    return total;
  }

  Future<void> deleteItem(AddTransactionModel targetModel,BuildContext context) async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    // Find the index of the target model in the list
    var modelList =box.values.toList();
    int index = modelList.indexWhere((model) => model.key == targetModel.key);
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    var walletList = walletBox.values.toList();
    if(walletList.any(
          (item) => item.id == targetModel.incomeSource?.id,
    )){
      WalletModel? targetWallet = walletList.firstWhere(
            (item) => item.id == targetModel.incomeSource?.id,
      );
      var currencyBox = Hive.box<CurrencyModel>("currencyBox");
      var currencyList = currencyBox.values.toList();
      double total;
      if(targetModel.transactionName=="الاهداف المالية المستهدفة"){
        total = targetModel.initialValue!;
      }else{
        total= double.parse(targetModel.total!);
      }
      if(targetWallet.currency != currencyList[0].mainCurrency){
        if(targetWallet.checkedValue ==false){
          print("sss");
          var calculatedTotalBalance  = targetWallet.totalBalance! + total;
          targetWallet.totalBalance = calculatedTotalBalance;
          double remain = (calculatedTotalBalance)/ currencyList[0].value!;
          targetWallet.remainBalance = remain;
          await walletBox.put(targetWallet.key, targetWallet);
          box.deleteAt(index);
          AutoRouter.of(context).pop();
        }else{
          print("mmm");
          var calculatedTotalBalance = targetWallet.totalBalance! + total;
          targetWallet.totalBalance = calculatedTotalBalance;
          double remain = calculatedTotalBalance;
          targetWallet.remainTotalBalance = remain;
          await walletBox.put(targetWallet.key, targetWallet);
          box.deleteAt(index);
          AutoRouter.of(context).pop();
        }
      }else{
        print('mmmm');
        var calculatedTotalBalance = targetWallet.totalBalance! + total;
        targetWallet.totalBalance = calculatedTotalBalance;
        targetWallet.balance = targetWallet.balance + total;
        await walletBox.put(targetWallet.key, targetWallet);
        box.deleteAt(index);
        AutoRouter.of(context).pop();
      }
    }else{
      box.deleteAt(index);
      AutoRouter.of(context).pop();
    }
    // print("balance ${targetWallet.balance}");

    // AutoRouter.of(context).push(HomeRoute(index: 0));
    if (index != -1) {
      print('Index of the target model: $index');
    } else {
      print('Target model not found in the list.');
    }
  }

}
