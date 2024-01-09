part of 'repeated_transactions_imports.dart';

class RepeatedTransactions extends StatefulWidget {
  const RepeatedTransactions({Key? key}) : super(key: key);

  @override
  State<RepeatedTransactions> createState() => _RepeatedTransactionsState();
}

class _RepeatedTransactionsState extends State<RepeatedTransactions> {

  RepeatedTransactionsData data = RepeatedTransactionsData();

  @override
  void initState() {
    data.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          children: [
            Image.asset(
              Res.repeatedTransactions,
              width: 20.w,
              height: 20.h,
              color: MyColors.white,
            ),
            SizedBox(
              width: 10.w,
            ),
            MyText(
              title: tr(context, "recurringTransactions"),
              color: Colors.white,
              size: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<GenericBloc<List<AddTransactionModel>>,
          GenericState<List<AddTransactionModel>>>(
        bloc: data.addTransactionCubit,
        builder: (context, state) {
          if (state.data.isEmpty) {
            return const SingleChildScrollView(
              child: BuildNoRecord(),
            );
          } else {
            return Padding(
              padding: EdgeInsets.all(15.0.r),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.data.length,
                itemBuilder: (context, i) => BuildTransactionCard(
                  model: state.data[i],onDelete: ()=>data.deleteItem(state.data[i]),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
