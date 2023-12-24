part of 'budget_imports.dart';

class Budget extends StatelessWidget {
  const Budget({super.key});

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BudgetCubit()..fetchData(),
      child: BlocBuilder<BudgetCubit, BudgetState>(
        builder: (context, state) {
          return Scaffold(
            body: Column(children: [
              Expanded(
                child: BlocBuilder<BudgetCubit, BudgetState>(
                  builder: (context, state) {
                    List<BudgetModel> data =
                        BlocProvider.of<BudgetCubit>(context).budgetList;
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.h),
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) =>
                            ItemBudget(model: data[index], percent: 0.4),
                      ),
                    );
                  },
                ),
              ),
            ]),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await AutoRouter.of(context)
                    .push(const AddTransactionBudgetRoute());
                if (context.mounted) {
                  context.read<BudgetCubit>().fetchData();
                }
              },
              backgroundColor: MyColors.primary,
              child: Icon(
                Icons.add,
                size: 20.sp,
                color: MyColors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}















































// import 'package:auto_route/auto_route.dart';
// import 'package:expenses/general/constants/MyColors.dart';
// import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
// import 'package:expenses/user/screens/budget/widget/custom_icon.dart';
// import 'package:expenses/user/screens/budget/widget/item_budget.dart';
// import 'package:flutter/material.dart';

// class Budget extends StatelessWidget {
//   const Budget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         Expanded(
//           child: ListView.separated(
//             itemCount: 5,
//             itemBuilder: (context, index) => const ItemBudget(
//                 precent: 0.4,
//                 title: "title",
//                 value: "value",
//                 secValue: "secValue"),
//             separatorBuilder: (BuildContext context, int index) {
//               return Divider(
//                 color: MyColors.black,
//               );
//             },
//           ),
//         ),
//         CustomIcon(
//           onPressed: () {
//             AutoRouter.of(context).push(const AddTransactionBudgetRoute());
//           },
//         ),
//       ]),
//     );
//   }
// }
