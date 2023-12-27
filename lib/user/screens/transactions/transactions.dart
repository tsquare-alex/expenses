part of 'transactions_imports.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key, required this.homeTabCubit,}) : super(key: key);
  final GenericBloc<int> homeTabCubit;
  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  TransactionsData data = TransactionsData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () =>widget.homeTabCubit.onUpdateData(9),
      //   backgroundColor: MyColors.primary,
      //   child: Icon(
      //     Icons.add,
      //     size: 20.sp,
      //     color: MyColors.white,
      //   ),
      // ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: MyColors.amber,
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.all(15.r),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BuildTransactionTypesView(data: data, homeTabCubit: widget.homeTabCubit,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
