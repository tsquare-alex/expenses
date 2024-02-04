part of 'add_transaction_imports.dart';

class AddTransactionData {
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<FormState> formKey1 = GlobalKey();
  final GlobalKey<FormState> formKey2 = GlobalKey();
  GenericBloc<bool> contentCubit = GenericBloc(false);
  GenericBloc<bool> iterateCubit = GenericBloc(false);
  GenericBloc<bool> ratioCubit = GenericBloc(false);
  GenericBloc<bool> notifyCubit = GenericBloc(false);
  GenericBloc<bool> remainderCubit = GenericBloc(false);
  final GenericBloc<Uint8List?> imageBloc = GenericBloc(null);
  final GenericBloc<String?> transactionNameBloc = GenericBloc(null);
  final GenericBloc<TransactionTypeModel?> typeCubit = GenericBloc(null);
  final GenericBloc<List<TransactionContentModel>?> typeContentCubit =
      GenericBloc(null);
  final GenericBloc<List<TransactionTypeModel>> transactionTypeModelCubit =
      GenericBloc([]);
  final GenericBloc<DropdownModel?> targetTypeCubit = GenericBloc(null);
  final GenericBloc<DropdownModel?> cashTypeCubit = GenericBloc(null);

  final GlobalKey<DropdownSearchState> commitmentDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> commitmentContentDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> walletDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> unitsDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> commitmentPartyDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> priorityDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> shoppingPartyDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> iterateTransactionDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> ratioDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> targetDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> cashTransactionDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> transferDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> budgetDropKey = GlobalKey();

  TextEditingController dateController = TextEditingController();
  TextEditingController transactionController = TextEditingController();
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
  TextEditingController initialValueController = TextEditingController();
  TextEditingController requiredValueController = TextEditingController();
  TextEditingController transferController = TextEditingController();
  TextEditingController addNoteController = TextEditingController();
  TextEditingController initValueController = TextEditingController();

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
        minDate: DateTime.now().subtract(Duration(days: 30)),
        onConfirm: (date) {
          dateController.text = DateFormat("dd/MM/yyyy", "en").format(date!);
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

  getContents(TransactionTypeModel model,String name) async{
    final box ;
    if(name == "الالتزامات"){
      box= await Hive.openBox<TransactionTypeModel>("transactionBox");
      var transactionTypeList = box.values.cast<TransactionTypeModel>().toList();
      var targetModel = transactionTypeList.firstWhere((element) => element.key == model.key);
      typeContentCubit.onUpdateData(targetModel.content);
      //box.close();
    }else if(name == "التسوق والشراء"){
      box= await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
      var transactionTypeList = box.values.cast<TransactionTypeModel>().toList();
      var targetModel = transactionTypeList.firstWhere((element) => element.key == model.key);
      typeContentCubit.onUpdateData(targetModel.content);
      box.close();
    }else{
      typeContentCubit.onUpdateData(null);
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
    print(model.name);
    targetList = box.values.cast<DropdownModel>().toList();
    targetCubit.onUpdateData(targetList);
  }

  addCashTransaction(DropdownModel model) async {
    final box = await Hive.openBox<DropdownModel>("cashTransactionBox");
    box.add(model);
    print(box.values.length);
    print('success');
    print(model.name);
    cashTransactionList = box.values.cast<DropdownModel>().toList();
    cashTransactionCubit.onUpdateData(box.values.toList());
  }

  addTransactionContent(TransactionContentModel model, String type,
      TransactionTypeModel typeModel) async {
    if (type == "الالتزامات") {
      final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
      int modelIndex =
          box.values.toList().indexWhere((model) => model.key == typeModel.key);
      var transactionType = box.getAt(modelIndex);
      transactionType?.content?.add(model);
      box.putAt(modelIndex, transactionType!);
      transactionContentCubit.onUpdateData(transactionType.content!);
      transactionTypeCubit.onUpdateData(box.values.toList());
      print(box.values.length);
      typeContentCubit.onUpdateData(transactionType.content!);
      var editModel = box.getAt(modelIndex);
      getContents(editModel!,type);
      print('success');
    } else if (type == "التسوق والشراء") {
      final box = await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
      int modelIndex = box.values.toList().indexWhere((model) => model.key == typeModel.key);
      var shoppingType = box.getAt(modelIndex);
      print(modelIndex);
      shoppingType?.content?.add(model);
      box.putAt(modelIndex, shoppingType!);
      transactionContentCubit.onUpdateData(shoppingType.content!);
      shoppingTypeCubit.onUpdateData(box.values.toList());
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
    final box = Hive.box<DropdownModel>("targetBox");
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
    }
  }

  Future<void> fetchCashTransactionData() async {
    final box = Hive.box<DropdownModel>("cashTransactionBox");
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
          height: 500.h,
          child: BuildAddTransactionModel(
            data: this,
            type: type,
          )),
    );
  }

