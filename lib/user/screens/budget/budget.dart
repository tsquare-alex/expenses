part of 'budget_imports.dart';

class Budget extends StatefulWidget {
  const Budget({Key? key,}) : super(key: key);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {

  BudgetData data = BudgetData();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColors.white,
      body: Column(
        children: [
          MyText(title: "budgets", color: MyColors.primary, size: 16.sp,fontWeight: FontWeight.bold,),
        ],
      ),
    );
  }
}
