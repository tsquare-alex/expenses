part of 'cash_transactions_imports.dart';

class CashTransactions extends StatefulWidget {
  const CashTransactions({
    Key? key, required this.model,
  }) : super(key: key);
  final TransactionModel model;

  @override
  State<CashTransactions> createState() => _CashTransactionsState();
}

class _CashTransactionsState extends State<CashTransactions> {
  CashTransactionsData data = CashTransactionsData();

  @override
  void initState() {
    data.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<AddTransactionModel>>, GenericState<List<AddTransactionModel>>>(
      bloc: data.addTransactionCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Row(
              children: [
                Image.asset(
                  Res.cashTransactions,
                  width: 20.w,
                  height: 20.h,
                  color: MyColors.white,
                ),
                SizedBox(
                  width: 10.w,
                ),
                MyText(
                  title: tr(context, "cashTransactions"),
                  color: Colors.white,
                  size: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            automaticallyImplyLeading: false,
          ),
          // floatingActionButton: state.data.isNotEmpty?FloatingActionButton(
          //   onPressed: () =>
          //       AutoRouter.of(context).push(
          //         AddTransactionRoute(
          //           model: data.model,
          //         ),
          //       ),
          //   backgroundColor: MyColors.primary,
          //   child: Icon(
          //     Icons.add,
          //     color: MyColors.white,
          //   ),
          // ):null,
          // body: state.data.isEmpty?AddTransaction(model: data.model):
          // Padding(
          //   padding: EdgeInsets.all(15.0.r),
          //   child: ListView.builder(
          //     physics: const BouncingScrollPhysics(),
          //     shrinkWrap: true,
          //     itemCount: state.data.length,
          //     itemBuilder: (context, i) => BuildTransactionCard(
          //       model: state.data[i], onDelete: () =>
          //         data.deleteItem(state.data[i]),),
          //   ),
          // ),
        );
      },
    );
  }
}
