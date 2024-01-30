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
        page: CommitmentsRoute(model: data.transactions[0]),
        name: "commitments",
        image: Res.commitments,
      ),
      TransactionModel(
        id: 14,
        page: ShoppingScreenRoute(model: data.transactions[1]),
        name: "shopping",
        image: Res.shopping,
      ),
      TransactionModel(
        id: 10,
        page: TargetRoute(model: data.transactions[2]),
        name: "target",
        image: Res.target,
      ),
      TransactionModel(
        id: 11,
        page: CashTransactionsRoute(model: data.transactions[3]),
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
            backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                ? AppDarkColors.backgroundColor
                : MyColors.white,
            title: MyText(
              title: tr(context, "transactions"),
              color: context.watch<AppThemeCubit>().isDarkMode
                  ? MyColors.white
                  : MyColors.black,
              size: 18.sp,
              fontWeight: FontWeight.bold,
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(left: 15.r),
                child: IconButton(
                  onPressed: () => AutoRouter.of(context)
                      .push(const RepeatedTransactionsRoute()),
                  icon: Image.asset(
                    Res.repeated,
                    width: 35.w,
                    height: 35.h,
                    color: context.watch<AppThemeCubit>().isDarkMode
                        ? MyColors.secondary
                        : MyColors.primary,
                  ),
                ),
              ),
            ],
            leading: InkWell(
              onTap: () => AutoRouter.of(context).pop(),
              child: Icon(
                Icons.arrow_back,
                color: context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    : MyColors.black,
              ),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(15.r),
            child: BuildTransactionTypesView(
              model: model,
              homeTabCubit: widget.homeTabCubit,
            ),
          ),
        );
      },
    );
  }
}
