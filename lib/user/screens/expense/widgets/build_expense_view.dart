// part of 'expense_widgets_imports.dart';
//
// class BuildExpenseView extends StatelessWidget {
//   const BuildExpenseView({Key? key, required this.data}) : super(key: key);
//   final ExpenseData data;
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: data.commitments.length,
//       itemBuilder: (context,i)=>BuildTransactionItem(
//         onTap: ()=>AutoRouter.of(context).push(AddTransactionRoute(model: data.commitments[i],)),
//           name: data.commitments[i].name??"",
//         image: data.commitments[i].image,
//       ),
//     );
//   }
// }
