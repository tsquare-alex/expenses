part of 'wallet_transactions_widgets_imports.dart';

class BuildWalletTransactionsView extends StatelessWidget {
  const BuildWalletTransactionsView({Key? key, required this.data})
      : super(key: key);
  final WalletTransactionsData data;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<AddTransactionModel>>,
        GenericState<List<AddTransactionModel>>>(
      bloc: data.addTransactionCubit,
      builder: (BuildContext context, state) => ListView.builder(
        itemCount: state.data.length,
        itemBuilder: (context, i) => BuildWalletTransactionsItem(
          model: state.data[i],
          onArrowTap: () => AutoRouter.of(context).push(
            TransferWalletTransactionRoute(model: state.data[i]),
          ),
        ),
      ),
    );
  }
}
