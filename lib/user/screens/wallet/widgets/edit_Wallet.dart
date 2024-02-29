import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/themes/app_colors.dart';
import 'package:expenses/general/themes/cubit/app_theme_cubit.dart';
import 'package:expenses/general/utilities/utils_functions/decimal_format.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_state.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditWallet extends StatefulWidget {
  final WalletModel model;
  const EditWallet({super.key, required this.model});

  @override
  State<EditWallet> createState() => _EditWalletState();
}

class _EditWalletState extends State<EditWallet> {
  ExpansionTileController controller = ExpansionTileController();
  ExpansionTileController valueTypeController = ExpansionTileController();
  ExpansionTileController currencyController = ExpansionTileController();

  WalletData data = WalletData();
  var formKey = GlobalKey<FormState>();
  DateTime? selectedDate;
  DateTime? closedDate;
  bool repeatSwitchValue = true;
  double parsedNumber = 0;
  String? selectedValue;
  String? secValue;
  String? selectMainCurrency;
  bool isRepated = false;
  bool isFirstValidationError = false;
  bool isSecondValidationError = false;
  bool notificationSwitchvalu = false;
  TextEditingController ballanceController = TextEditingController();
  TextEditingController encomSourceController = TextEditingController();
  TextEditingController walletNameController = TextEditingController();
  TextEditingController valueCategoryController = TextEditingController();
  TextEditingController currency = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController closeDateController = TextEditingController();
  TextEditingController openDateController = TextEditingController();
  TextEditingController repatedWalletController = TextEditingController();

