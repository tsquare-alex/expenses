part of 'transactions_widgets_imports.dart';

class BuildTransactionTypesView extends StatelessWidget {
  const BuildTransactionTypesView({Key? key, required this.data, required this.homeTabCubit})
      : super(key: key);
  final TransactionsData data;
  final GenericBloc<int> homeTabCubit;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: data.model.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10.h, crossAxisSpacing: 10.w),
      itemBuilder: (context, i) => BuildTransactionTypeItem(
        onTap: ()=> homeTabCubit.onUpdateData(data.model[i].id!),
          image: data.model[i].image ?? "",
          name: tr(context, data.model[i].name??""),
      ),
    );
  }
}
