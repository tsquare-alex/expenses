part of 'budget_imports.dart';

class Budget extends StatefulWidget {
  const Budget({Key? key}) : super(key: key);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  BudgetData data = BudgetData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: MyText(
          title: "الميزانية والخطط المالية",
          color: MyColors.txtColor,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 500.h,
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) => ItemBudget(
                  precent: 0.4,
                  title: "title",
                  value: "value",
                  secValue: "secValue"),
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: MyColors.black,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
