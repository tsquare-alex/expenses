part of 'transactions_types_widgets_imports.dart';

class BuildTransactionsView extends StatelessWidget {
  const BuildTransactionsView({Key? key, required this.data}) : super(key: key);
  final TransactionsTypesData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.r),
      child: Column(
        children: [
          BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
            bloc: data.contentCubit,
            builder: (context, state) {
              return BuildTransactionItem(
                name: "المصروفات",
                image: Res.budget,
                onTap: () =>
                    data.contentCubit.onUpdateData(
                        !data.contentCubit.state.data),
                hasContent: state.data,
                content: Column(
                  children: [
                    BuildTransactionItem(
                      onTap: ()=>AutoRouter.of(context).push(const CommitmentsRoute()),
                      name: "الالتزامات",
                      image: Res.one,
                      radius: 18.r,
                      width: 18.w,
                      height: 18.w,
                    ),
                    BuildTransactionItem(
                      onTap: ()=>AutoRouter.of(context).push(const ShoppingRoute()),
                      name: "التسوق والشراء",
                      image: Res.two,
                      radius: 18.r,
                      width: 18.w,
                      height: 18.w,
                    ),
                  ],
                ),
              );
            },
          ),
          BuildTransactionItem(
            onTap: ()=>AutoRouter.of(context).push(const TargetRoute()),
            name: "الأهداف المالية المستهدفة",
            image: Res.budget,
          ),
          BuildTransactionItem(
            onTap: ()=>AutoRouter.of(context).push(const CashTransactionsRoute()),
            name: "المعاملات النقدية",
            image: Res.transaction,
          ),
          BuildTransactionItem(
            onTap: ()=>AutoRouter.of(context).push(const RecurringTransactionsRoute()),
            name: "المعاملات المتكررة",
            image: Res.transaction,
          ),
          BuildTransactionItem(
            onTap: (){},
            name: "أخري/إضافة",
            image: Res.upload,
          ),
        ],
      ),
    );
  }
}
