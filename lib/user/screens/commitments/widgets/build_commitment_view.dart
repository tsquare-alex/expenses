part of 'commitments_widgets_imports.dart';

class BuildCommitmentView extends StatelessWidget {
  const BuildCommitmentView({Key? key, required this.model, required this.hasData, required this.data,}) : super(key: key);
  final List<TransactionTypeModel> model;
  final CommitmentsData data;
  final bool hasData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hasData == true?AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(left: 40.0.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Res.commitments,
                width: 30.w,
                height: 30.h,
              ),
              SizedBox(
                width: 10.w,
              ),
              MyText(
                title: tr(context, "commitments"),
                color: MyColors.black,
                size: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
        leading: InkWell(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(Icons.arrow_back, color: MyColors.black,),
        ),
        centerTitle: true,
      ):null,
      floatingActionButton: hasData==true?FloatingActionButton(
        backgroundColor: MyColors.primary,
        onPressed: () {
          data.addTransactionModel(context);
        },
        shape: const CircleBorder(),
        child: Icon(Icons.add, color: MyColors.white,),
      ):null,
      body: Padding(
        padding: EdgeInsets.only(top: 8.0.r),
        child: GridView.builder(
          itemCount: model.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.w,
              childAspectRatio: 0.5 / 0.65),
          itemBuilder: (context, i) => BuildCommitmentItem(
            onTap: (){
              AutoRouter.of(context).push(AddTransactionRoute(model: model[i],transactionName: "الالتزامات"));
            },
            image: model[i].image??Res.commitments,
            name: model[i].name??"",
          ),
        ),
      ),
    );
  }
}
