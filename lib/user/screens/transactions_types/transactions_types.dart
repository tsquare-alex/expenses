part of 'transactions_types_imports.dart';

class TransactionsTypes extends StatefulWidget {
  const TransactionsTypes({Key? key}) : super(key: key);

  @override
  State<TransactionsTypes> createState() => _TransactionsTypesState();
}

class _TransactionsTypesState extends State<TransactionsTypes> {

  TransactionsTypesData data = TransactionsTypesData();
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: MyColors.white,
            size: 20.sp,
          ),
        ),
        centerTitle: true,
        title: MyText(
          title: "أصناف/أنواع المعاملات",
          color: MyColors.white,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
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
