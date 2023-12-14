part of 'transactions_types_widgets_imports.dart';

class BuildTransactionsView extends StatelessWidget {
  const BuildTransactionsView({Key? key, required this.data}) : super(key: key);
  final TransactionsTypesData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GenericBloc<bool>, GenericState<bool>>(
          bloc: data.contentCubit,
          builder: (context, state) {
            return BuildTransactionItem(
              name: "المصروفات",
              image: Res.budget,
              onTap: () =>
                  data.contentCubit.onUpdateData(!data.contentCubit.state.data),
              hasContent: state.data,
              content: Column(
                children: [
                  BuildTransactionItem(
                    onTap: () =>
                        AutoRouter.of(context).push(const CommitmentsRoute()),
                    name: "الالتزامات",
                    image: Res.one,
                    radius: 18.r,
                    width: 18.w,
                    height: 18.w,
                  ),
                  BuildTransactionItem(
                    onTap: () =>
                        AutoRouter.of(context).push(const ShoppingRoute()),
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
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: data.transactionType.values.length,
          itemBuilder: (context, i) {
            final List<TransactionTypeModel> people = data.transactionType.values.cast<TransactionTypeModel>().toList();
            return BuildTransactionItem(
              onTap: () {},
              name: people[i].name??"",
              image: Res.upload,
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
