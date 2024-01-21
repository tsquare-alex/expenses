part of 'cash_transactions_widgets_imports.dart';

class BuildCashTransactionsView extends StatefulWidget {
  const BuildCashTransactionsView(
      {Key? key,
      required this.hasData,
      required this.data,
      required this.transactionModel})
      : super(key: key);
  final bool hasData;
  final CashTransactionsData data;
  final TransactionModel transactionModel;

  @override
  State<BuildCashTransactionsView> createState() =>
      _BuildCashTransactionsViewState();
}

class _BuildCashTransactionsViewState extends State<BuildCashTransactionsView> {
  @override
  void initState() {
    widget.data.initData(widget.transactionModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericBloc<List<TransactionTypeModel>>,
        GenericState<List<TransactionTypeModel>>>(
      bloc: widget.data.transactionTypeCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: widget.hasData == true
              ? AppBar(
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  title: Padding(
                    padding: EdgeInsets.only(left: 40.0.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Res.cash,
                          width: 30.w,
                          height: 30.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        MyText(
                          title: tr(context, "cashTransactions"),
                          color: MyColors.black,
                          size: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  leading: InkWell(
                    onTap: () => AutoRouter.of(context).pop(),
                    child: Icon(
                      Icons.arrow_back,
                      color: MyColors.black,
                    ),
                  ),
                  centerTitle: true,
                )
              : null,
          floatingActionButton: widget.hasData == true
              ? FloatingActionButton(
                  backgroundColor: MyColors.primary,
                  onPressed: () {
                    widget.data.addTransactionModel(context);
                  },
                  shape: const CircleBorder(),
                  child: Icon(
                    Icons.add,
                    color: MyColors.white,
                  ),
                )
              : null,
          body: GridView.builder(
            itemCount: state.data.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.w,
                childAspectRatio: 0.5.w / 0.65.h),
            itemBuilder: (context, i) => BuildCashTransactionsItem(
              onTap: () async{
                await AutoRouter.of(context).push(AddTransactionRoute(
                    model: state.data[i],
                    transactionName: "المعاملات النقدية",
                  boxName: "cashTransactionBox",
                ),
                );
                widget.data.fetchData();
              },
              image: state.data[i].image ?? Res.commitments,
              name: state.data[i].name ?? "",
            ),
          ),
        );
      },
    );
  }
}
