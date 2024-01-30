part of 'transactions_widgets_imports.dart';

class BuildTransactionTypesView extends StatelessWidget {
  const BuildTransactionTypesView(
      {Key? key, required this.model, required this.homeTabCubit, this.hasData})
      : super(key: key);
  final List<TransactionModel> model;
  final GenericBloc<int> homeTabCubit;
  final bool? hasData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: model.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
          childAspectRatio: 0.5/0.7
        ),
        itemBuilder: (context, i) => BuildTransactionTypeItem(
          onTap: () => AutoRouter.of(context)
              .push(model[i].page!),
          image: model[i].image ?? "",
          name: tr(context, model[i].name ?? ""),
        ),
      ),
    );
  }
}
