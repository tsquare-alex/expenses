part of 'shopping_widgets_imports.dart';

class BuildShoppingView extends StatelessWidget {
  const BuildShoppingView({Key? key, required this.model}) : super(key: key);
  final List<TransactionTypeModel> model;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: model.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 0.5 / 0.8),
      itemBuilder: (context, i) => BuildShoppingItem(
        onTap: (){
          AutoRouter.of(context).push(AddTransactionRoute(model: model[i],transactionName: "التسوق والشراء"));
        },
        image: model[i].image??Res.shopping,
        name: model[i].name??"",
      ),
    );
  }
}
