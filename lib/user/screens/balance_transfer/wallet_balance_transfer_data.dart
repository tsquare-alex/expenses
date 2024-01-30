part of 'wallet_balance_transfer_imports.dart';

class WalletBalanceTransferData{
  final GlobalKey<FormState> formKey = GlobalKey();

  final GlobalKey<DropdownSearchState> walletDropKey = GlobalKey();

  TextEditingController walletController = TextEditingController();
  TextEditingController transferValueController = TextEditingController();

  WalletModel? selectedWalletModel;
  String? walletName;


  void setSelectWalletModel(WalletModel? model) {
    selectedWalletModel = model;
    walletName = model?.name;
  }

  Future<List<WalletModel>> getWalletData(BuildContext context) async {
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    List<WalletModel> total = walletBox.values.toList();
    return total;
  }

  balanceTransfer(BuildContext context, WalletModel model) async{
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    var walletList = walletBox.values.toList();
    if(formKey.currentState!.validate()){
      WalletModel? currentWallet = walletList.firstWhere(
            (item) => item.name == model.name,
      );
      WalletModel? targetWallet = walletList.firstWhere(
            (item) => item.name == selectedWalletModel?.name,
      );
      double transferValue = double.parse(transferValueController.text);
      currentWallet.balance=currentWallet.balance - transferValue;
      targetWallet.balance=targetWallet.balance + transferValue;
      walletBox.put(currentWallet.key, currentWallet);
      walletBox.put(targetWallet.key, targetWallet);
      AutoRouter.of(context).pop();
      AutoRouter.of(context).replace(HomeRoute(index: 1,pageIndex: 7));
    }else{
      CustomToast.showSimpleToast(msg: "check wallet and transfer value");
    }

  }
}