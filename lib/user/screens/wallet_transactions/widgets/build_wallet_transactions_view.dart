part of 'wallet_transactions_widgets_imports.dart';

class BuildWalletTransactionsView extends StatelessWidget {
  const BuildWalletTransactionsView({Key? key, required this.data, required this.walletModel})
      : super(key: key);
  final WalletTransactionsData data;
  final WalletModel walletModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<AddTransactionModel>>,
        GenericState<List<AddTransactionModel>>>(
      bloc: data.addTransactionCubit,
      builder: (BuildContext context, state){
        if(state.data.isNotEmpty){
          return ListView.builder(
            itemCount: state.data.length,
            itemBuilder: (context, i) => BuildWalletTransactionsItem(
              model: state.data[i],
              // onArrowTap: () => AutoRouter.of(context).push(
              //   TransferWalletTransactionRoute(model: state.data[i]),
              // ),
              onArrowTap: ()=>data.showSelectTypeDialog(context,state.data[i]), data: data, walletModel: walletModel,
            ),
          );
        }else{
          return const BuildNoRecord();
        }
      },
    );
  }
}
