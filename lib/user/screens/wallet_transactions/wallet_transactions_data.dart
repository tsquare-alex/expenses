part of 'wallet_transactions_imports.dart';

class WalletTransactionsData {
  GenericBloc<List<AddTransactionModel>> addTransactionCubit = GenericBloc([]);

  List<AddTransactionModel> addTransactionList = [];

  showSelectTypeDialog(BuildContext context, AddTransactionModel model) {
    return showAdaptiveActionSheet(
      context: context,
      isDismissible: false,
      androidBorderRadius: 15.r,
      title: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              AutoRouter.of(context)
                  .push(TransactionDetailsRoute(model: model));
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              margin: EdgeInsets.symmetric(vertical: 10.r),
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.greyWhite
                  : MyColors.black,
              width: double.infinity,
              child: Center(
                child: MyText(
                  title: "تعديل المعاملة",
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                  size: 13.sp,
                  fontWeight: FontWeight.bold,
                  alien: TextAlign.center,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              deleteItem(context, model);
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              margin: EdgeInsets.symmetric(vertical: 10.r),
              color: MyColors.greyWhite,
              width: double.infinity,
              child: Center(
                child: MyText(
                  title: "حذف المعاملة",
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.greyWhite
                      : MyColors.black,
                  size: 13.sp,
                  fontWeight: FontWeight.bold,
                  alien: TextAlign.center,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              AutoRouter.of(context).push(
                TransferWalletTransactionRoute(model: model),
              );
            },
            child: Container(
              padding: EdgeInsets.all(10.r),
              margin: EdgeInsets.symmetric(vertical: 10.r),
              color: MyColors.greyWhite,
              width: double.infinity,
              child: Center(
                child: MyText(
                  title: "تحويل المعاملة الي محفظة اخري",
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.greyWhite
                      : MyColors.black,
                  size: 13.sp,
                  fontWeight: FontWeight.bold,
                  alien: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [],
      cancelAction: CancelAction(
          title: MyText(
        title: tr(context, "cancel"),
        size: 14.sp,
        color: context.watch<AppThemeCubit>().isDarkMode
            ? MyColors.greyWhite
            : MyColors.black,
        fontWeight: FontWeight.bold,
      )),
    );
  }

  Future<void> getWalletTransactions(
      BuildContext context, WalletModel model) async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    try {
      var list = box.values.map((dynamic value) {
        if (value is AddTransactionModel) {
          return value;
        } else {
          return AddTransactionModel(); // Replace with your default value or handle it accordingly
        }
      }).toList();
      for (AddTransactionModel item in list) {
        if (item.incomeSource?.name == model.name) {
          addTransactionList.add(item);
        }
      }
      addTransactionCubit.onUpdateData(addTransactionList);
      print(addTransactionCubit.state.data[0].transactionType?.name);
    } catch (e) {
      print('Error fetching data from Hive: $e');
    } finally {
      await box.close();
    }
  }

  Future<void> deleteItem(
    BuildContext context,
    AddTransactionModel targetModel,
  ) async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    // Find the index of the target model in the list
    var modelList = box.values.toList();
    int index = modelList.indexWhere((model) => model.key == targetModel.key);
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    var walletList = walletBox.values.toList();
    WalletModel? targetWallet = walletList.firstWhere(
      (item) => item.name == targetModel.incomeSource?.name,
    );
    var currencyBox = Hive.box<CurrencyModel>("currencyBox");
    var currencyList = currencyBox.values.toList();
    double total = double.parse(targetModel.total!);
    if (targetWallet.currency != currencyList[0].mainCurrency) {
      if (targetWallet.checkedValue == false) {
        print("sss");
        var calculatedTotalBalance = targetWallet.totalBalance! + total;
        targetWallet.totalBalance = calculatedTotalBalance;
        double remain = (calculatedTotalBalance) / currencyList[0].value!;
        targetWallet.remainBalance = remain;
        await walletBox.put(targetWallet.key, targetWallet);
        box.deleteAt(index);
        AutoRouter.of(context).push(
          HomeRoute(index: 1, pageIndex: 7),
        );
      } else {
        print("mmm");
        var calculatedTotalBalance = targetWallet.totalBalance! + total;
        targetWallet.totalBalance = calculatedTotalBalance;
        double remain = calculatedTotalBalance;
        targetWallet.remainTotalBalance = remain;
        await walletBox.put(targetWallet.key, targetWallet);
        box.deleteAt(index);
        AutoRouter.of(context).push(
          HomeRoute(index: 1, pageIndex: 7),
        );
      }
    } else {
      print('mmmm');
      var calculatedTotalBalance = targetWallet.totalBalance! + total;
      targetWallet.totalBalance = calculatedTotalBalance;
      targetWallet.balance = targetWallet.balance + total;
      await walletBox.put(targetWallet.key, targetWallet);
      box.deleteAt(index);
      AutoRouter.of(context).push(
        HomeRoute(index: 1, pageIndex: 7),
      );
    }
    print("balance ${targetWallet.balance}");

    // AutoRouter.of(context).push(HomeRoute(index: 0));
    if (index != -1) {
      print('Index of the target model: $index');
    } else {
      print('Target model not found in the list.');
    }
  }

  // Future<void> deleteItem(BuildContext context,AddTransactionModel targetModel) async {
  //   final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
  //   // Find the index of the target model in the list
  //   var modelList =box.values.toList();
  //   int index = modelList.indexWhere((model) => model.key == targetModel.key);
  //   var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
  //   var walletList = walletBox.values.toList();
  //   WalletModel? targetWallet = walletList.firstWhere(
  //         (item) => item.name == targetModel.incomeSource?.name,
  //   );
  //   double total = double.parse(targetModel.total!);
  //   targetWallet.balance = targetWallet.balance + total;
  //   print("balance ${targetWallet.balance}");
  //   await walletBox.put(targetWallet.key, targetWallet);
  //   box.deleteAt(index);
  //   // var boxList = box.values.toList();
  //   // List<AddTransactionModel> newList = [];
  //   // for (AddTransactionModel item in boxList) {
  //   //   if (item.transactionName == "التسوق والشراء") {
  //   //     newList.add(item);
  //   //   }
  //   // }
  //   // addTransactionCubit.onUpdateData(newList);
  //   AutoRouter.of(context).push(HomeRoute(index: 1,pageIndex: 7),);
  //   if (index != -1) {
  //     print('Index of the target model: $index');
  //   } else {
  //     print('Target model not found in the list.');
  //   }
  // }
}
