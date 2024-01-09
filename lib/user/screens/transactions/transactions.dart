part of 'transactions_imports.dart';

class Transactions extends StatefulWidget {
  const Transactions({
    Key? key,
    required this.homeTabCubit,
  }) : super(key: key);
  final GenericBloc<int> homeTabCubit;

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  TransactionsData data = TransactionsData();

  @override
  void initState() {
    data.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<TransactionModel> model = [
      TransactionModel(
        id: 13,
        page: CommitmentsRoute(model:data.transactions[0]),
        name: "commitments",
        image: Res.commitments,
      ),
      TransactionModel(
        id: 14,
        page: ShoppingRoute(model:data.transactions[1]),
        name: "shopping",
        image: Res.shopping,
      ),
      TransactionModel(
        id: 10,
        page: TargetRoute(model:data.transactions[1]),
        name: "target",
        image: Res.target,
      ),
      TransactionModel(
        id: 11,
        page: CashTransactionsRoute(model:data.transactions[1]),
        name: "cashTransactions",
        image: Res.cash,
      ),
    ];

    return BlocBuilder<GenericBloc<List<AddTransactionModel>>,
        GenericState<List<AddTransactionModel>>>(
      bloc: data.addTransactionCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: MyColors.white,
            title: MyText(
              title: tr(context, "transactions"),
              color: MyColors.black,
              size: 14.sp,
              fontWeight: FontWeight.bold,
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.white
                ),
                width: 35.w,
                margin: EdgeInsets.only(left: 15.r),
                child: IconButton(
                  onPressed: () =>AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex: 12)),
                  icon: Image.asset(
                    Res.repeated,
                    width: 20.w,
                    height: 20.h,
                    color: MyColors.primary,
                  ),
                ),
              ),
            ],
            leading: InkWell(
              onTap: ()=>AutoRouter.of(context).pop(),
              child: Icon(Icons.arrow_back,color: MyColors.black,),
            ),
            centerTitle: true,
          ),
          // floatingActionButton: state.data.isEmpty
          //     ? null
          //     : FloatingActionButton(
          //         backgroundColor: MyColors.primary,
          //         onPressed: () => Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (_) => BuildTransactionTypesView(
          //               data: data,
          //               homeTabCubit: widget.homeTabCubit,
          //               hasData: true,
          //             ),
          //           ),
          //         ),
          //         shape: const CircleBorder(),
          //         child: Icon(
          //           Icons.add,
          //           color: MyColors.white,
          //         ),
          //       ),
          body: Padding(
            padding: EdgeInsets.all(15.r),
            child: state.data.isEmpty
                ? BuildTransactionTypesView(
                    model: model,
                    homeTabCubit: widget.homeTabCubit,
                  )
                : ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, i) => BuildTransactionCard(
                      model: state.data[i],
                      onDelete: () => data.deleteItem(
                        state.data[i],
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }
}
