part of 'commitments_widgets_imports.dart';

class BuildCommitmentView extends StatelessWidget {
  const BuildCommitmentView({Key? key, required this.model}) : super(key: key);
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
          childAspectRatio: 0.52 / 0.9),
      itemBuilder: (context, i) => BuildCommitmentItem(
        onTap: (){
          AutoRouter.of(context).push(AddTransactionRoute(model: model[i],transactionName: "الالتزامات"));
        },
        image: model[i].image??Res.commitments,
        name: model[i].name??"",
      ),
    );
  }
}
