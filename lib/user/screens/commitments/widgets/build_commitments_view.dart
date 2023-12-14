part of 'commitments_widgets_imports.dart';

class BuildCommitmentsView extends StatelessWidget {
  const BuildCommitmentsView({Key? key, required this.commitmentsData, required this.model}) : super(key: key);
  final CommitmentsData commitmentsData;
  final List<TransactionTypeModel> model;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: commitmentsData.contentCubit,
          builder: (context, state) {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: model.length,
              itemBuilder: (context,index){
                return BuildTransactionItem(
                  name: model[index].name??"",
                  image: Res.budget,
                  onTap: () =>
                      commitmentsData.contentCubit.onUpdateData(
                          !commitmentsData.contentCubit.state.data),
                  hasContent: state.data,
                  content: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: model[index].content?.length,
                    itemBuilder: (context,i)=>BuildTransactionItem(
                      onTap: ()=>AutoRouter.of(context).push(AddTransactionRoute(model: model[index].content![i], transactionType: model[index].name!)),
                      name: model[index].content?[i].name??"",
                      image: Res.one,
                      radius: 18.r,
                      width: 18.w,
                      height: 18.w,
                    ),
                  ),
                );
              },
            );
          },
        ),
        // BuildTransactionItem(
        //   name: "إيجار",
        //   image: Res.budget,
        //   onTap: ()=>AutoRouter.of(context).push(AddTransactionRoute(model: commitmentsData.contents[0], transactionType: "إيجار")),
        // ),
        // BuildTransactionItem(
        //     name: "أقساط",
        //     image: Res.budget,
        //   onTap: ()=>AutoRouter.of(context).push(AddTransactionRoute(model: commitmentsData.contents[0], transactionType: "أقساط")),
        // ),
        // BuildTransactionItem(
        //     name: "تأمينات",
        //     image: Res.budget,
        //   onTap: ()=>AutoRouter.of(context).push(AddTransactionRoute(model: commitmentsData.contents[0], transactionType: "تأمينات")),
        // ),
        // BuildTransactionItem(
        //     name: "اشتراكات",
        //     image: Res.budget,
        //   onTap: ()=>AutoRouter.of(context).push(AddTransactionRoute(model: commitmentsData.contents[0], transactionType: "اشتراكات")),
        // ),
        BuildTransactionItem(
            name: "أخري/إضافة",
            image: Res.budget,
            onTap: ()  => commitmentsData.addTransactionModel(context),
        ),

      ],
    );
  }
}
