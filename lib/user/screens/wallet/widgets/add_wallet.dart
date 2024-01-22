import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/routers/RouterImports.gr.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_state.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddWallet extends StatefulWidget {
  final int selectItemIndex;
  final String selectedCategory;
  final String iconPath;

  const AddWallet({
    super.key,
    required this.selectItemIndex,
    required this.selectedCategory,
    required this.iconPath,
  });
  @override
  State<AddWallet> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  var formKey = GlobalKey<FormState>();

  WalletData data = WalletData();
  DateTime? selectedDate;
  DateTime? closedDate;
  bool repeatSwitchValue = false;

  bool notificationSwitchvalu = false;

  _AddWalletState();
  double parsedNumber = 0;
  double totalBalance = 0;
  String? selectedValue;
  String? secValue;
  String? selectMainCurrency;
  bool isFirstValidationError = false;
  bool isSecondValidationError = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WalletCubit()..getCurrencyData(context),
        child: BlocBuilder<WalletCubit, WalletState>(
          buildWhen: (previous, current) {
            return (previous is WalletLoading || current is WalletLoading) ||
                (current is CurrencyWallet || current is CurrencyWallet);
          },
          builder: (context, state) {
            if (state is AddWalletLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CurrencyWallet) {
              // List<String> mainCurrency = context
              //     .read<WalletCubit>()
              //     .currencyData
              //     .map((mainData) => mainData.mainCurrency)
              //     .toList();
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
              // List<String> subCurrency = context
              //     .read<WalletCubit>()
              //     .currencyData
              //     .map((subCurrency) => subCurrency.subCurrency)
              //     .toList();
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
                  leading: IconButton(
                    icon: Image.asset(Res.back),
                    onPressed: () => AutoRouter.of(context).pop(),
                  ),
                  backgroundColor: MyColors.white,
                  title: Center(
                    child: MyText(
                      title: widget.selectedCategory,
                      color: MyColors.black,
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
                              border: Border.all(
                                color: MyColors.greyWhite,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ExpansionTile(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.transparent),
                              ),
                              title: Text(
                                "المصادر",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              children: [
                                ...context
                                    .read<WalletCubit>()
                                    .walletSource
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
                                              Text(
                                                item,
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              Radio<String>(
                                                activeColor: MyColors.primary,
                                                value: item,
                                                groupValue: selectedValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    selectedValue = value;
                                                    context
                                                        .read<WalletCubit>()
                                                        .encomSourceController
                                                        .text = value.toString();
                                                    isFirstValidationError =
                                                        false;
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
                                            color:
                                                MyColors.semiTransparentColor,
                                          ),
                                      ],
                                    );
                                  },
                                ),
                                DefaultButton(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  title: "إضافة اخري",
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
                            controller: context
                                .read<WalletCubit>()
                                .walletNameController,
                            hint: "إسم المحفظة",
                            fieldTypes: FieldTypes.normal,
                            type: TextInputType.text,
                            action: TextInputAction.next,
                            focusBorderColor: MyColors.greyWhite,
                            validate: (text) {
                              if (text == null || text.isEmpty) {
                                return "رجاء إدخال اسم المحفظة ";
                              }
                              return null;
                            },
                            onChange: (value) {},
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: MyColors.greyWhite,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ExpansionTile(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(color: Colors.transparent),
                              ),
                              title: Text(
                                "تحديد نوع القيمة",
                                style: TextStyle(
                                    fontSize: 16.h,
                                    fontWeight: FontWeight.w500),
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
                                              Text(
                                                item,
                                                textDirection:
                                                    TextDirection.rtl,
                                              ),
                                              Radio<String>(
                                                activeColor: MyColors.primary,
                                                value: item,
                                                groupValue: secValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    secValue = value;
                                                    context
                                                        .read<WalletCubit>()
                                                        .valueCategoryController
                                                        .text = value.toString();
                                                    isSecondValidationError =
                                                        false;
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
                                            color:
                                                MyColors.semiTransparentColor,
                                          ),
                                      ],
                                    );
                                  },
                                ),
                                DefaultButton(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  title: "إضافة اخري",
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
                          GenericTextField(
                            enableBorderColor: MyColors.semiTransparentColor,
                            controller:
                                context.read<WalletCubit>().balanceController,
                            hint: "الرصيد",
                            focusBorderColor: MyColors.greyWhite,
                            fieldTypes: FieldTypes.normal,
                            type: TextInputType.number,
                            action: TextInputAction.next,
                            validate: (text) {
                              if (text == null || text.isEmpty) {
                                return "رجاء إدخال قيمة المصدر ";
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
                          SizedBox(width: 12.w),
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
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(color: Colors.transparent),
                                  ),
                                  title: const Text("إختيارالعملة"),
                                  children: [
                                    context
                                        .read<WalletCubit>()
                                        .buildCurrencyList(
                                          currencyList: mainCurrency,
                                          selectedCurrency:
                                              selectMainCurrency ?? "",
                                          onCurrencySelected: (value) {
                                            setState(() {
                                              selectMainCurrency = value;
                                              context
                                                  .read<WalletCubit>()
                                                  .currencyController
                                                  .text = value ?? "";
                                            });
                                          },
                                        ),
                                    context
                                        .read<WalletCubit>()
                                        .buildCurrencyList(
                                            currencyList: subCurrency,
                                            selectedCurrency:
                                                selectMainCurrency ?? "",
                                            onCurrencySelected: (value) {
                                              setState(() {
                                                selectMainCurrency = value;
                                                context
                                                    .read<WalletCubit>()
                                                    .currencyController
                                                    .text = value ?? "";
                                              });
                                            })
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                title: "تحويل العمله اوتوماتك",
                                color: MyColors.black,
                                size: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              Checkbox(
                                  activeColor: MyColors.primary,
                                  value:
                                      context.read<WalletCubit>().checkedValue,
                                  onChanged: (newValue) {
                                    setState(() {
                                      // context.read<WalletCubit>().checkedValue =
                                      //     newValue!;
                                      //     if (newValue) {
                                      //   // Set selectMainCurrency to mainCurrency when checkbox is checked
                                      //   selectMainCurrency = mainCurrency;
                                      //   context
                                      //       .read<WalletCubit>()
                                      //       .currencyController
                                      //       .text = mainCurrency ?? "";
                                      // }
                                    });
                                  })
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Column(
                            children: [
                              Row(
                                children: [
                                  MyText(
                                    title: "مدة المصدر",
                                    color: MyColors.black,
                                    size: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.h),
                              Row(
                                children: [
                                  Container(
                                      height: 44.h,
                                      width: 160.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            color:
                                                MyColors.semiTransparentColor),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          openDate(context);
                                        },
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(12.r),
                                            child: Row(
                                              children: [
                                                Image.asset(Res.calendar),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Text(
                                                  selectedDate != null
                                                      ? "${selectedDate?.toLocal()}"
                                                          .split(' ')[0]
                                                      : "تاريخ فتح المحفظة",
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
                                        ),
                                      )),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Container(
                                      height: 44.h,
                                      width: 160.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        border: Border.all(
                                            color:
                                                MyColors.semiTransparentColor),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          closeDate(context);
                                        },
                                        child: Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(12.r),
                                            child: Row(
                                              children: [
                                                Image.asset(Res.calendar),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Text(
                                                  closedDate != null
                                                      ? "${closedDate?.toLocal()}"
                                                          .split(' ')[0]
                                                      : "تاريخ غلق المحفظة",
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: closedDate != null
                                                        ? Colors.black
                                                        : Colors.grey,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Text(
                                "إضافة ملاحظة",
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
                                  controller: context
                                      .read<WalletCubit>()
                                      .noteController,
                                  hint: "ملاحظاتك",
                                  maxLength: 9,
                                  fieldTypes: FieldTypes.normal,
                                  type: TextInputType.text,
                                  action: TextInputAction.next,
                                  validate: (text) {
                                    if (text == null || text.isEmpty) {
                                      return "رجاء ادخل ملاحظاتك";
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
                                width: 328.w,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: MyColors.greyWhite,
                                    ),
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Row(
                                  children: [
                                    Text(
                                      "إضافة صورة",
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
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: MyText(
                                  title: "تكرار المحفظة",
                                  color: MyColors.black,
                                  size: 18.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Visibility(
                                visible: repeatSwitchValue,
                                child: SizedBox(
                                  width: 150.w,
                                  child: TileDropdownButton(
                                      menuList: data.repeatWallet,
                                      value: data.repeatWallet.first,
                                      onChanged: (value) {}),
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
                          Visibility(
                            visible: repeatSwitchValue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyText(
                                  title: "عدد مرات تكرار المحفظة",
                                  color: MyColors.black,
                                  size: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  width: 150.w,
                                  child: TileDropdownButton(
                                      menuList: context
                                          .watch<WalletCubit>()
                                          .walletDuplicate,
                                      value: context
                                          .read<WalletCubit>()
                                          .walletDuplicate
                                          .first,
                                      onChanged: (value) {}),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: MyText(
                                  title: "تنبيه عند انتهاء 20%",
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
                            height: 20.h,
                          ),
                          DefaultButton(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            height: 55.h,
                            width: 398.w,
                            title: tr(context, "addWallet"),
                            color: MyColors.primary,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                var walletData = WalletModel(
                                    name: context
                                        .read<WalletCubit>()
                                        .walletNameController
                                        .text,
                                    balance: parsedNumber,
                                    openDate: context
                                        .read<WalletCubit>()
                                        .openDateController
                                        .text,
                                    closedDate: context
                                        .read<WalletCubit>()
                                        .closedDateController
                                        .text,
                                    encomeSource: context
                                        .read<WalletCubit>()
                                        .encomSourceController
                                        .text,
                                    category: widget.selectedCategory,
                                    valueCategory: context
                                        .read<WalletCubit>()
                                        .valueCategoryController
                                        .text,
                                    currencyValue: currencyValue,
                                    currency: context
                                        .read<WalletCubit>()
                                        .currencyController
                                        .text,
                                    totalBalance:
                                        selectMainCurrency == mainCurrency
                                            ? parsedNumber
                                            : (parsedNumber * currencyValue),
                                    iconPath: widget.iconPath);
                                context.read<WalletCubit>().addNote(walletData);
                                if (context.mounted) {
                                  AutoRouter.of(context)
                                      .push(HomeRoute(index: 0, pageIndex: 7));
                                }
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
          },
        ));
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
        context.read<WalletCubit>().openDateController.text =
            selectedDate.toString();
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
        context.read<WalletCubit>().closedDateController.text =
            closedDate.toString();
      });
    }
  }
}