  addTransactionContentModel(
      BuildContext context, String type, TransactionTypeModel typeModel) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r))),
      context: context,
      builder: (context) => SizedBox(
          height: 500.h,
          child: BuildAddTransactionContent(
            data: this,
            type: type,
            typeModel: typeModel,
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
    commitmentContentId = model?.name;
    print(commitmentContentId);
  }

  //
  int? iterateTransactionId;
  int? unitId;
  int? commitmentPartyId;
  int? shoppingPartyId;
  int? priorityId;
  int? ratioId;
  int? targetId;
  int? cashTransactionId;
  int? transferId;
  DropdownModel? selectedUnit;
  DropdownModel? selectedCommitmentParty;
  DropdownModel? selectedShoppingParty;
  DropdownModel? selectedPriority;
  DropdownModel? selectedRatio;
  DropdownModel? selectedIterateTransaction;
  DropdownModel? selectedTarget;
  DropdownModel? selectedCashTransaction;
  DropdownModel? selectedTransfer;

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


  Future<List<DropdownModel>> getUnits(BuildContext context) async {
    return units;
  }

  Future<List<DropdownModel>> getPriority(BuildContext context) async {
    return priorities;
  }

  Future<List<DropdownModel>> getRatio(BuildContext context) async {
    return ratio;
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


  void setSelectTarget(DropdownModel? model) {
    selectedTarget = model;
    targetId = model?.id;
    print(targetId);
  }

  void setSelectPriority(DropdownModel? model) {
    selectedPriority = model;
    priorityId = model?.id;
  }

  void setSelectRatio(DropdownModel? model) {
    selectedRatio = model;
    ratioId = model?.id;
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

  addTransaction(BuildContext context, String type,TransactionTypeModel transactionType) async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    if (formKey1.currentState!.validate() &&

        formKey2.currentState!.validate()) {
      if (type == "الالتزامات") {
        if(transactionType != null && selectedContent!=null){
          AddTransactionModel model = AddTransactionModel(
            transactionName: "الالتزامات",
            transactionType: transactionType,
            transactionContent: selectedContent,
            incomeSource: selectedWalletModel,
            total: totalController.text,
            database: selectedDatabaseModel,
            budget: selectedBudget,
            priority: selectedPriority,
            image: imageBloc.state.data,
            time: timeController.text,
            description: addNoteController.text,
            transactionDate: dateController.text,
            notify: notifyCubit.state.data,
            repeated: iterateCubit.state.data != false
                ? selectedIterateTransaction
                : null,
          );
          print('mmmm');

          var total = double.parse(totalController.text);
          if (total <= selectedWalletModel!.totalBalance!) {
            var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
            var currencyBox = Hive.box<CurrencyModel>("currencyBox");
            var currencyList = currencyBox.values.toList();
            var walletList = walletBox.values.toList();
            WalletModel? targetModel = walletList.firstWhere(
              (model) => model.name == selectedWalletModel?.name,
            );
            print("object ${targetModel.name}");
            if(targetModel.currency != currencyList[0].mainCurrency){
              if(targetModel.checkedValue ==false){
                print("sss");
                var calculatedTotalBalance = targetModel.totalBalance! - total;
                targetModel.totalBalance = calculatedTotalBalance;
                double remain = (calculatedTotalBalance)/ currencyList[0].value!;
                targetModel.remainBalance = remain;
                await walletBox.put(selectedWalletModel?.key, targetModel);
              }else{
                print("mmm");
                var calculatedTotalBalance = targetModel.totalBalance! - total;
                targetModel.totalBalance = calculatedTotalBalance;
                double remain = calculatedTotalBalance;
                targetModel.remainTotalBalance = remain;
                await walletBox.put(selectedWalletModel?.key, targetModel);
              }
            }else{
              print('mmmm');
              var calculatedTotalBalance = targetModel.totalBalance! - total;
              targetModel.totalBalance = calculatedTotalBalance;
              targetModel.balance = targetModel.balance - total;
              await walletBox.put(selectedWalletModel?.key, targetModel);
            }
            print("balance ${targetModel.totalBalance!}");
            print(selectedWalletModel!.balance!);
            print(selectedWalletModel!.totalBalance!);

            box.add(model);
            addTransactionList = box.values.toList();
            AutoRouter.of(context).pop();
          } else if (total > selectedWalletModel!.totalBalance!) {
            print(selectedWalletModel!.totalBalance!);
            CustomToast.showSimpleToast(
                msg: "المبلغ الذي أدخلته أكبر من قيمة المحفظة",
                color: Colors.red);
          }
        } else {
          CustomToast.showSimpleToast(msg: "اختر المعاملة", color: Colors.red);
        }
      } else if (type == "التسوق والشراء"&& selectedContent!=null) {
        if(transactionType != null){
          AddTransactionModel model = AddTransactionModel(
            transactionName: "التسوق والشراء",
            transactionType: transactionType,
            transactionContent: selectedContent,
            database: selectedDatabaseModel,
            budget: selectedBudget,
            incomeSource: selectedWalletModel,
            unit: selectedUnit,
            amount: amountController.text.isNotEmpty?amountController.text:"1",
            total: totalController.text,
            description: addNoteController.text,
            brandName: brandController.text,
            priority: selectedPriority,
            time: timeController.text,
            transactionDate: dateController.text,
            image: imageBloc.state.data,
            notify: notifyCubit.state.data,
            repeated: iterateCubit.state.data != false
                ? selectedIterateTransaction
                : null,
          );
          var total = double.parse(totalController.text);
          if (total <= selectedWalletModel!.totalBalance!) {
            var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
            var currencyBox = Hive.box<CurrencyModel>("currencyBox");
            var currencyList = currencyBox.values.toList();
            var walletList = walletBox.values.toList();
            WalletModel? targetModel = walletList.firstWhere(
                  (model) => model.name == selectedWalletModel?.name,
            );
            print("object ${targetModel.name}");
            if(targetModel.currency != currencyList[0].mainCurrency){
              if(targetModel.checkedValue ==false){
                print("sss");
                var calculatedTotalBalance = targetModel.totalBalance! - total;
                targetModel.totalBalance = calculatedTotalBalance;
                double remain = (calculatedTotalBalance)/ currencyList[0].value!;
                targetModel.remainBalance = remain;
                await walletBox.put(selectedWalletModel?.key, targetModel);
              }else{
                print("mmm");
                var calculatedTotalBalance = targetModel.totalBalance! - total;
                targetModel.totalBalance = calculatedTotalBalance;
                double remain = calculatedTotalBalance;
                targetModel.remainTotalBalance = remain;
                await walletBox.put(selectedWalletModel?.key, targetModel);
              }
            }else{
              print('mmmm');
              var calculatedTotalBalance = targetModel.totalBalance! - total;
              targetModel.totalBalance = calculatedTotalBalance;
              targetModel.balance = targetModel.balance - total;
              await walletBox.put(selectedWalletModel?.key, targetModel);
            }
            print("balance ${targetModel.totalBalance!}");
            print(selectedWalletModel!.balance!);
            print(selectedWalletModel!.totalBalance!);

            box.add(model);
            addTransactionList = box.values.toList();
            AutoRouter.of(context).pop();
          } else if (total > selectedWalletModel!.totalBalance!) {
            print(selectedWalletModel!.totalBalance!);
            CustomToast.showSimpleToast(
                msg: "المبلغ الذي أدخلته أكبر من قيمة المحفظة",
                color: Colors.red);
          }
        } else {
          CustomToast.showSimpleToast(msg: "اختر المعاملة", color: Colors.red);
        }
      }else if (type == "الاهداف المالية المستهدفة") {
        if(transactionType!=null){
          AddTransactionModel model = AddTransactionModel(
            transactionName: "الاهداف المالية المستهدفة",
            transactionType: transactionType,
            total: targetController.text,
            description: addNoteController.text,
            incomeSource: selectedWalletModel,
            targetValue: targetController.text,
            startDate: startDateController.text,
            budget: selectedBudget,
            endDate: endDateController.text,
            time: timeController.text,
            image: imageBloc.state.data,
            transactionDate: dateController.text,
            ratio: ratioCubit.state.data != false
                ? selectedRatio
                : null,
            repeated: selectedIterateTransaction,
            initialValue: double.parse(initialValueController.text),
            requiredValue: double.parse(requiredValueController.text),
            notify: notifyCubit.state.data,
            putReminderInWallet: remainderCubit.state.data,
          );
          var total = double.parse(initialValueController.text);
          if (total <= selectedWalletModel!.totalBalance!) {
            var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
            var currencyBox = Hive.box<CurrencyModel>("currencyBox");
            var currencyList = currencyBox.values.toList();
            var walletList = walletBox.values.toList();
            WalletModel? targetModel = walletList.firstWhere(
                  (model) => model.name == selectedWalletModel?.name,
            );
            print("object ${targetModel.name}");
            if(targetModel.currency != currencyList[0].mainCurrency){
              if(targetModel.checkedValue ==false){
                print("sss");
                var calculatedTotalBalance = targetModel.totalBalance! - total;
                targetModel.totalBalance = calculatedTotalBalance;
                double remain = (calculatedTotalBalance)/ currencyList[0].value!;
                targetModel.remainBalance = remain;
                await walletBox.put(selectedWalletModel?.key, targetModel);
              }else{
                print("mmm");
                var calculatedTotalBalance = targetModel.totalBalance! - total;
                targetModel.totalBalance = calculatedTotalBalance;
                double remain = calculatedTotalBalance;
                targetModel.remainTotalBalance = remain;
                await walletBox.put(selectedWalletModel?.key, targetModel);
              }
            }else{
              print('mmmm');
              var calculatedTotalBalance = targetModel.totalBalance! - total;
              targetModel.totalBalance = calculatedTotalBalance;
              targetModel.balance = targetModel.balance - total;
              await walletBox.put(selectedWalletModel?.key, targetModel);
            }
            print("balance ${targetModel.totalBalance!}");
            print(selectedWalletModel!.balance!);
            print(selectedWalletModel!.totalBalance!);

            box.add(model);
            addTransactionList = box.values.toList();
            AutoRouter.of(context).pop();
          } else if (total > selectedWalletModel!.totalBalance!) {
            print(selectedWalletModel!.totalBalance!);
            CustomToast.showSimpleToast(
                msg: "المبلغ الذي أدخلته أكبر من قيمة المحفظة",
                color: Colors.red);
          }
        } else {
          CustomToast.showSimpleToast(msg: "اختر المعاملة", color: Colors.red);
        }
      }else if (type == "المعاملات النقدية") {
        if(transactionType !=null){
          AddTransactionModel model = AddTransactionModel(
            transactionName: "المعاملات النقدية",
            transactionType: transactionType,
            incomeSource: selectedWalletModel,
            database: selectedDatabaseModel,
            priority: selectedPriority,
            description: addNoteController.text,
            total: transferController.text,
            time: timeController.text,
            transactionDate: dateController.text,
            image: imageBloc.state.data,
            budget: selectedBudget,
            notify: notifyCubit.state.data,
            repeated: iterateCubit.state.data != false
                ? selectedIterateTransaction
                : null,
          );
          var total = double.parse(totalController.text);
          if (total <= selectedWalletModel!.totalBalance!) {
            var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
            var currencyBox = Hive.box<CurrencyModel>("currencyBox");
            var currencyList = currencyBox.values.toList();
            var walletList = walletBox.values.toList();
            WalletModel? targetModel = walletList.firstWhere(
                  (model) => model.name == selectedWalletModel?.name,
            );
            print("object ${targetModel.name}");
            if(targetModel.currency != currencyList[0].mainCurrency){
              if(targetModel.checkedValue ==false){
                print("sss");
                var calculatedTotalBalance = targetModel.totalBalance! - total;
                targetModel.totalBalance = calculatedTotalBalance;
                double remain = (calculatedTotalBalance)/ currencyList[0].value!;
                targetModel.remainBalance = remain;
                await walletBox.put(selectedWalletModel?.key, targetModel);
              }else{
                print("mmm");
                var calculatedTotalBalance = targetModel.totalBalance! - total;
                targetModel.totalBalance = calculatedTotalBalance;
                double remain = calculatedTotalBalance;
                targetModel.remainTotalBalance = remain;
                await walletBox.put(selectedWalletModel?.key, targetModel);
              }
            }else{
              print('mmmm');
              var calculatedTotalBalance = targetModel.totalBalance! - total;
              targetModel.totalBalance = calculatedTotalBalance;
              targetModel.balance = targetModel.balance - total;
              await walletBox.put(selectedWalletModel?.key, targetModel);
            }
            print("balance ${targetModel.totalBalance!}");
            print(selectedWalletModel!.remainBalance!);
            print(selectedWalletModel!.totalBalance!);

            box.add(model);
            addTransactionList = box.values.toList();
            AutoRouter.of(context).pop();
          } else if (total > selectedWalletModel!.totalBalance!) {
            print(selectedWalletModel!.totalBalance!);
            CustomToast.showSimpleToast(
                msg: "المبلغ الذي أدخلته أكبر من قيمة المحفظة",
                color: Colors.red);
          }
        } else {
          CustomToast.showSimpleToast(msg: "اختر المعاملة", color: Colors.red);
        }
      }
    } else {
      CustomToast.showSimpleToast(
          msg: "أكمل بيانات الإضافة أولا لاتمام اضافة المعاملة",
          color: Colors.red);
    }
  }

  WalletModel? selectedWalletModel;
  BudgetModel? selectedBudget;
  DatabaseModel? selectedDatabaseModel;
  String? walletName;
  String? budgetName;
  String? databaseName;

  void setSelectWalletModel(WalletModel? model) {
    selectedWalletModel = model;
    walletName = model?.name;
  }

  void setSelectBudgetModel(BudgetModel? model) {
    selectedBudget = model;
    // budgetName = model?."budgetName";
  }

  void setSelectDatabaseModel(DatabaseModel? model) {
    selectedDatabaseModel = model;
    databaseName = model?.name;
  }

  Future<List<WalletModel>> getWalletData(BuildContext context) async {
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    List<WalletModel> total = walletBox.values.toList();
    return total;
  }

  Future<List<DatabaseModel>> getDatabaseData(BuildContext context) async {
    var databaseData = Hive.box<DatabaseModel>(database);
    List<DatabaseModel> total = databaseData.values.toList();
    return total;
  }

  Future<List<BudgetModel>> getBudgetData(BuildContext context) async {
    var budgetData = Hive.box<BudgetModel>("budgetBox");
    List<BudgetModel> total = budgetData.values.toList();
    return total;
  }

  GenericBloc<TransactionContentModel?> contentBloc = GenericBloc(null);

  TransactionContentModel? selectedContent;

  selectContent(bool value, TransactionTypeModel typeModel,TransactionContentModel contentModel,int index, String type,String boxName) async{
    final box = await Hive.openBox<TransactionTypeModel>(boxName);
    print(type);
    int modelIndex =
    box.values.toList().indexWhere((model) => model.key == typeModel.key);

    var neededTransactionType = box.getAt(modelIndex);
    neededTransactionType?.content?.map((e) => e.selected = false).toList();
    neededTransactionType?.content?[index].selected = !value;
    selectedContent = neededTransactionType?.content?[index];
    print("index :${neededTransactionType?.content?.length}");
    typeContentCubit.onUpdateData(neededTransactionType?.content);
    print(selectedContent?.name);
  }
}
