import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/themes/app_colors.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_content_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart';
import 'package:expenses/user/screens/budget/data/cubit/budget_cubit.dart';
import 'package:expenses/user/screens/budget/data/cubit/budget_state.dart';
import 'package:expenses/user/screens/budget/data/model/budget_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EditBudget extends StatefulWidget {
  final BudgetModel model;
  const EditBudget({super.key, required this.model});

  @override
  State<EditBudget> createState() => _EditBudgetState();
}

class _EditBudgetState extends State<EditBudget> {
  ExpansionTileController transactionController = ExpansionTileController();
  ExpansionTileController walletController = ExpansionTileController();
  TextEditingController transactionValueController = TextEditingController();
  TextEditingController walletNameController = TextEditingController();
  TextEditingController closeDateController = TextEditingController();
  TextEditingController openDateController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController budgetValueController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  double parsedNumber = 0;
  bool favorite = false;
  bool notificationSwitchvalu = false;
  String? selectTransactionValue;
  String? selectWalletValue;
  DateTime? selectedDate;
  DateTime? closedDate;
  String? formattedDate;
  bool isExpanded = true;

  @override
  void initState() {
    budgetValueController.text = widget.model.budgetValue.toString();
    transactionValueController.text = widget.model.transactionName;
    walletNameController.text = widget.model.waletName;
    noteController.text = widget.model.addNote;
    openDateController.text = widget.model.startBudget;
    print(
        "${openDateController.text}vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
    closeDateController.text = widget.model.endBudget;
    favorite = widget.model.favoitate!;
    super.initState();
  }

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
          List<TransactionTypeModel> transaction = context
              .read<BudgetCubit>()
              .transactionShopping
              .map((transaction) => transaction)
              .toList();
          List<TransactionContentModel> firstContent = [];
          for (var element in transaction) {
            firstContent.addAll(element.content!);
          }
          List<String> firstTransaction = firstContent
              .map((transaction) => transaction.name ?? "")
              .toList();
          List<String> firstIconsList = firstContent
              .map((transaction) => transaction.image ?? "")
              .toList();
          List<TransactionTypeModel> secTransaction = context
              .read<BudgetCubit>()
              .commitmentsList
              .map((e) => e)
              .toList();
          List<TransactionContentModel> secContent = [];
          for (var element in secTransaction) {
            secContent.addAll(element.content!);
          }
          List<String> secIconContent =
              secContent.map((transaction) => transaction.image ?? "").toList();
          List<String> secTrans =
              secContent.map((transaction) => transaction.name ?? "").toList();
          List<TransactionTypeModel> fourthTransaction = context
              .read<BudgetCubit>()
              .transactionTargetBBox
              .map((e) => e)
              .toList();
          List<TransactionContentModel> fourthContent = [];
          for (var element in fourthTransaction) {
            fourthContent.addAll(element.content!);
          }
          List<String> thirdIconsContent = fourthContent
              .map((transaction) => transaction.image ?? "")
              .toList();
          List<String> fourthTrans = fourthContent
              .map((transaction) => transaction.name ?? "")
              .toList();

          List<TransactionTypeModel> fifthTransaction = context
              .read<BudgetCubit>()
              .cashTransactionBox
              .map((e) => e)
              .toList();

          List<TransactionContentModel> fifthContent = [];
          for (var element in fifthTransaction) {
            fifthContent.addAll(element.content!);
          }
          List<String> fifthIconContent = fifthContent
              .map((transaction) => transaction.image ?? "")
              .toList();
          List<String> fifthTrans = fifthContent
              .map((transaction) => transaction.name ?? "")
              .toList();

          List<String> allTransaction = [
            ...firstTransaction,
            ...secTrans,
            ...fourthTrans,
            ...fifthTrans
          ];

          List<String> allTransactionsIcons = [
            ...firstIconsList,
            ...secIconContent,
            ...thirdIconsContent,
            ...fifthIconContent
          ];

          return Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.transparent,
              leading: GestureDetector(
                onTap: () => AutoRouter.of(context).pop(),
                child: Icon(
                  Icons.arrow_back,
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : MyColors.black,
                ),
              ),
              backgroundColor: context.watch<AppThemeCubit>().isDarkMode
                  ? AppDarkColors.backgroundColor
                  : MyColors.white,
              title: Center(
                child: MyText(
                  title: tr(context, "editBudget"),
                  color: context.watch<AppThemeCubit>().isDarkMode
                      ? MyColors.white
                      : AppDarkColors.backgroundColor,
                  size: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
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
                          onExpansionChanged: (value) {
                            setState(() {
                              isExpanded = isExpanded;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: isExpanded
                                    ? MyColors.primary
                                    : Colors.transparent),
                          ),
                          controller: transactionController,
                          title: Text(transactionValueController.text.isNotEmpty
                              ? tr(context, transactionValueController.text)
                                      .isNotEmpty
                                  ? tr(context, transactionValueController.text)
                                  : transactionValueController.text
                              : tr(context, "selectTransaction")),
                          children: [
                            ...allTransaction.asMap().entries.map(
                              (entry) {
                                final String item = entry.value;
                                final int index = entry.key;

                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectTransactionValue = item;
                                          transactionValueController.text =
                                              item;
                                          transactionController.collapse();
                                        });
                                      },
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 16.0.r),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (index <
                                                allTransactionsIcons.length)
                                              Image.asset(
                                                allTransactionsIcons[index],
                                                height: 50.h,
                                                width: 50.w,
                                              ),
                                            Text(
                                              tr(context, item),
                                            ),
                                            Radio<String>(
                                              activeColor: MyColors.primary,
                                              value: item,
                                              groupValue:
                                                  selectTransactionValue,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectTransactionValue =
                                                      value;
                                                  // context
                                                  //     .read<BudgetCubit>()
                                                  //     .transactionNameController
                                                  transactionValueController
                                                      .text = value.toString();
                                                  transactionController
                                                      .collapse();
                                                });
                                              },
                                            ),
                                          ],
                                        ),
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
                          onExpansionChanged: (value) {
                            setState(() {
                              isExpanded = isExpanded;
                            });
                          },
                          controller: walletController,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: isExpanded
                                    ? MyColors.primary
                                    : Colors.transparent),
                          ),
                          title: Text(walletNameController.text.isNotEmpty
                              ? tr(context, walletNameController.text)
                                      .isNotEmpty
                                  ? tr(context, walletNameController.text)
                                  : walletNameController.text
                              : tr(context, "selectTheWallet")),
                          children: [
                            ...walletsName.asMap().entries.map(
                              (entry) {
                                final String item = entry.value;
                                return Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectWalletValue = item;
                                          walletNameController.text = item;
                                          walletController.collapse();
                                        });
                                      },
                                      child: ListTile(
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
                                              value: item,
                                              groupValue: selectWalletValue,
                                              activeColor: MyColors.primary,
                                              onChanged: (value) {
                                                setState(() {
                                                  selectWalletValue = value;
                                                  // context
                                                  //     .read<BudgetCubit>()
                                                  //     .walletNameController
                                                  walletNameController.text =
                                                      value.toString();
                                                  walletController.collapse();
                                                });
                                              },
                                            ),
                                          ],
                                        ),
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
                      Column(
                        children: [
                          Row(
                            children: [
                              MyText(
                                title: tr(context, "selectDuration"),
                                color: context.watch<AppThemeCubit>().isDarkMode
                                    ? MyColors.white
                                    : AppDarkColors.backgroundColor,
                                size: 16.sp,
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.r),
                            decoration: BoxDecoration(
                              color: context.watch<AppThemeCubit>().isDarkMode
                                  ? AppDarkColors.backgroundColor
                                  : MyColors.white,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Form(
                              key: context.read<BudgetCubit>().formKey,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: GenericTextField(
                                      onTab: () => openDate(context),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20.r, vertical: 10.r),
                                      radius: 10.r,
                                      fieldTypes: FieldTypes.clickable,
                                      type: TextInputType.text,
                                      action: TextInputAction.next,
                                      hintColor: context
                                              .watch<AppThemeCubit>()
                                              .isDarkMode
                                          ? MyColors.white
                                          : MyColors.black,
                                      textColor: context
                                              .watch<AppThemeCubit>()
                                              .isDarkMode
                                          ? MyColors.white
                                          : MyColors.black,
                                      label: selectedDate != null
                                          ? "${selectedDate?.toLocal()}"
                                              .split(' ')[0]
                                          : tr(context, "from"),
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter open budget date';
                                        }
                                      },
                                      controller: openDateController,
                                      // context
                                      //     .read<WalletCubit>()
                                      //     .openDateController,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Expanded(
                                    child: GenericTextField(
                                      onTab: () {
                                        closeDate(context);
                                      },
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10),
                                      radius: 10.r,
                                      fieldTypes: FieldTypes.clickable,
                                      type: TextInputType.text,
                                      action: TextInputAction.next,
                                      hintColor: context
                                              .watch<AppThemeCubit>()
                                              .isDarkMode
                                          ? MyColors.white
                                          : MyColors.black,
                                      textColor: context
                                              .watch<AppThemeCubit>()
                                              .isDarkMode
                                          ? MyColors.white
                                          : MyColors.black,
                                      label: closedDate != null
                                          ? "${closedDate?.toLocal()}"
                                              .split(' ')[0]
                                          : tr(
                                              context,
                                              "to",
                                            ),
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter close budget date';
                                        }
                                      },
                                      controller: closeDateController,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GenericTextField(
                        controller: budgetValueController,
                        // context.read<BudgetCubit>().budgetValueController,
                        hint: tr(context, "selectValueType"),
                        fieldTypes: FieldTypes.normal,
                        hintColor: context.watch<AppThemeCubit>().isDarkMode
                            ? MyColors.white
                            : AppDarkColors.backgroundColor,
                        type: TextInputType.number,
                        textColor: context.watch<AppThemeCubit>().isDarkMode
                            ? MyColors.white
                            : MyColors.black,
                        action: TextInputAction.next,
                        validate: (text) {
                          if (text == null || text.isEmpty) {
                            return tr(context, "pleaseEntervalue");
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Text(
                            tr(context, "addNote"),
                            style: TextStyle(
                              color: context.watch<AppThemeCubit>().isDarkMode
                                  ? MyColors.white
                                  : AppDarkColors.backgroundColor,
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
                              controller: noteController,
                              // context.read<BudgetCubit>().noteController,
                              hint: tr(context, "youNotes"),
                              maxLength: 9,
                              fieldTypes: FieldTypes.normal,
                              textColor:
                                  context.watch<AppThemeCubit>().isDarkMode
                                      ? MyColors.white
                                      : MyColors.black,
                              hintColor:
                                  context.watch<AppThemeCubit>().isDarkMode
                                      ? MyColors.white
                                      : AppDarkColors.backgroundColor,
                              type: TextInputType.text,
                              action: TextInputAction.next,
                              validate: (text) {
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
                            width: 328.w,
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
                                    color: context
                                            .watch<AppThemeCubit>()
                                            .isDarkMode
                                        ? MyColors.white
                                        : MyColors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 120.w,
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
                            // color: MyColors.black,
                            ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MyText(
                                title: tr(context, "favorite"),
                                color: context.watch<AppThemeCubit>().isDarkMode
                                    ? MyColors.white
                                    : MyColors.black,
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
                              if (formKey.currentState!.validate() &&
                                  context
                                      .read<BudgetCubit>()
                                      .formKey
                                      .currentState!
                                      .validate()) {
                                double transactionValue = 0;
                                print(
                                    "Debugging bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbudgetValue: $double.parse(budgetValueController.text)");

                                // if double.parse(budgetValueController.text.replaceAll(',', '')) == null) {
                                //   return CustomToast.showSimpleToast(
                                //     msg: tr(context, "invalidBudgetValue"),
                                //   );
                                // }
                                double deficiency = double.parse(
                                        budgetValueController.text
                                            .replaceAll(',', '')) -
                                    transactionValue;
                                if (deficiency < 0) {
                                  return CustomToast.showSimpleToast(
                                      msg:
                                          "رصيد الميزانية اقل من رصيد المعاملات");
                                }
                                double percentageValue = deficiency /
                                    double.parse(budgetValueController.text
                                        .replaceAll(',', ''));

                                widget.model.addNote = noteController.text;
                                widget.model.budgetValue = double.parse(
                                    budgetValueController.text
                                        .replaceAll(',', ''));
                                widget.model.endBudget =
                                    closeDateController.text;
                                widget.model.transactionName =
                                    transactionValueController.text;
                                widget.model.favoitate = favorite;
                                widget.model.waletName =
                                    walletNameController.text;
                                widget.model.startBudget =
                                    openDateController.text;
                                widget.model.transactionValue =
                                    transactionValue;
                                widget.model.percentValue = percentageValue;
                                widget.model.save();
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

        openDateController.text =
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
        closeDateController.text = formattedDate.toString();
      });
    }
  }

  @override
  void dispose() {
    transactionValueController.clear();
    walletNameController.clear();
    openDateController.clear();
    closeDateController.clear();
    noteController.clear();
    super.dispose();
  }
}
