part of 'transactions_types_widgets_imports.dart';

class BuildTransactionsView extends StatelessWidget {
  const BuildTransactionsView({Key? key, required this.data}) : super(key: key);
  final TransactionsTypesData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: data.transactionContentCubit,
          builder: (context, state) {
            return BuildTransactionItem(
              name: "المصروفات",
              image: Res.budget,
              onTap: () =>
                  data.transactionContentCubit.onUpdateData(
                      !data.transactionContentCubit.state.data),
              hasContent: state.data,
              content: BlocBuilder<GenericBloc<List<DropdownModel>>, GenericState<List<DropdownModel>>>(
                bloc: data.commitmentsCubit,
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.data.length,
                    itemBuilder: (context,i)=>BuildTransactionItem(
                      onTap: () {
                        state.data[i].isSelected=!state.data[i].isSelected!;
                        data.commitmentsCubit.onUpdateData(state.data);
                      },
                      name: state.data[i].name??"",
                      radius: 18.r,
                      width: 18.w,
                      height: 18.w,
                      hasContent: state.data[i].isSelected,
                      content: i==0?BuildCommitmentsView(data: data,):Container(),
                    ),
                  );
                },
              ),
            );
          },
        ),
        BuildTransactionItem(
          onTap: () => AutoRouter.of(context).push(const TargetRoute()),
          name: "الأهداف المالية المستهدفة",
          image: Res.budget,
        ),
        BuildTransactionItem(
          onTap: () =>
              AutoRouter.of(context).push(const CashTransactionsRoute()),
          name: "المعاملات النقدية",
          image: Res.transaction,
        ),
        BuildTransactionItem(
          onTap: () =>
              AutoRouter.of(context).push(const RecurringTransactionsRoute()),
          name: "المعاملات المتكررة",
          image: Res.transaction,
        ),
        // BuildTransactionItem(
        //   onTap: () => data.addTransactionModel(context),
        //   name: "أخري/إضافة",
        //   image: Res.upload,
        // ),
      ],
    );
  }
}
