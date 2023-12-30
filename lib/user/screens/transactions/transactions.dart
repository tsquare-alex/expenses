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
    return BlocBuilder<GenericBloc<List<AddTransactionModel>>,
        GenericState<List<AddTransactionModel>>>(
      bloc: data.addTransactionCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  Res.transaction,
                  width: 20.w,
                  height: 20.h,
                  color: MyColors.white,
                ),
                SizedBox(
                  width: 10.w,
                ),
                MyText(
                  title: tr(context, "transactions"),
                  color: Colors.white,
                  size: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            actions: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: MyColors.primary
                ),
                width: 35.w,
                margin: EdgeInsets.only(left: 15.r),
                child: IconButton(
                  onPressed: () =>AutoRouter.of(context).push(HomeRoute(index: 0,pageIndex: 12)),
                  icon: Image.asset(
                    Res.repeatedTransactions,
                    width: 20.w,
                    height: 20.h,
                    color: MyColors.white,
                  ),
                ),
              ),
            ],
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          floatingActionButton: state.data.isEmpty
              ? null
              : FloatingActionButton(
                  backgroundColor: MyColors.primary,
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BuildTransactionTypesView(
                        data: data,
                        homeTabCubit: widget.homeTabCubit,
                        hasData: true,
                      ),
                    ),
                  ),
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.add,
                    color: MyColors.white,
                  ),
                ),
          body: Padding(
            padding: EdgeInsets.all(15.r),
            child: state.data.isEmpty
                ? BuildTransactionTypesView(
                    data: data,
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