  @override
  void initState() {
    ballanceController.text =
        widget.model.balance.toString().formatToDecimal(context: context);

    encomSourceController.text = widget.model.encomeSource;
    walletNameController.text = widget.model.name;
    valueCategoryController.text = widget.model.valueCategory;
    currency.text = widget.model.currency;
    noteController.text = widget.model.addNote;
    repatedWalletController.text = widget.model.repeatWallet!;
    print(widget.model.repeatWallet! + """""" """""" """""" """""" "");
    isRepated = widget.model.walletRepate!;
    print(widget.model.walletRepate);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCubit()..getCurrencyData(context),
      child:
          BlocBuilder<WalletCubit, WalletState>(buildWhen: (previous, current) {
        return (previous is WalletLoading || current is WalletLoading) ||
            (current is CurrencyWallet || current is CurrencyWallet);
      }, builder: (context, state) {
        if (state is AddWalletLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CurrencyWallet) {
          String mainCurrency = context
              .read<WalletCubit>()
              .currencyData
              .map((currencyData) => currencyData.mainCurrency)
              .first
              .toString();
          String subCurrency = context
              .read<WalletCubit>()
              .currencyData
              .map((currencyData) => currencyData.subCurrency)
              .first
              .toString();
          double currencyValue = double.parse(
            context
                .read<WalletCubit>()
                .currencyData
                .map((currencyData) => currencyData.value)
                .first
                .toString(),
          );

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
              centerTitle: true,
              title: MyText(
                title: tr(context, "editWallet"),
                color: context.watch<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    : AppDarkColors.backgroundColor,
                size: 16.sp,
                fontWeight: FontWeight.bold,
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
                          controller: controller,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent),
                          ),
                          title: Text(
                            // context
                            //             .read<WalletCubit>()
                            //             .encomSourceController
                            //             .text !=
                            encomSourceController.text != ""
                                ? tr(context, encomSourceController.text)
                                        .isNotEmpty
                                    ? tr(context, encomSourceController.text
                                        // context
                                        //     .read<WalletCubit>()
                                        //     .encomSourceController
                                        //     .text
                                        )
                                    :
                                    //  context
                                    //     .read<WalletCubit>()
                                    //     .encomSourceController
                                    //     .text
                                    encomSourceController.text
                                : tr(context, "selectValueType"),
                            style: TextStyle(
                                fontSize: 16.h, fontWeight: FontWeight.w500),
                          ),
                          children: [
                            ...context
                                .read<WalletCubit>()
                                .encomeSource
                                .asMap()
                                .entries
                                .map(
                              (entry) {
                                final int index = entry.key;
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
                                          Text(tr(context, item).isNotEmpty
                                              ? tr(context, item)
                                              : item),
                                          Radio<String>(
                                            activeColor: MyColors.primary,
                                            value: item,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              setState(() {
                                                selectedValue = value;
                                                // context
                                                //     .read<WalletCubit>()
                                                //     .encomSourceController
                                                //     .text
                                                encomSourceController.text =
                                                    value.toString();
                                                isFirstValidationError = false;
                                                controller.collapse();
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (index <
                                        context
                                                .read<WalletCubit>()
                                                .valueCategory
                                                .length -
                                            1)
                                      Divider(
                                        height: 1,
                                        thickness: 2,
                                        color: MyColors.semiTransparentColor,
                                      ),
                                  ],
                                );
                              },
                            ),
                            DefaultButton(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              title: tr(context, "addOther"),
                              onTap: () {
                                context.read<WalletCubit>().addEncomeSource(
                                    context,
                                    build,
                                    context
                                        .read<WalletCubit>()
                                        .encomSourceController);
                              },
                              height: 49.h,
                              width: 374.w,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GenericTextField(
                        textColor: context.watch<AppThemeCubit>().isDarkMode
                            ? MyColors.white
                            : MyColors.black,
                        controller: walletNameController,
                        // context.read<WalletCubit>().walletNameController,
                        hint: tr(context, "walletName"),
                        hintColor: context.watch<AppThemeCubit>().isDarkMode
                            ? MyColors.white
                            : AppDarkColors.backgroundColor,
                        fieldTypes: FieldTypes.normal,
                        type: TextInputType.text,
                        action: TextInputAction.next,
                        validate: (text) {
                          if (text == null || text.isEmpty) {
                            return tr(context, "pleaseEnterWalletName");
                          }
                          return null;
                        },
                        onChange: (value) {
                          walletNameController.text;
                          // context.read<WalletCubit>().walletNameController.text;
                        },
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
                          controller: valueTypeController,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.transparent),
                          ),
                          title: Text(
                            // context
                            //             .read<WalletCubit>()
                            //             .valueCategoryController
                            //             .text !=
                            valueCategoryController.text != ""
                                ? tr(context, valueCategoryController.text
                                            // context
                                            //     .read<WalletCubit>()
                                            //     .valueCategoryController
                                            //     .text
                                            )
                                        .isNotEmpty
                                    ? tr(context, valueCategoryController.text
                                        // context
                                        //     .read<WalletCubit>()
                                        //     .valueCategoryController
                                        //     .text
                                        )
                                    :
                                    // context
                                    //     .read<WalletCubit>()
                                    //     .valueCategoryController
                                    //     .text
                                    valueCategoryController.text
                                : tr(context, "selectValueType"),
                            style: TextStyle(
                                fontSize: 16.h, fontWeight: FontWeight.w500),
                          ),
                          children: [
                            ...context
                                .read<WalletCubit>()
                                .valueCategory
                                .asMap()
                                .entries
                                .map(
                              (entry) {
                                final int index = entry.key;
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
                                          Text(tr(context, item).isNotEmpty
                                              ? tr(context, item)
                                              : item),
                                          Radio<String>(
                                            activeColor: MyColors.primary,
                                            value: item,
                                            groupValue: secValue,
                                            onChanged: (value) {
                                              setState(() {
                                                secValue = value;
                                                valueCategoryController.text
                                                    // context
                                                    //     .read<WalletCubit>()
                                                    //     .valueCategoryController
                                                    //     .text
                                                    = value.toString();
                                                isSecondValidationError = false;
                                                valueTypeController.collapse();
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (index <
                                        context
                                                .read<WalletCubit>()
                                                .valueCategory
                                                .length -
                                            1)
                                      Divider(
                                        height: 1,
                                        thickness: 2,
                                        color: MyColors.semiTransparentColor,
                                      ),
                                  ],
                                );
                              },
                            ),
                            DefaultButton(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              title: tr(context, "addOther"),
                              onTap: () {
                                context.read<WalletCubit>().addValue(
                                    context,
                                    build,
                                    context
                                        .read<WalletCubit>()
                                        .valueCategoryController);
                              },
                              height: 49.h,
                              width: 374.w,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 319.w,
                            child: GenericTextField(
                              textColor:
                                  context.watch<AppThemeCubit>().isDarkMode
                                      ? MyColors.white
                                      : MyColors.black,
                              enableBorderColor: MyColors.semiTransparentColor,
                              controller: ballanceController,
                              // context.read<WalletCubit>().balanceController,
                              hint: tr(context, "amount"),
                              hintColor:
                                  context.watch<AppThemeCubit>().isDarkMode
                                      ? MyColors.white
                                      : AppDarkColors.backgroundColor,
                              fieldTypes: FieldTypes.normal,
                              type: TextInputType.number,
                              action: TextInputAction.next,
                              validate: (text) {
                                if (text == null || text.isEmpty) {
                                  return tr(context, "pleaseEnterValueSource");
                                }
                                return null;
                              },
                              onChange: (value) {
                                parsedNumber = double.parse(context
                                    .read<WalletCubit>()
                                    .balanceController
                                    .text);
                              },
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
                            width: 398.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: MyColors.greyWhite,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ExpansionTile(
                              controller: currencyController,
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.transparent),
                              ),
                              title: Text(
                                  // context
                                  //       .read<WalletCubit>()
                                  //       .currencyController
                                  //       .text
                                  currency.text.isNotEmpty
                                      ? currency.text
                                      // ? context
                                      //     .read<WalletCubit>()
                                      //     .currencyController
                                      //     .text
                                      : tr(context, "selectCurrency")),
                              children: [
                                context.read<WalletCubit>().buildCurrencyList(
                                      currencyList: mainCurrency,
                                      selectedCurrency:
                                          selectMainCurrency ?? "",
                                      onCurrencySelected: (value) {
                                        setState(() {
                                          selectMainCurrency = value;
                                          // context
                                          //     .read<WalletCubit>()
                                          //     .currencyController
                                          currency.text = value ?? "";
                                          currencyController.collapse();
                                        });
                                      },
                                    ),
                                context.read<WalletCubit>().buildCurrencyList(
                                    currencyList: subCurrency,
                                    selectedCurrency: selectMainCurrency ?? "",
                                    onCurrencySelected: (value) {
                                      setState(() {
                                        selectMainCurrency = value;
                                        // context
                                        //     .read<WalletCubit>()
                                        //     .currencyController
                                        currency.text = value ?? "";
                                        currencyController.collapse();
                                      });
                                    })
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyText(
                            title: tr(context, "automaticallyConvertCurrency"),
                            color: context.watch<AppThemeCubit>().isDarkMode
                                ? MyColors.white
                                : AppDarkColors.backgroundColor,
                            size: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          Checkbox(
                              activeColor: MyColors.primary,
                              value: context.read<WalletCubit>().checkedValue,
                              onChanged: (newValue) {
                                setState(() {
                                  context.read<WalletCubit>().checkedValue =
                                      newValue!;
                                });
                              })
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              MyText(
                                title: tr(context, "sourceDuration"),
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
                              key: context.read<WalletCubit>().formKey,
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
                                          : tr(context, "walletOpeningDate"),
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter open wallet date';
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
                                              "walletClosingDate",
                                            ),
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return 'Enter close wallet date';
                                        }
                                      },
                                      controller: closeDateController,
                                      //  context
                                      //     .read<WalletCubit>()
                                      //     .closedDateController,
                                      margin: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Container(
                          //         height: 44.h,
                          //         width: 170.w,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(8.r),
                          //           border: Border.all(
                          //               color: MyColors.semiTransparentColor),
                          //         ),
                          //         child: GestureDetector(
                          //           onTap: () {
                          //             openDate(context);
                          //           },
                          //           child: Center(
                          //             child: Padding(
                          //               padding: EdgeInsets.all(12.r),
                          //               child: Row(
                          //                 children: [
                          //                   Image.asset(Res.calendar),
                          //                   SizedBox(
                          //                     width: 15.w,
                          //                   ),
                          //                   Text(
                          //                     selectedDate != null
                          //                         ? "${selectedDate?.toLocal()}"
                          //                             .split(' ')[0]
                          //                         : tr(context,
                          //                             "walletOpeningDate"),
                          //                     style: TextStyle(
                          //                       fontSize: 12.sp,
                          //                       color: context
                          //                               .watch<AppThemeCubit>()
                          //                               .isDarkMode
                          //                           ? MyColors.white
                          //                           : MyColors.black,
                          //                       fontWeight: FontWeight.w400,
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         )),
                          //     SizedBox(
                          //       width: 20.w,
                          //     ),
                          //     Container(
                          //         height: 44.h,
                          //         width: 170.w,
                          //         decoration: BoxDecoration(
                          //           borderRadius: BorderRadius.circular(8.r),
                          //           border: Border.all(
                          //               color: MyColors.semiTransparentColor),
                          //         ),
                          //         child: GestureDetector(
                          //           onTap: () {
                          //             closeDate(context);
                          //           },
                          //           child: Center(
                          //             child: Padding(
                          //               padding: EdgeInsets.all(12.r),
                          //               child: Row(
                          //                 children: [
                          //                   Image.asset(Res.calendar),
                          //                   SizedBox(
                          //                     width: 15.w,
                          //                   ),
                          //                   Text(
                          //                     closedDate != null
                          //                         ? "${closedDate?.toLocal()}"
                          //                             .split(' ')[0]
                          //                         : tr(context,
                          //                             "walletClosingDate"),
                          //                     style: TextStyle(
                          //                       fontSize: 12.sp,
                          //                       color: context
                          //                               .watch<AppThemeCubit>()
                          //                               .isDarkMode
                          //                           ? MyColors.white
                          //                           : MyColors.black,
                          //                       fontWeight: FontWeight.w400,
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         )),
                          //   ],
                          // ),
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
                              // context.read<WalletCubit>().noteController,
                              hint: tr(context, "yourNotes"),
                              hintColor:
                                  context.watch<AppThemeCubit>().isDarkMode
                                      ? MyColors.white
                                      : AppDarkColors.backgroundColor,
                              maxLength: 9,
                              fieldTypes: FieldTypes.normal,
                              type: TextInputType.text,
                              action: TextInputAction.next,
                              validate: (text) {
                                if (text == null || text.isEmpty) {}
                                return null;
                              },
                              onChange: (value) {},
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: MyText(
                                title: tr(context, "walletRepetition"),
                                color: context.watch<AppThemeCubit>().isDarkMode
                                    ? MyColors.white
                                    : AppDarkColors.backgroundColor,
                                size: 18.sp),
                          ),
                          Visibility(
                            visible: repeatSwitchValue,
                            child: SizedBox(
                              width: 150.w,
                              child: TileDropdownButton(
                                  menuList: data.repeatWallet,
                                  value: data.repeatWallet.first,
                                  onChanged: (value) {
                                    repatedWalletController.text =
                                        value.toString();
                                  }),
                            ),
                          ),
                          SizedBox(
                            height: 22.h,
                            width: 44.w,
                            child: CupertinoSwitch(
                              value: repeatSwitchValue,
                              onChanged: (value) {
                                setState(() {
                                  repeatSwitchValue = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      // Visibility(
                      //   visible: repeatSwitchValue,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       MyText(
                      //           title: tr(
                      //               context, "numberOfTimesToRepeatTheWallet"),
                      //           color: context.watch<AppThemeCubit>().isDarkMode
                      //               ? MyColors.white
                      //               : AppDarkColors.backgroundColor,
                      //           size: 14.sp),
                      //       SizedBox(
                      //         width: 150.w,
                      //         child: TileDropdownButton(
                      //             menuList: context
                      //                 .watch<WalletCubit>()
                      //                 .walletDuplicate,
                      //             value: context
                      //                 .read<WalletCubit>()
                      //                 .walletDuplicate
                      //                 .first,
                      //             onChanged: (value) {}),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: MyText(
                                title: tr(context, "notificationWhenReaching"),
                                color: context.watch<AppThemeCubit>().isDarkMode
                                    ? MyColors.white
                                    : AppDarkColors.backgroundColor,
                                size: 18.sp),
                          ),
                          Visibility(
                            visible: notificationSwitchvalu,
                            child: SizedBox(
                              width: 150.w,
                              child: Container(),
                            ),
                          ),
                          SizedBox(
                            height: 22.h,
                            width: 44.w,
                            child: CupertinoSwitch(
                              value: notificationSwitchvalu,
                              onChanged: (value) {
                                setState(() {
                                  notificationSwitchvalu = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      DefaultButton(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        height: 55.h,
                        width: 398.w,
                        title: tr(context, "saveChanges"),
                        color: MyColors.primary,
                        onTap: () {
                          if (formKey.currentState!.validate() &&
                              context
                                  .read<WalletCubit>()
                                  .formKey
                                  .currentState!
                                  .validate()) {
                            repatedWalletController = repatedWalletController;
                            isRepated = repeatSwitchValue;
                            widget.model.balance = parsedNumber;
                            widget.model.valueCategory =
                                valueCategoryController.text;
                            // context
                            //     .read<WalletCubit>()
                            //     .valueCategoryController
                            //     .text;
                            widget.model.name = walletNameController.text;
                            // context
                            //     .read<WalletCubit>()
                            //     .walletNameController
                            //     .text;
                            widget.model.encomeSource =
                                encomSourceController.text;
                            // context
                            //     .read<WalletCubit>()
                            //     .encomSourceController
                            //     .text;
                            widget.model.openDate = openDateController.text;
                            // context
                            //     .read<WalletCubit>()
                            //     .openDateController
                            //     .text;
                            widget.model.closedDate = closeDateController.text;
                            // context
                            //     .read<WalletCubit>()
                            //     .closedDateController
                            //     .text;
                            widget.model.currency = currency.text;

                            // context
                            //     .read<WalletCubit>()
                            //     .currencyController
                            //     .text;
                            widget.model.currencyValue = currencyValue;
                            widget.model.totalBalance =
                                selectMainCurrency == mainCurrency
                                    ? parsedNumber
                                    : (parsedNumber * currencyValue);
                            widget.model.remainBalance =
                                selectMainCurrency == mainCurrency
                                    ? parsedNumber
                                    : (parsedNumber * currencyValue);
                            widget.model.checkedValue =
                                selectMainCurrency == mainCurrency
                                    ? false
                                    : context.read<WalletCubit>().checkedValue;
                            widget.model.save();

                            AutoRouter.of(context).pop();
                          }
                        },
                      )
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
        openDateController.text = selectedDate.toString();
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
        closeDateController.text = closedDate.toString();
      });
    }
  }

  @override
  void dispose() {
    closeDateController.clear();
    encomSourceController.clear();
    currency.clear();
    openDateController.clear();
    walletNameController.clear();
    noteController.clear();
    valueCategoryController.clear();

    super.dispose();
  }
}
