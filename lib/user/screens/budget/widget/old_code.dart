// import 'package:auto_route/auto_route.dart';
// import 'package:expenses/general/constants/MyColors.dart';
// import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
// import 'package:expenses/general/packages/localization/Localizations.dart';
// import 'package:expenses/general/widgets/DefaultButton.dart';
// import 'package:expenses/general/widgets/MyText.dart';
// import 'package:expenses/user/screens/budget/budget_imports.dart';
// import 'package:expenses/user/screens/budget/data/cubit/budget_cubit.dart';
// import 'package:expenses/user/screens/budget/data/cubit/budget_state.dart';
// import 'package:expenses/user/screens/budget/data/model/budget_model.dart';
// import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// class AddTransactionBudget extends StatefulWidget {
//   const AddTransactionBudget({super.key});
//   @override
//   State<AddTransactionBudget> createState() => _AddTransactionBudgetState();
// }
// class _AddTransactionBudgetState extends State<AddTransactionBudget> {
//   bool repeatSwitchValue = false;
//   bool notificationSwitchvalu = false;
//   DateTimeRange selectRangeDate =
//       DateTimeRange(start: DateTime.now(), end: DateTime.now());
//   TextEditingController rangeDateController = TextEditingController();
//   TextEditingController walletNameController = TextEditingController();
//   TextEditingController transactionController = TextEditingController();
//   TextEditingController budgetNameController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//   double parsedNumber = 0;
//   BudgetData data = BudgetData();
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => BudgetCubit()..getBudgetData(context),
//         child: BlocBuilder<BudgetCubit, BudgetState>(
//             buildWhen: (previos, current) {
//           return (previos is AddBudgetLoading || current is AddBudgetLoading) ||
//               (current is OpenBudget || current is OpenBudget);
//         }, builder: (context, state) {
//           if (state is AddBudgetLoading) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (state is OpenBudget) {
//             return Column(
//               children: [
//                 Container(
//                   height: 110.h,
//                   width: double.infinity,
//                   color: MyColors.primary,
//                   child: Align(
//                     alignment: Alignment.bottomRight,
//                     child: Row(
//                       children: [
//                         IconButton(
//                           onPressed: () => AutoRouter.of(context).pop(),
//                           icon: const Icon(Icons.arrow_back_ios),
//                           color: MyColors.white,
//                         ),
//                         SizedBox(width: 15.w),
//                         MyText(
//                           title: tr(context, 'add'),
//                           color: Colors.white,
//                           size: 16.sp,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(16.w),
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         SizedBox(height: 15.h),
//                         MyText(
//                             title: "قيمة الميزانية",
//                             color: MyColors.black,
//                             size: 16.sp),
//                         SizedBox(
//                           height: 10.h,
//                         ),
//                         GenericTextField(
//                           controller: budgetNameController,
//                           hint: "pleas enter value",
//                           fieldTypes: FieldTypes.normal,
//                           type: TextInputType.number,
//                           action: TextInputAction.next,
//                           validate: (text) {
//                             if (text == null || text.isEmpty) {
//                               return "رجاء إدخال قيمة الميزانية";
//                             }
//                             return null;
//                           },
//                           onChange: (value) {
//                             parsedNumber =
//                                 double.parse(budgetNameController.text);
//                           },
//                         ),
//                         SizedBox(
//                           height: 15.h,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             MyText(
//                                 title: "اختيار محفظة",
//                                 color: MyColors.black,
//                                 size: 14.sp),
//                             SizedBox(
//                               width: 150.w,
//                               child: BlocBuilder<BudgetCubit, BudgetState>(
//                                 builder: (context, state) {
//                                   List<String> walletNames = context
//                                       .read<BudgetCubit>()
//                                       .wallets
//                                       .map((wallet) => wallet.name)
//                                       .toList();


//                                                 List<String> walletsName = context
//               .read<BudgetCubit>()
//               .budgetList
//               .map((wallet) => wallet.name)
//               .toList();

//                                   return TileDropdownButton(
//                                     menuList: walletNames,
//                                     onChanged: (value) => {
//                                       walletNameController.text =
//                                           value as String,
//                                     },
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 15.h),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             MyText(
//                                 title: "اختيار المعاملة",
//                                 color: MyColors.black,
//                                 size: 14.sp),
//                             SizedBox(
//                               width: 150.w,
//                               child: BlocBuilder<BudgetCubit, BudgetState>(
//                                 builder: (context, state) {
//                                   List<String> transactionName = context
//                                       .read<BudgetCubit>()
//                                       .transactioList
//                                       .map((transaction) =>
//                                           transaction.transactionName!)
//                                       .toList();
//                                   return TileDropdownButton(
//                                     menuList: transactionName,
//                                     onChanged: (value) => {
//                                       transactionController.text =
//                                           value as String,
//                                     },
//                                   );
//                                 },
//                               ),
//                             ),
//                           ],
//                         ),
//                     ),
//                   ),
//                 ),
//             );
//         )
//   }
//           }
