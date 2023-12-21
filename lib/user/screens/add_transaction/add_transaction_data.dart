part of 'add_transaction_imports.dart';

class AddTransactionData {
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormState> formKey1 = GlobalKey();
  final GlobalKey<FormState> formKey2 = GlobalKey();
  GenericBloc<bool> contentCubit = GenericBloc(false);
  GenericBloc<bool> iterateCubit = GenericBloc(false);
  GenericBloc<bool> notifyCubit = GenericBloc(false);
  final GenericBloc<Uint8List?> imageBloc = GenericBloc(null);

  final GlobalKey<DropdownSearchState> commitmentDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> commitmentContentDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> walletDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> unitsDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> commitmentPartyDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> priorityDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> shoppingPartyDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> iterateTransactionDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> targetDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> cashTransactionDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> transferDropKey = GlobalKey();

  TextEditingController dateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController totalController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController unitController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController newContentController = TextEditingController();
  TextEditingController targetController = TextEditingController();
  TextEditingController transferController = TextEditingController();
  TextEditingController initValueController = TextEditingController();

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
          dateController.text = DateFormat("dd MMMM yyyy", local).format(date!);
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
        context: context,
        onConfirm: (date) {
          endDateController.text =
              DateFormat("dd MMMM yyyy", local).format(date!);
        },
        title: '');
  }

  GenericBloc<List<TransactionTypeModel>> transactionTypeCubit =
      GenericBloc([]);
  GenericBloc<List<TransactionTypeModel>> shoppingTypeCubit = GenericBloc([]);
  GenericBloc<List<TransactionContentModel>> transactionContentCubit =
      GenericBloc([]);
  GenericBloc<List<DropdownModel>> targetCubit = GenericBloc([]);
  GenericBloc<List<DropdownModel>> cashTransactionCubit = GenericBloc([]);
  GenericBloc<List<AddTransactionModel>> addTransactionCubit = GenericBloc([]);
  GenericBloc<List<WalletModel>> walletCubit = GenericBloc([]);

  List<TransactionTypeModel> transactionType = [];
  List<TransactionTypeModel> shoppingType = [];
  List<DropdownModel> targetList = [];
  List<DropdownModel> cashTransactionList = [];
  List<AddTransactionModel> addTransactionList = [];

  initialTransaction(TransactionModel model) async {
    if (model.name == "الالتزامات") {
      final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
      var boxItems = box.values.cast<TransactionTypeModel>().toList();
      var content = model.content;
      for (var item in content!) {
        // Check if the name of the item in list1 is not equal to any name in list2
        if (!boxItems.any((element) => element.name == item.name)) {
          // Add the item to list2
          box.add(item);
        }
      }
      fetchData();
      transactionType = box.values.cast<TransactionTypeModel>().toList();
      print(transactionType[0].content?[0].name);
      transactionTypeCubit.onUpdateData(transactionType);
      await box.close();
    } else if (model.name == "التسوق والشراء") {
      final box =
          await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
      var boxItems = box.values.cast<TransactionTypeModel>().toList();
      var content = model.content;
      for (var item in content!) {
        // Check if the name of the item in list1 is not equal to any name in list2
        if (!boxItems.any((element) => element.name == item.name)) {
          // Add the item to list2
          box.add(item);
        }
      }
      fetchShoppingData();
      shoppingType = box.values.cast<TransactionTypeModel>().toList();
      print(shoppingType[0].content?[0].name);
      shoppingTypeCubit.onUpdateData(shoppingType);
      await box.close();
    } else if (model.name == "الاهداف المالية المستهدفة") {
      final box = await Hive.openBox<DropdownModel>("targetBox");
      var boxItems = box.values.cast<DropdownModel>().toList();
      for (var item in targets) {
        // Check if the name of the item in list1 is not equal to any name in list2
        if (!boxItems.any((element) => element.name == item.name)) {
          // Add the item to list2
          box.add(item);
        }
      }
      fetchTargetData();
      targetList = box.values.cast<DropdownModel>().toList();
      print(targetList[0].name);
      targetCubit.onUpdateData(targetList);
      await box.close();
    } else if (model.name == "المعاملات النقدية") {
      final box = await Hive.openBox<DropdownModel>("cashTransactionBox");
      var boxItems = box.values.cast<DropdownModel>().toList();
      for (var item in cashTransactions) {
        // Check if the name of the item in list1 is not equal to any name in list2
        if (!boxItems.any((element) => element.name == item.name)) {
          // Add the item to list2
          box.add(item);
        }
      }
      fetchCashTransactionData();
      cashTransactionList = box.values.cast<DropdownModel>().toList();
      print(cashTransactionList[0].name);
      cashTransactionCubit.onUpdateData(cashTransactionList);
      await box.close();
    }
  }

  addTransactionType(TransactionTypeModel model, String type) async {
    if (type == "الالتزامات") {
      final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
      box.add(model);
      print(box.values.length);
      print('success');
      transactionType = box.values.cast<TransactionTypeModel>().toList();
      transactionTypeCubit.onUpdateData(transactionType);
      print(transactionType[1].name);
    } else if (type == "التسوق والشراء") {
      final box =
          await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
      box.add(model);
      print(box.values.length);
      print('success');
      shoppingType = box.values.cast<TransactionTypeModel>().toList();
      shoppingTypeCubit.onUpdateData(shoppingType);
      print(shoppingType[1].name);
    }
  }

  addTarget(DropdownModel model) async {
    final box = await Hive.openBox<DropdownModel>("targetBox");
    box.add(model);
    print(box.values.length);
    print('success');
    targetList = box.values.cast<DropdownModel>().toList();
    targetCubit.onUpdateData(targetList);
    print(targetList[1].name);
  }

  addCashTransaction(DropdownModel model) async {
    final box = await Hive.openBox<DropdownModel>("cashTransactionBox");
    box.add(model);
    print(box.values.length);
    print('success');
    cashTransactionList = box.values.cast<DropdownModel>().toList();
    cashTransactionCubit.onUpdateData(cashTransactionList);
    print(cashTransactionList[1].name);
  }

  addTransactionContent(TransactionContentModel model, String type) async {
    if (type == "الالتزامات") {
      final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
      int modelIndex =
          box.values.toList().indexWhere((model) => model.name == commitmentId);
      var transactionType = box.getAt(modelIndex);
      print(modelIndex);
      transactionType?.content?.add(model);
      box.putAt(modelIndex, transactionType!);
      transactionContentCubit.onUpdateData(transactionType.content!);
      print(transactionType.content?[0].name);
      print(box.values.length);
      print('success');
    } else if (type == "التسوق والشراء") {
      final box =
          await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
      int modelIndex =
          box.values.toList().indexWhere((model) => model.name == commitmentId);
      var shoppingType = box.getAt(modelIndex);
      print(modelIndex);
      shoppingType?.content?.add(model);
      box.putAt(modelIndex, shoppingType!);
      transactionContentCubit.onUpdateData(shoppingType.content!);
      print(shoppingType.content?[0].name);
      print(box.values.length);
      print('success');
    }
  }

  Future<void> fetchShoppingData() async {
    final box =
        await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
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

  Future<void> fetchTargetData() async {
    final box = Hive.box<TransactionTypeModel>("targetBox");
    try {
      var list = box.values.map((dynamic value) {
        if (value is DropdownModel) {
          return value;
        } else {
          return DropdownModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
      targetList.addAll(list);
      targetCubit.onUpdateData(targetList);
    } catch (e) {
      print('Error fetching data from Hive: $e');
    } finally {
      await box.close();
    }
  }

  Future<void> fetchCashTransactionData() async {
    final box = Hive.box<TransactionTypeModel>("cashTransactionBox");
    try {
      var list = box.values.map((dynamic value) {
        if (value is DropdownModel) {
          return value;
        } else {
          return DropdownModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
      cashTransactionList.addAll(list);
      cashTransactionCubit.onUpdateData(cashTransactionList);
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

  addTransactionModel(BuildContext context, String type) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      context: context,
      builder: (context) => SizedBox(
          height: 400.h,
          child: BuildAddTransactionModel(
            data: this,
            type: type,
          )),
    );
  }

  addTransactionContentModel(BuildContext context, String type) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      context: context,
      builder: (context) => SizedBox(
          height: 300.h,
          child: BuildAddTransactionContent(
            data: this,
            type: type,
          )),
    );
  }

  String? commitmentId;
  String? commitmentContentId;
  TransactionTypeModel? selectedCommitment;
  TransactionContentModel? selectedCommitmentContent;

  Future<List<TransactionTypeModel>> getCommitments(
      BuildContext context, List<TransactionTypeModel> model) async {
    List<TransactionTypeModel> total = [];
    total.addAll(model);
    return total;
  }

  Future<List<TransactionContentModel>> getCommitmentsContent(
    BuildContext context,
  ) async {
    List<TransactionContentModel> total = [];
    total.addAll(transactionContentCubit.state.data);
    return total;
  }

  void setSelectCommitment(TransactionTypeModel? model) {
    selectedCommitment = model;
    commitmentId = model?.name;
    print(commitmentId);
    transactionContentCubit.onUpdateData(model?.content ?? []);
  }

  void setSelectCommitmentContent(TransactionContentModel? model) {
    selectedCommitmentContent = model;
  }

  //
  int? iterateTransactionId;
  int? unitId;
  int? commitmentPartyId;
  int? shoppingPartyId;
  int? priorityId;
  int? targetId;
  int? cashTransactionId;
  int? transferId;
  DropdownModel? selectedUnit;
  DropdownModel? selectedCommitmentParty;
  DropdownModel? selectedShoppingParty;
  DropdownModel? selectedPriority;
  DropdownModel? selectedIterateTransaction;
  DropdownModel? selectedTarget;
  DropdownModel? selectedCashTransaction;
  DropdownModel? selectedTransfer;

  List<DropdownModel> cashTransactions = [
    DropdownModel(id: 0, name: "سحب"),
    DropdownModel(id: 1, name: "تحويل"),
  ];
  List<DropdownModel> targets = [
    DropdownModel(id: 0, name: "استثمار"),
    DropdownModel(id: 1, name: "توفير"),
    DropdownModel(id: 2, name: "تشطيب"),
    DropdownModel(id: 3, name: "شراء سيارة"),
    DropdownModel(id: 4, name: "مصاريف مدارس أو جامعة"),
  ];
  List<DropdownModel> shoppingParty = [
    DropdownModel(id: 0, name: "ShoppingParty"),
  ];
  List<DropdownModel> priorities = [
    DropdownModel(id: 0, name: "ضروري"),
    DropdownModel(id: 1, name: "هام"),
    DropdownModel(id: 2, name: "عادي"),
  ];
  List<DropdownModel> commitmentParty = [
    DropdownModel(id: 0, name: "Commitment Party1"),
  ];
  List<DropdownModel> units = [
    DropdownModel(id: 0, name: "كيلوغرام"),
    DropdownModel(id: 1, name: "غرام"),
    DropdownModel(id: 2, name: "طن"),
    DropdownModel(id: 3, name: "متر"),
    DropdownModel(id: 4, name: "كيلومتر"),
    DropdownModel(id: 5, name: "سنتيمتر"),
  ];
  List<DropdownModel> iterateTransaction = [
    DropdownModel(id: 0, name: "يوميا"),
    DropdownModel(id: 1, name: "أسبوعيا"),
    DropdownModel(id: 2, name: "شهريا"),
    DropdownModel(id: 3, name: "ربع سنويا"),
    DropdownModel(id: 4, name: "نصف سنويا"),
    DropdownModel(id: 5, name: "سنويا"),
  ];
  List<DropdownModel> transfer = [
    DropdownModel(id: 0, name: "Transfer"),
  ];

  Future<List<DropdownModel>> getCommitmentParty(BuildContext context) async {
    return commitmentParty;
  }

  Future<List<DropdownModel>> getUnits(BuildContext context) async {
    return units;
  }

  Future<List<DropdownModel>> getPriority(BuildContext context) async {
    return priorities;
  }

  Future<List<DropdownModel>> getShoppingParty(BuildContext context) async {
    return shoppingParty;
  }

  Future<List<DropdownModel>> getIterateTransaction(
      BuildContext context) async {
    return iterateTransaction;
  }

  Future<List<DropdownModel>> getTarget(BuildContext context) async {
    List<DropdownModel> total = [];
    total.addAll(targetCubit.state.data);
    return total;
  }

  Future<List<DropdownModel>> getCashTransactions(BuildContext context) async {
    List<DropdownModel> total = [];
    total.addAll(cashTransactionCubit.state.data);
    return total;
  }

  Future<List<DropdownModel>> getTransfer(BuildContext context) async {
    return transfer;
  }

  void setSelectTarget(DropdownModel? model) {
    selectedTarget = model;
    targetId = model?.id;
    print(targetId);
  }

  void setSelectPriority(DropdownModel? model) {
    selectedPriority = model;
    priorityId = model?.id;
  }

  void setSelectCommitmentParty(DropdownModel? model) {
    selectedCommitmentParty = model;
    commitmentPartyId = model?.id;
  }

  void setSelectUnit(DropdownModel? model) {
    selectedUnit = model;
    unitId = model?.id;
  }

  void setSelectShoppingParty(DropdownModel? model) {
    selectedShoppingParty = model;
    shoppingPartyId = model?.id;
  }

  void setSelectIterateTransaction(DropdownModel? model) {
    selectedIterateTransaction = model;
    iterateTransactionId = model?.id;
  }

  void setSelectCashTransactions(DropdownModel? model) {
    selectedCashTransaction = model;
    cashTransactionId = model?.id;
    print(cashTransactionId);
  }

  void setSelectTransfer(DropdownModel? model) {
    selectedTransfer = model;
    transferId = model?.id;
  }

  showSelectTypeDialog(BuildContext context) {
    return showAdaptiveActionSheet(
      context: context,
      isDismissible: false,
      androidBorderRadius: 15,
      actions: <BottomSheetAction>[
        BottomSheetAction(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(title: "Take Photo", size: 14, color: MyColors.black),
            ],
          ),
          onPressed: (context) {
            Navigator.of(context).pop();
            setCameraImages(context);
          },
        ),
        BottomSheetAction(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                title: "Gallery",
                size: 14,
                color: MyColors.black,
              ),
            ],
          ),
          onPressed: (context) {
            Navigator.of(context).pop();
            setGalleryImages(context);
          },
        ),
      ],
      cancelAction: CancelAction(
          title: MyText(
        title: "Cancel",
        size: 14,
        color: MyColors.secondary,
        fontWeight: FontWeight.bold,
      )),
    );
  }

  setGalleryImages(BuildContext context) async {
    var image = await Utils.getImage(false);
    imageBloc.onUpdateData(image);
  }

  setCameraImages(BuildContext context) async {
    var images = await Utils.getImage(true);
    imageBloc.onUpdateData(images);
  }

  void removeImage(BuildContext context) async {
    imageBloc.onUpdateData(null);
  }

  clearData() {}

  addTransaction(BuildContext context, String type) async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    if (formKey.currentState!.validate() &&
        formKey1.currentState!.validate() &&
        formKey2.currentState!.validate()) {
      if (type == "الالتزامات") {
        AddTransactionModel model = AddTransactionModel(
          transactionName: "الالتزامات",
          transactionType: selectedCommitment,
          transactionContent: selectedCommitmentContent,
          incomeSource: selectedWalletModel,
          unit: selectedUnit?.name,
          amount: amountController.text,
          total: totalController.text,
          commitmentParty: selectedDatabaseModel,
          priority: selectedPriority?.name,
          time: timeController.text,
          transactionDate: dateController.text,
          repeated: iterateCubit.state.data != false
              ? selectedIterateTransaction
              : null,
          notify: notifyCubit.state.data,
        );
        var total = double.parse(totalController.text);
        if (total <= selectedWalletModel!.balance) {
          var walletBox = Hive.box<WalletModel>(databaseBox);
          var walletList = walletBox.values.toList();
          WalletModel? targetModel = walletList.firstWhere(
            (model) => model.name == selectedWalletModel?.name,
          );
          print("object ${targetModel.name}");
          targetModel.balance = targetModel.balance - total;
          print("balance ${targetModel.balance}");
          await walletBox.put(selectedWalletModel?.key, targetModel);
          print(selectedWalletModel!.balance);
          box.add(model);
          addTransactionList = box.values.toList();
          addTransactionCubit.onUpdateData(addTransactionList);
          AutoRouter.of(context).pop();
          AutoRouter.of(context).replace(HomeRoute(index: 0));
        } else if (total > selectedWalletModel!.balance) {
          print(selectedWalletModel!.balance);
          CustomToast.showSimpleToast(
              msg: "المبلغ الذي أدخلته أكبر من قيمة المحفظة",
              color: Colors.red);
        }
      } else if (type == "التسوق والشراء") {
        AddTransactionModel model = AddTransactionModel(
          transactionName: "التسوق والشراء",
          transactionType: selectedCommitment,
          transactionContent: selectedCommitmentContent,
          shoppingParty: selectedDatabaseModel,
          incomeSource: selectedWalletModel,
          unit: selectedUnit?.name,
          amount: amountController.text,
          total: totalController.text,
          brandName: brandController.text,
          priority: selectedPriority?.name,
          time: timeController.text,
          transactionDate: dateController.text,
          image: imageBloc.state.data,
          repeated: iterateCubit.state.data != false
              ? selectedIterateTransaction
              : null,
          notify: notifyCubit.state.data,
        );
        var total = double.parse(totalController.text);
        if (total <= selectedWalletModel!.balance) {
          var walletBox = Hive.box<WalletModel>(databaseBox);
          var walletList = walletBox.values.toList();
          WalletModel? targetModel = walletList.firstWhere(
            (model) => model.name == selectedWalletModel?.name,
          );
          print("object ${targetModel.name}");
          targetModel.balance = targetModel.balance - total;
          print("balance ${targetModel.balance}");
          await walletBox.put(selectedWalletModel?.key, targetModel);
          print(selectedWalletModel!.balance);
          box.add(model);
          addTransactionList = box.values.toList();
          addTransactionCubit.onUpdateData(addTransactionList);
          AutoRouter.of(context).pop();
          AutoRouter.of(context).replace(HomeRoute(index: 0));
        } else if (total > selectedWalletModel!.balance) {
          print(selectedWalletModel!.balance);
          CustomToast.showSimpleToast(
              msg: "المبلغ الذي أدخلته أكبر من قيمة المحفظة",
              color: Colors.red);
        }
      } else if (type == "الاهداف المالية المستهدفة") {
        AddTransactionModel model = AddTransactionModel(
          transactionName: "الاهداف المالية المستهدفة",
          targetType: selectedTarget,
          incomeSource: selectedWalletModel,
          targetValue: targetController.text,
          startDate: startDateController.text,
          endDate: endDateController.text,
          time: timeController.text,
          transactionDate: dateController.text,
          repeated: iterateCubit.state.data != false
              ? selectedIterateTransaction
              : null,
          notify: notifyCubit.state.data,
        );
        var total = double.parse(targetController.text);
        if (total <= selectedWalletModel!.balance) {
          var walletBox = Hive.box<WalletModel>(databaseBox);
          var walletList = walletBox.values.toList();
          WalletModel? targetModel = walletList.firstWhere(
            (model) => model.name == selectedWalletModel?.name,
          );
          print("object ${targetModel.name}");
          targetModel.balance = targetModel.balance - total;
          print("balance ${targetModel.balance}");
          await walletBox.put(selectedWalletModel?.key, targetModel);
          print(selectedWalletModel!.balance);
          box.add(model);
          addTransactionList = box.values.toList();
          addTransactionCubit.onUpdateData(addTransactionList);
          AutoRouter.of(context).pop();
          AutoRouter.of(context).replace(HomeRoute(index: 0));
        } else if (total > selectedWalletModel!.balance) {
          print(selectedWalletModel!.balance);
          CustomToast.showSimpleToast(
              msg: "المبلغ الذي أدخلته أكبر من قيمة المحفظة",
              color: Colors.red);
        }
      } else if (type == "المعاملات النقدية") {
        AddTransactionModel model = AddTransactionModel(
          transactionName: "المعاملات النقدية",
          cashTransactionType: selectedCashTransaction,
          incomeSource: selectedWalletModel,
          transferTo: selectedDatabaseModel,
          priority: selectedPriority?.name,
          total: transferController.text,
          time: timeController.text,
          transactionDate: dateController.text,
          repeated: iterateCubit.state.data != false
              ? selectedIterateTransaction
              : null,
          notify: notifyCubit.state.data,
        );
        var total = double.parse(transferController.text);
        if (total <= selectedWalletModel!.balance) {
          var walletBox = Hive.box<WalletModel>(databaseBox);
          var walletList = walletBox.values.toList();
          WalletModel? targetModel = walletList.firstWhere(
            (model) => model.name == selectedWalletModel?.name,
          );
          print("object ${targetModel.name}");
          targetModel.balance = targetModel.balance - total;
          print("balance ${targetModel.balance}");
          await walletBox.put(selectedWalletModel?.key, targetModel);
          print(selectedWalletModel!.balance);
          box.add(model);
          addTransactionList = box.values.toList();
          addTransactionCubit.onUpdateData(addTransactionList);
          AutoRouter.of(context).pop();
          AutoRouter.of(context).replace(HomeRoute(index: 0));
        } else if (total > selectedWalletModel!.balance) {
          print(selectedWalletModel!.balance);
          CustomToast.showSimpleToast(
              msg: "المبلغ الذي أدخلته أكبر من قيمة المحفظة",
              color: Colors.red);
        }
      }
    } else {
      CustomToast.showSimpleToast(
          msg: "أكمل بيانات الإضافة أولا لاتمام اضافة المعاملة",
          color: Colors.red);
    }
  }

  WalletModel? selectedWalletModel;
  DatabaseModel? selectedDatabaseModel;
  String? walletName;
  String? databaseName;

  void setSelectWalletModel(WalletModel? model) {
    selectedWalletModel = model;
    walletName = model?.name;
  }

  void setSelectDatabaseModel(DatabaseModel? model) {
    selectedDatabaseModel = model;
    databaseName = model?.name;
  }

  Future<List<WalletModel>> getWalletData(BuildContext context) async {
    var walletBox = Hive.box<WalletModel>(databaseBox);
    List<WalletModel> total = walletBox.values.toList();
    return total;
  }

  Future<List<DatabaseModel>> getDatabaseData(BuildContext context) async {
    var databaseData = Hive.box<DatabaseModel>(database);
    List<DatabaseModel> total = databaseData.values.toList();
    return total;
  }
}
