part of 'transactions_types_imports.dart';

class TransactionsTypes extends StatefulWidget {
  const TransactionsTypes({Key? key, required this.homeTabCubit}) : super(key: key);
  final GenericBloc<int> homeTabCubit;
  @override
  State<TransactionsTypes> createState() => _TransactionsTypesState();
}

class _TransactionsTypesState extends State<TransactionsTypes> {

  TransactionsTypesData data = TransactionsTypesData();
  @override
  void initState() {
    data.fetchData();
    data.fetchShippingData();
    data.getCommitments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.0.r),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              BuildTransactionsView(data: data,),
            ],
          ),
        ),
      ),
    );
  }
}
