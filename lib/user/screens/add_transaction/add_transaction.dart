part of 'add_transaction_imports.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({Key? key}) : super(key: key);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction>
    with TickerProviderStateMixin {
  AddTransactionData data = AddTransactionData();

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.primary,
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
        bottom: TabBar(
          controller: tabController,
          padding: EdgeInsets.only(top: 5.r),
          indicatorColor: MyColors.white,
          indicatorWeight: 2,
          indicatorPadding: EdgeInsets.only(bottom: 3.r),
          tabs: [
            MyText(
              title: "المصروفات",
              color: MyColors.white,
              size: 14.sp,
              fontWeight: FontWeight.bold,
              alien: TextAlign.center,
            ),
            MyText(
              title: "الاهداف المالية",
              color: MyColors.white,
              size: 14.sp,
              fontWeight: FontWeight.bold,
              alien: TextAlign.center,
            ),
            MyText(
              title: "المعاملات النقدية",
              color: MyColors.white,
              size: 14.sp,
              fontWeight: FontWeight.bold,
              alien: TextAlign.center,
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: TabBarView(
          controller: tabController,
          children: const [
            // Content for Tab 1
            BuildTransactionsView(),
            // Content for Tab 2
            Center(child: Text('Tab 2 content')),
            // Content for Tab 3
            Center(child: Text('Tab 3 content')),
          ],
        ),
      ),
    );
  }
}
