part of 'transactions_imports.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  TransactionsData data = TransactionsData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios,color: MyColors.white,size: 20.sp,),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: MyColors.white,size: 20.sp,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: MyColors.white,size: 20.sp,)),
        ],
        centerTitle: true,
        title: MyText(
          title: "المعاملات والمصروفات",
          color: MyColors.white,
          size: 16.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>AutoRouter.of(context).push(const AddTransactionRoute(),),
        backgroundColor: MyColors.primary,
        child: Icon(
          Icons.add,
          size: 20.sp,
          color: MyColors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: const SingleChildScrollView(
          child: Column(
            children: [BuildNoRecord()],
          ),
        ),
      ),
    );
  }
}
