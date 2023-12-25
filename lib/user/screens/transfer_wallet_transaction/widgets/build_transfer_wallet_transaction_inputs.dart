part of 'transfer_wallet_transaction_widgets_imports.dart';

class BuildTransferWalletTransactionInputs extends StatelessWidget {
  const BuildTransferWalletTransactionInputs({Key? key, required this.transferData}) : super(key: key);
  final TransferWalletTransactionData transferData;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: transferData.formKey,
      child: Column(
        children: [
          GenericTextField(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            controller: transferData.walletController,
            fieldTypes: FieldTypes.readonly,
            type: TextInputType.text,
            action: TextInputAction.next,
            validate: (value) {
              return null;
            },
            label: tr(context, "wallet"),
            margin: EdgeInsets.symmetric(vertical: 10.r),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                    ? AppDarkColors.primary
                    : MyColors.primary,
                radius: 20.r,
                child: Image.asset(
                  Res.wallet,
                  width: 20.w,
                  height: 20.w,
                  color: MyColors.white,
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              Expanded(
                child: DropdownTextField<WalletModel>(
                  dropKey: transferData.walletDropKey,
                  label: tr(context, "selectWallet"),
                  selectedItem: transferData.selectedWalletModel,
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  validate: (value) {
                    if (value == null) {
                      return ("Please fill this field");
                    }
                  },
                  onChange: transferData.setSelectWalletModel,
                  finData: (data) => transferData.getWalletData(
                    context,
                  ),
                  useName: true,
                  buttonsColor: MyColors.primary,
                  searchHint:tr(context, "search"),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
