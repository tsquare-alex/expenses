part of 'add_transaction_widgets_imports.dart';

class BuildTransactionType extends StatelessWidget {
  const BuildTransactionType({Key? key, required this.data, required this.model, required this.transactionType}) : super(key: key);
  final AddTransactionData data;
  final DropdownModel model;
  final String transactionType;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
      bloc: data.contentCubit,
      builder: (context, state) {
        return BuildTransactionItem(
          name: transactionType,
          image: Res.budget,
          onTap: () =>
              data.contentCubit.onUpdateData(
                  !data.contentCubit.state.data),
          hasContent: state.data,
          radius: 20.r,
          content: model!=null?BuildTransactionItem(
            name: model.name??"",
            image: Res.one,
            radius: 18.r,
            width: 16.w,
            height: 18.w,
          ):Container(),
        );
      },
    );
  }
}
