import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/budget/data/cubit/budget_cubit.dart';
import 'package:expenses/user/screens/budget/data/cubit/budget_state.dart';
import 'package:expenses/user/screens/budget/data/model/budget_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AddTransactionBudget extends StatefulWidget {
  const AddTransactionBudget({super.key});

  @override
  State<AddTransactionBudget> createState() => _AddTransactionBudgetState();
}

class _AddTransactionBudgetState extends State<AddTransactionBudget> {
  bool favorite = false;
  bool notificationSwitchvalu = false;

  var formKey = GlobalKey<FormState>();
  double parsedNumber = 0;
  // BudgetData data = BudgetData();
  String? selectTransactionValue;
  String? selectWalletValue;
  DateTime? selectedDate;
  DateTime? closedDate;
  String? formattedDate;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BudgetCubit()..getBudgetData(context),
      child:
          BlocBuilder<BudgetCubit, BudgetState>(buildWhen: (previos, current) {
        return (previos is AddBudgetLoading || current is AddBudgetLoading) ||
            (current is OpenBudget || current is OpenBudget);
      }, builder: (context, state) {
        if (state is AddBudgetLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is OpenBudget) {
          List<String> walletsName = context
              .read<BudgetCubit>()
              .wallets
              .map((wallet) => wallet.name)
              .toList();
          List<String> transactionName = context
              .read<BudgetCubit>()
              .transactioList
              .map((transaction) => transaction.transactionType?.name ?? "")
              .toList();

          return Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              leading: IconButton(
                icon: Image.asset(Res.back),
                onPressed: () => AutoRouter.of(context).pop(),
              ),
              backgroundColor: MyColors.white,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Res.budgetIcon, height: 28.h, width: 32.w),
                  SizedBox(width: 8.w),
                  MyText(
                    title: tr(context, "addBudget"),
                    color: MyColors.black,
                    size: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.r),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColors.greyWhite),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ExpansionTile(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent),
                          ),
                          title: Text(tr(context, "selectTransaction")),
                          children: [
                            ...transactionName.asMap().entries.map(
                              (entry) {
                                final String item = entry.value;
                                return Column(
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16.0.r),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item,
                                          ),
                                          Radio<String>(
                                            activeColor: MyColors.primary,
                                            value: item,
                                            groupValue: selectTransactionValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectTransactionValue = value;
                                                context
                                                    .read<BudgetCubit>()
                                                    .walletNameController
                                                    .text = value.toString();
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 1,
                                      thickness: 2,
                                      color: MyColors.semiTransparentColor,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: MyColors.greyWhite),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ExpansionTile(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent),
                          ),
                          title: Text(tr(context, "selectTheWallet")),
                          children: [
                            ...walletsName.asMap().entries.map(
                              (entry) {
                                final String item = entry.value;
                                return Column(
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16.0.r),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item,
                                          ),
                                          Radio<String>(
                                            activeColor: MyColors.primary,
                                            value: item,
                                            groupValue: selectWalletValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectWalletValue = value;
                                                context
                                                    .read<BudgetCubit>()
                                                    .walletNameController
                                                    .text = value.toString();
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(
                                      height: 1,
                                      thickness: 2,
                                      color: MyColors.semiTransparentColor,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        children: [
                          Column(
                            children: [
                              Image.asset(Res.calendar),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                tr(context, "selectDuration"),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              openDate(context);
                            },
                            child: Container(
                                height: 44.h,
                                width: 130.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                      color: MyColors.semiTransparentColor),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(12.r),
                                    child: Row(
                                      children: [
                                        Text(
                                          selectedDate != null
                                              ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                              : tr(context, "from"),
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            color: selectedDate != null
                                                ? Colors.black
                                                : Colors.grey,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 30.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              closeDate(context);
                            },
                            child: Container(
                                height: 44.h,
                                width: 130.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  border: Border.all(
                                      color: MyColors.semiTransparentColor),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(12.r),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Text(
                                            closedDate != null
                                                ? formattedDate!.split(' ')[0]
                                                : tr(context, "to"),
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: closedDate != null
                                                  ? Colors.black
                                                  : Colors.grey,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GenericTextField(
                        controller:
                            context.read<BudgetCubit>().budgetValueController,
                        hint: tr(context, "selectValueType"),
                        fieldTypes: FieldTypes.normal,
                        type: TextInputType.number,
                        action: TextInputAction.next,
                        validate: (text) {
                          if (text == null || text.isEmpty) {
                            return tr(context, "pleaseEntervalue");
                          }
                          return null;
                        },
                        onChange: (value) {
                          parsedNumber = double.parse(context
                              .read<BudgetCubit>()
                              .budgetValueController
                              .text);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                              title: tr(context, "transactionRepetition"),
                              color: MyColors.black,
                              size: 16.sp),
                          Checkbox(
                              activeColor: MyColors.primary,
                              value: context.read<BudgetCubit>().checkedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  context.read<BudgetCubit>().checkedValue =
                                      newValue!;
                                });
                              })
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text(
                            tr(context, "addNote"),
                            style: TextStyle(
                              color: MyColors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          SizedBox(
                            width: 284.w,
                            child: GenericTextField(
                              controller:
                                  context.read<BudgetCubit>().noteController,
                              hint: tr(context, "yourNotes"),
                              maxLength: 9,
                              fieldTypes: FieldTypes.normal,
                              type: TextInputType.text,
                              action: TextInputAction.next,
                              validate: (text) {
                                if (text == null || text.isEmpty) {
                                  return tr(context, "PleaseInputYourNote");
                                }
                                return null;
                              },
                              onChange: (value) {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.r),
                            height: 58.h,
                            width: 320.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyColors.greyWhite,
                                ),
                                borderRadius: BorderRadius.circular(12.r)),
                            child: Row(
                              children: [
                                Text(
                                  tr(context, "addImage"),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: MyColors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 100.w,
                                ),
                                Image.asset(Res.camera),
                                SizedBox(
                                  width: 7.w,
                                ),
                                VerticalDivider(
                                  width: 45.h,
                                  color: MyColors.grey,
                                ),
                                Image.asset(Res.image),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Container(
                            height: 57.h,
                            width: 57.w,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyColors.greyWhite,
                                ),
                                borderRadius: BorderRadius.circular(12.r)),
                            child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(Res.qrcode)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 58.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xffF7F7F6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MyText(
                                title: tr(context, "notificationWhenReaching"),
                                color: MyColors.black,
                                size: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
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
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 58.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Color(0xffF7F7F6),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MyText(
                                title: tr(context, "favorite"),
                                color: MyColors.black,
                                size: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Visibility(
                              visible: favorite,
                              child: SizedBox(
                                width: 150.w,
                                child: Container(),
                              ),
                            ),
                            CupertinoSwitch(
                              value: favorite,
                              onChanged: (value) {
                                setState(() {
                                  favorite = value;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Row(
                        children: [
                          DefaultButton(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
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
                                if (deficiency < 0) {
                                  return CustomToast.showSimpleToast(
                                      msg:
                                          "رصيد الميزانية اقل من رصيد المعاملات");
                                }
                                double percentageValue =
                                    deficiency / parsedNumber;
                                var budgetData = BudgetModel(
                                    percentValue: percentageValue,
                                    budgetValue: parsedNumber,
                                    transactionName: context
                                        .read<BudgetCubit>()
                                        .transactionNameController
                                        .text,
                                    waletName: context
                                        .read<BudgetCubit>()
                                        .walletNameController
                                        .text,
                                    startBudget: context
                                        .read<BudgetCubit>()
                                        .openDateController
                                        .text,
                                    endBudget: context
                                        .read<BudgetCubit>()
                                        .closeDateController
                                        .text,
                                    addNote: context
                                        .read<BudgetCubit>()
                                        .noteController
                                        .text,
                                    transactionValue: transactionValue);
                                context.read<BudgetCubit>().addData(budgetData);
                                AutoRouter.of(context).pop();
                              }
                            },
                            height: 57.h,
                            width: 170.w,
                            title: tr(context, "add"),
                            color: MyColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          DefaultButton(
                            onTap: () {
                              AutoRouter.of(context).pop();
                            },
                            height: 57.h,
                            width: 170.w,
                            borderColor: MyColors.primary,
                            title: tr(context, "cancel"),
                            textColor: MyColors.primary,
                            color: MyColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      }),
    );
  }

  Future<void> openDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;

        context.read<BudgetCubit>().openDateController.text =
            DateFormat('dd-MM-yyyy').format(selectedDate!);
      });
    }
  }

  Future<void> closeDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: closedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != closedDate) {
      setState(() {
        closedDate = picked;
        formattedDate = DateFormat('dd-MM-yyyy').format(closedDate!);
        context.read<BudgetCubit>().closeDateController.text =
            formattedDate.toString();
      });
    }
  }
}
