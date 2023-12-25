part of 'transfer_wallet_transaction_imports.dart';

class TransferWalletTransactionData{
  final GlobalKey<FormState> formKey = GlobalKey();

  final GlobalKey<DropdownSearchState> walletDropKey = GlobalKey();

  TextEditingController walletController = TextEditingController();

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

  editWallet(BuildContext context, AddTransactionModel model) async{
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    var modelList = box.values.toList();
    var targetModel = modelList.firstWhere((element) => element.key==model.key);
    targetModel.incomeSource = selectedWalletModel!;
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    var walletList = walletBox.values.toList();
    if(selectedWalletModel!=null){
      WalletModel? currentWallet = walletList.firstWhere(
            (item) => item.name == model.incomeSource?.name,
      );
      WalletModel? targetWallet = walletList.firstWhere(
            (item) => item.name == selectedWalletModel?.name,
      );
      double total = double.parse(model.total!);
      currentWallet.balance=currentWallet.balance+total;
      targetWallet.balance=targetWallet.balance-total;
      walletBox.put(currentWallet.key, currentWallet);
      walletBox.put(targetWallet.key, targetWallet);
      box.put(targetModel.key, targetModel);
    }
    AutoRouter.of(context).pop();
    AutoRouter.of(context).replace(HomeRoute(index: 1,pageIndex: 7));
  }
}