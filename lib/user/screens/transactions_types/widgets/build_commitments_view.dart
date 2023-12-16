part of 'transactions_types_widgets_imports.dart';

class BuildCommitmentsView extends StatelessWidget {
  const BuildCommitmentsView({Key? key, required this.data}) : super(key: key);
  final TransactionsTypesData data;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<TransactionTypeModel>>, GenericState<List<TransactionTypeModel>>>(
      bloc: data.transactionTypeCubit,
      builder: (context, state) {
        return Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.data.length,
              itemBuilder: (context,index){
                return BuildTransactionItem(
                  name: state.data[index].name??"",
                  image: Res.budget,
                  onTap: () {
                    // state.data.map((element) => element.isSelected=false).toList();
                    state.data[index].isSelected=!state.data[index].isSelected!;

                    data.transactionTypeCubit.onUpdateData(state.data);
                    // commitmentsData.contentCubit.onUpdateData(
                    //       !commitmentsData.contentCubit.state.data);
                  },
                  hasContent: state.data[index].isSelected,
                  content: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.data[index].content?.length,
                        itemBuilder: (context,i)=>BuildTransactionItem(
                          //onTap: ()=>AutoRouter.of(context).push(AddTransactionRoute(model: state.data[index].content![i], transactionType: state.data[index].name!)),
                          name: state.data[index].content?[i].name??"",
                          image: Res.one,
                          radius: 18.r,
                          width: 18.w,
                          height: 18.w,
                        ),
                      ),
                      BuildTransactionItem(
                        onTap: ()=>data.addTransactionContentModel(context, index),
                        name: "أخري/إضافة",
                        image: Res.upload,
                        radius: 18.r,
                        width: 18.w,
                        height: 18.w,
                      ),
                    ],
                  ),
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
              onTap: ()  => data.addTransactionModel(context),
            ),

          ],
        );
      },
    );
  }
}
