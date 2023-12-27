import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/budget/budget_imports.dart';
import 'package:expenses/user/screens/budget/data/cubit/budget_cubit.dart';
import 'package:expenses/user/screens/budget/data/cubit/budget_state.dart';
import 'package:expenses/user/screens/budget/data/model/budget_model.dart';
import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTransactionBudget extends StatefulWidget {
  const AddTransactionBudget({super.key});

  @override
  State<AddTransactionBudget> createState() => _AddTransactionBudgetState();
}

class _AddTransactionBudgetState extends State<AddTransactionBudget> {
  bool repeatSwitchValue = false;
  bool notificationSwitchvalu = false;
  DateTimeRange selectRangeDate =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  TextEditingController rangeDateController = TextEditingController();
  TextEditingController walletNameController = TextEditingController();
  TextEditingController transactionController = TextEditingController();
  TextEditingController budgetNameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  double parsedNumber = 0;
  BudgetData data = BudgetData();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => BudgetCubit()..getBudgetData(context),
        child: BlocBuilder<BudgetCubit, BudgetState>(
            buildWhen: (previos, current) {
          return (previos is AddBudgetLoading || current is AddBudgetLoading) ||
              (current is OpenBudget || current is OpenBudget);
        }, builder: (context, state) {
          if (state is AddBudgetLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is OpenBudget) {
            return Column(
              children: [
                Container(
                  height: 110.h,
                  width: double.infinity,
                  color: MyColors.primary,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => AutoRouter.of(context).pop(),
                          icon: const Icon(Icons.arrow_back_ios),
                          color: MyColors.white,
                        ),
                        SizedBox(width: 15.w),
                        MyText(
                          title: tr(context, 'add'),
                          color: Colors.white,
                          size: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15.h),
                        MyText(
                            title: "قيمة الميزانية",
                            color: MyColors.black,
                            size: 16.sp),
                        SizedBox(
                          height: 10.h,
                        ),
                        GenericTextField(
                          controller: budgetNameController,
                          hint: "pleas enter value",
                          fieldTypes: FieldTypes.normal,
                          type: TextInputType.number,
                          action: TextInputAction.next,
                          validate: (text) {
                            if (text == null || text.isEmpty) {
                              return "رجاء إدخال قيمة الميزانية";
                            }
                            return null;
                          },
                          onChange: (value) {
                            parsedNumber =
                                double.parse(budgetNameController.text);
                          },
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                                title: "اختيار محفظة",
                                color: MyColors.black,
                                size: 14.sp),
                            SizedBox(
                              width: 150.w,
                              child: BlocBuilder<BudgetCubit, BudgetState>(
                                builder: (context, state) {
                                  List<String> walletNames = context
                                      .read<BudgetCubit>()
                                      .wallets
                                      .map((wallet) => wallet.name)
                                      .toList();

                                  return TileDropdownButton(
                                    menuList: walletNames,
                                    onChanged: (value) => {
                                      walletNameController.text =
                                          value as String,
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                                title: "اختيار المعاملة",
                                color: MyColors.black,
                                size: 14.sp),
                            SizedBox(
                              width: 150.w,
                              child: BlocBuilder<BudgetCubit, BudgetState>(
                                builder: (context, state) {
                                  List<String> transactionName = context
                                      .read<BudgetCubit>()
                                      .transactioList
                                      .map((transaction) =>
                                          transaction.transactionName!)
                                      .toList();
                                  return TileDropdownButton(
                                    menuList: transactionName,
                                    onChanged: (value) => {
                                      transactionController.text =
                                          value as String,
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyText(
                                title: "اختيار المدة",
                                color: MyColors.black,
                                size: 14.sp),
                            IconButton(
                                onPressed: () {
                                  dateRange();
                                },
                                icon: const Icon(Icons.calendar_month_outlined))
                          ],
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MyText(
                                  title: "تكرار المحفظة",
                                  color: MyColors.black,
                                  size: 14.sp),
                            ),
                            Visibility(
                              visible: repeatSwitchValue,
                              child: SizedBox(
                                width: 150.w,
                                child: TileDropdownButton(
                                    menuList: data.repeatTransaction,
                                    value: data.repeatTransaction.first,
                                    onChanged: (value) {}),
                              ),
                            ),
                            CupertinoSwitch(
                              value: repeatSwitchValue,
                              onChanged: (value) {
                                setState(() {
                                  repeatSwitchValue = value;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MyText(
                                  title: "تنبيه انتهاء المعالمة",
                                  color: MyColors.black,
                                  size: 14.sp),
                            ),
                            Visibility(
                              visible: notificationSwitchvalu,
                              child: SizedBox(
                                width: 150.w,
                                child: Container(),
                              ),
                            ),
                            CupertinoSwitch(
                              value: notificationSwitchvalu,
                              onChanged: (value) {
                                setState(() {
                                  notificationSwitchvalu = value;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        DefaultButton(
                          fontSize: 14.sp,
                          borderColor: MyColors.primary,
                          title: "إضافة ميزانية",
                          color: MyColors.primary,
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              // List<String?> transactionValue = context
                              //     .read<BudgetCubit>()
                              //     .transactioList
                              //     .map((value) => value.total)
                              //     .toList();

                              // List<double> parsedValues = context
                              //     .read<BudgetCubit>()
                              //     .transactioList
                              //     .map((value) =>
                              //         double.tryParse(value.total ?? '0.0') ??
                              //         0.0)
                              //     .toList();
                              // List<double> dividedValues = parsedValues.map((value) => value / 100.0).toList();
                              // List<double> parsedValues = transactionValue
                              //     .where((value) =>
                              //         value != null) // Filter out null values
                              //     .map((value) => double.parse(
                              //         value!)) // Convert String to double
                              //     .toList();

                              // var result= parsedNumber/parsedValues
                              double transactionValue = context
                                  .read<BudgetCubit>()
                                  .transactioList
                                  .map((value) =>
                                      double.tryParse(value.total ?? '0.0') ??
                                      0.0)
                                  .fold(
                                      0.0,
                                      ((previousValue, current) =>
                                          previousValue + current));
                              double deficiency =
                                  parsedNumber - transactionValue;
                              double percentageValue =
                                  deficiency / parsedNumber;

                              var budgetModel = BudgetModel(
                                  percentValue: percentageValue,
                                  selectTransaction: transactionController.text,
                                  selectWallet: walletNameController.text,
                                  budgetPeriod: rangeDateController.text,
                                  value: parsedNumber);
                              await context
                                  .read<BudgetCubit>()
                                  .addData(budgetModel);
                              if (context.mounted) {
                                AutoRouter.of(context).pop();
                              }
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return const SizedBox();
        }));
  }

  void dateRange() async {
    DateTimeRange? dateRange = await showDateRangePicker(
      context: context,
      firstDate: context.read<BudgetCubit>().startDate,
      lastDate: context.read<BudgetCubit>().endDate,
    );

    if (dateRange != null) {
      setState(() {
        selectRangeDate = dateRange;
        rangeDateController.text =
            "${dateRange.start.day}/${dateRange.start.month}/${dateRange.start.year} - ${dateRange.end.day}/${dateRange.end.month}/${dateRange.end.year}";
      });
    }
  }
}
