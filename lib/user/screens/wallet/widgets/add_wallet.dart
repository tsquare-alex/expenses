import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddWallet extends StatefulWidget {
  final int selectItemIndex;

  const AddWallet({super.key, required this.selectItemIndex});
  @override
  State<AddWallet> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController walletNameController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController rangeDateController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController encomSourceController = TextEditingController();
  final TextEditingController valueCategoryController = TextEditingController();
  final TextEditingController openDateController = TextEditingController();
  final TextEditingController openTimeController = TextEditingController();

  final TextEditingController paymentMethodController = TextEditingController();
  WalletData data = WalletData();
  DateTime? selectedDate;
  DateTime? closedDate;
  TimeOfDay selectedtTime = TimeOfDay.now();
  bool repeatSwitchValue = false;

  bool notificationSwitchvalu = false;
  DateTimeRange selectRangeDate =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  _AddWalletState();
  double parsedNumber = 0;
  String? selectedValue;
  bool isFirstValidationError = false;
  bool isSecondValidationError = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(Res.back),
          onPressed: () => AutoRouter.of(context).pop(),
        ),
        backgroundColor: MyColors.white,
        title: Center(
          child: MyText(
            title: tr(context, 'addWallet'),
            color: MyColors.black,
            size: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isFirstValidationError
                          ? Colors.red
                          : Colors.grey.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ExpansionTile(
                    title: const Text("المصادر"),
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
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0.r),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item,
                                      textDirection: TextDirection.rtl,
                                    ),
                                    Radio<String>(
                                      value: item,
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value;
                                          encomSourceController.text =
                                              value.toString();
                                          isFirstValidationError = false;
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
                        fontWeight: FontWeight.w500,
                        title: "إضافة اخري",
                        onTap: () {
                          if (selectedValue == null) {
                            setState(() {
                              isFirstValidationError = true;
                            });
                            CustomToast.showSimpleToast(msg: "اختر القيمة");
                          } else {
                            setState(() {
                              isFirstValidationError = false;
                            });
                          }
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
                  controller: walletNameController,
                  hint: "إسم المحفظة",
                  fieldTypes: FieldTypes.normal,
                  type: TextInputType.text,
                  action: TextInputAction.next,
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
                      color: isSecondValidationError
                          ? Colors.red
                          : Colors.grey.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ExpansionTile(
                    title: const Text("تحديد نوع القيمة"),
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
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16.0.r),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item,
                                      textDirection: TextDirection.rtl,
                                    ),
                                    Radio<String>(
                                      value: item,
                                      groupValue: selectedValue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedValue = value;
                                          encomSourceController.text =
                                              value.toString();
                                          isSecondValidationError = false;
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
                        fontWeight: FontWeight.w500,
                        title: "إضافة اخري",
                        onTap: () {
                          if (selectedValue == null) {
                            setState(() {
                              isSecondValidationError = true;
                            });
                            CustomToast.showSimpleToast(msg: "اختر القيمة");
                          } else {
                            setState(() {
                              isSecondValidationError = false;
                            });
                          }
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
                      height: 58.h,
                      width: 319.w,
                      child: GenericTextField(
                        controller: walletNameController,
                        hint: "الرصيد",
                        fieldTypes: FieldTypes.normal,
                        type: TextInputType.number,
                        action: TextInputAction.next,
                        validate: (text) {
                          if (text == null || text.isEmpty) {
                            return "رجاء إدخال قيمة المصدر ";
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyText(
                        title: "تحويل العمله اوتوماتك",
                        color: MyColors.black,
                        size: 12.sp),
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
                            title: "مدة المصدر",
                            color: MyColors.black,
                            size: 16.sp)
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 44.h,
                            width: 160.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: MyColors.semiTransparentColor),
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
                                      Image.asset(Res.calender),
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
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                  color: MyColors.semiTransparentColor),
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
                                      Image.asset(Res.calender),
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
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: MyText(
                          title: "تكرار المحفظة",
                          color: MyColors.black,
                          size: 16.sp),
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
                          size: 14.sp),
                      SizedBox(
                        width: 150.w,
                        child: TileDropdownButton(
                            menuList:
                                context.watch<WalletCubit>().walletDuplicate,
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
                  height: 20.h,
                ),
                DefaultButton(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  height: 55.h,
                  width: 398.w,
                  title: tr(context, "addWallet"),
                  color: MyColors.primary,
                  onTap: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
    // SingleChildScrollView(
    //   child: Padding(
    //     padding: EdgeInsets.all(16.w),
    //     child: BlocConsumer<WalletCubit, WalletState>(
    //       listener: (context, state) {},
    //       builder: (context, state) {
    //         return Form(
    //           key: formKey,
    //           child: Column(
    //             children: [
    //               TextFormField(
    //                 validator: (text) {
    //                   if (text == null || text.isEmpty) {
    //                     return "رجاء ادخال اسم المحفظة";
    //                   }
    //                   return null;
    //                 },
    //                 controller: walletNameController,
    //                 keyboardType: TextInputType.name,
    //                 textAlign: TextAlign.right,
    //                 cursorColor: MyColors.primary,
    //                 decoration: InputDecoration(
    //                     hoverColor: MyColors.primary,
    //                     fillColor: MyColors.primary,
    //                     hintText: " المحفظة",
    //                     hintStyle:
    //                         TextStyle(fontSize: 18.sp, color: MyColors.grey),
    //                     focusColor: MyColors.primary),
    //               ),
    //               SizedBox(height: 40.h),
    //               TextFormField(
    //                 onChanged: (value) {
    //                   parsedNumber = double.parse(balanceController.text);
    //                 },
    //                 validator: (text) {
    //                   if (text == null || text.isEmpty) {
    //                     return "رجاء ادخال الرصيد";
    //                   }
    //                   return null;
    //                 },
    //                 controller: balanceController,
    //                 keyboardType: TextInputType.number,
    //                 textAlign: TextAlign.right,
    //                 cursorColor: MyColors.primary,
    //                 decoration: InputDecoration(
    //                     hintText: "الرصيد الحالي",
    //                     hintStyle:
    //                         TextStyle(fontSize: 18.sp, color: MyColors.grey),
    //                     focusColor: MyColors.primary),
    //               ),
    //               SizedBox(
    //                 height: 45.h,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   const Icon(Icons.calendar_month),
    //                   SizedBox(
    //                     width: 5.w,
    //                   ),
    //                   MyText(
    //                       title: "تاريخ المعاملة",
    //                       color: MyColors.black,
    //                       size: 14.sp),
    //                   SizedBox(
    //                     width: 10.w,
    //                   ),
    //                   InkWell(
    //                       onTap: () {
    //                         chosenDate();
    //                       },
    //                       child: Text(
    //                         '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
    //                         style: TextStyle(fontSize: 14.sp),
    //                       )),
    //                   SizedBox(
    //                     width: 60.w,
    //                   ),
    //                   InkWell(
    //                       onTap: () {
    //                         chosenTime();
    //                       },
    //                       child: Text(
    //                         ' ${selectedtTime.minute}: ${selectedtTime.hour} ',
    //                         style: TextStyle(fontSize: 14.sp),
    //                       )),
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 30.h,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   const Icon(Icons.calendar_month),
    //                   SizedBox(
    //                     width: 5.w,
    //                   ),
    //                   Expanded(
    //                     child: MyText(
    //                         title: "تاريخ فتح المحفظة",
    //                         color: MyColors.black,
    //                         size: 14.sp),
    //                   ),
    //                   SizedBox(
    //                     width: 10.w,
    //                   ),
    //                   InkWell(
    //                       onTap: () {
    //                         chosenOpenDate();
    //                       },
    //                       child: Text(
    //                         '${selectOpenDate.month}/${selectOpenDate.day}/${selectOpenDate.year}',
    //                         style: TextStyle(fontSize: 14.sp),
    //                       )),
    //                   SizedBox(
    //                     width: 60.w,
    //                   ),
    //                   InkWell(
    //                       onTap: () {
    //                         chosenOpenTime();
    //                       },
    //                       child: Text(
    //                         ' ${selectOpenTime.minute}: ${selectOpenTime.hour} ',
    //                         style: TextStyle(fontSize: 14.sp),
    //                       )),
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 30.h,
    //               ),
    //               ExpansionTile(
    //                 title: const Text("طريقة الدفع"),
    //                 children: [
    //                   Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       MyText(
    //                           title: "طريقة الدفع",
    //                           color: MyColors.black,
    //                           size: 14.sp),
    //                       SizedBox(
    //                         width: 150.w,
    //                         child: TileDropdownButton(
    //                           menuList:
    //                               context.watch<WalletCubit>().paymentMethod,
    //                           value: context
    //                               .read<WalletCubit>()
    //                               .paymentMethod
    //                               .first,
    //                           onChanged: (value) => {
    //                             paymentMethodController.text = value as String,
    //                           },
    //                         ),
    //                       ),
    //                       IconButton(
    //                           onPressed: () {
    //                             context
    //                                 .read<WalletCubit>()
    //                                 .addPaymentMethodValue(
    //                                   context,
    //                                   build,
    //                                   paymentMethodController,
    //                                 );
    //                           },
    //                           icon: const Icon(Icons.add))
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 15.h,
    //               ),
    //               SizedBox(
    //                 height: 15.h,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   MyText(
    //                       title: "التصنيف", color: MyColors.black, size: 14.sp),
    //                   SizedBox(
    //                     width: 150.w,
    //                     child: TileDropdownButton(
    //                         menuList:
    //                             context.watch<WalletCubit>().walletCategory,
    //                         value: context
    //                             .read<WalletCubit>()
    //                             .walletCategory[widget.selectItemIndex],
    //                         onChanged: (value) {
    //                           int newIndex = context
    //                               .read<WalletCubit>()
    //                               .walletCategory
    //                               .indexOf(value as String);
    //                           context
    //                               .read<WalletCubit>()
    //                               .selectedCategoryIndex
    //                               .value = newIndex;
    //                           // categoryController.text = value as String;
    //                         }),
    //                   ),
    //                   IconButton(
    //                       onPressed: () {
    //                         context.read<WalletCubit>().addCategoryMethodValue(
    //                               context,
    //                               build,
    //                               categoryController,
    //                             );
    //                       },
    //                       icon: const Icon(Icons.add))
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 15.h,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   MyText(
    //                       title: "مصدر الدخل",
    //                       color: MyColors.black,
    //                       size: 14.sp),
    //                   SizedBox(
    //                     width: 150.w,
    //                     child: TileDropdownButton(
    //                       menuList: context.watch<WalletCubit>().encomeSource,
    //                       value: context.read<WalletCubit>().encomeSource.first,
    //                       onChanged: (value) {
    //                         encomSourceController.text = value as String;
    //                       },
    //                     ),
    //                   ),
    //                   IconButton(
    //                       onPressed: () {
    //                         context.read<WalletCubit>().addEncomeSourceValue(
    //                             context, build, encomSourceController);
    //                       },
    //                       icon: const Icon(Icons.add))
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 15.h,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   MyText(
    //                       title: "تحديد نوع القيمة",
    //                       color: MyColors.black,
    //                       size: 14.sp),
    //                   SizedBox(
    //                     width: 150.w,
    //                     child: TileDropdownButton(
    //                         menuList:
    //                             context.watch<WalletCubit>().valueCategory,
    //                         value:
    //                             context.read<WalletCubit>().valueCategory.first,
    //                         onChanged: (value) {
    //                           valueCategoryController.text = value as String;
    //                         }),
    //                   ),
    //                   IconButton(
    //                       onPressed: () {
    //                         context.read<WalletCubit>().addValueCategory(
    //                             context, build, valueCategoryController);
    //                       },
    //                       icon: const Icon(Icons.add))
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 15.h,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   MyText(
    //                       title: "تحديد  المحفظة الافتراضية",
    //                       color: MyColors.black,
    //                       size: 14.sp),
    //                   Checkbox(
    //                       activeColor: MyColors.primary,
    //                       value: context.read<WalletCubit>().checkedValue,
    //                       onChanged: (newValue) {
    //                         setState(() {
    //                           context.read<WalletCubit>().checkedValue =
    //                               newValue!;
    //                         });
    //                       })
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 15.h,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Expanded(
    //                     child: MyText(
    //                         title: "تكرار المحفظة",
    //                         color: MyColors.black,
    //                         size: 14.sp),
    //                   ),
    //                   Visibility(
    //                     visible: repeatSwitchValue,
    //                     child: SizedBox(
    //                       width: 150.w,
    //                       child: TileDropdownButton(
    //                           menuList: data.repeatWallet,
    //                           value: data.repeatWallet.first,
    //                           onChanged: (value) {}),
    //                     ),
    //                   ),
    //                   CupertinoSwitch(
    //                     value: repeatSwitchValue,
    //                     onChanged: (value) {
    //                       setState(() {
    //                         repeatSwitchValue = value;
    //                       });
    //                     },
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 15.h,
    //               ),
    //               Visibility(
    //                 visible: repeatSwitchValue,
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     MyText(
    //                         title: "عدد مرات تكرار المحفظة",
    //                         color: MyColors.black,
    //                         size: 14.sp),
    //                     SizedBox(
    //                       width: 150.w,
    //                       child: TileDropdownButton(
    //                           menuList:
    //                               context.watch<WalletCubit>().walletDuplicate,
    //                           value: context
    //                               .read<WalletCubit>()
    //                               .walletDuplicate
    //                               .first,
    //                           onChanged: (value) {}),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 15.h,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Expanded(
    //                     child: MyText(
    //                         title: "تنبيه عند انتهاء 20%",
    //                         color: MyColors.black,
    //                         size: 14.sp),
    //                   ),
    //                   Visibility(
    //                     visible: notificationSwitchvalu,
    //                     child: SizedBox(
    //                       width: 150.w,
    //                       child: Container(),
    //                     ),
    //                   ),
    //                   CupertinoSwitch(
    //                     value: notificationSwitchvalu,
    //                     onChanged: (value) {
    //                       setState(() {
    //                         notificationSwitchvalu = value;
    //                       });
    //                     },
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: 15.h,
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   MyText(
    //                       title: "مدة المحفظة",
    //                       color: MyColors.black,
    //                       size: 14.sp),
    //                   SizedBox(
    //                     width: 10.w,
    //                   ),
    //                   IconButton(
    //                     onPressed: () {
    //                       dateRange();
    //                     },
    //                     icon: const Icon(Icons.calendar_month_outlined),
    //                   ),
    //                 ],
    //               ),
    //               DefaultButton(
    //                 fontSize: 14.sp,
    //                 onTap: () async {
    //                   if (formKey.currentState!.validate()) {
    //                     var walletModel = WalletModel(
    //                         walletCategory:
    //                             context.read<WalletCubit>().walletCategory,
    //                         walletOpiningTime: openTimeController.text,
    //                         walletOpiningDate: openDateController.text,
    //                         checkedValue:
    //                             context.read<WalletCubit>().checkedValue,
    //                         walletPeriod: rangeDateController.text,
    //                         valueCategory: valueCategoryController.text == ""
    //                             ? data.valueCategory.first
    //                             : valueCategoryController.text,
    //                         encomeSource: encomSourceController.text == ""
    //                             ? data.encomeSource.first
    //                             : encomSourceController.text,
    //                         date: selectedDate.microsecondsSinceEpoch,
    //                         time: selectedtTime.minute,
    //                         category: categoryController.text == ""
    //                             ? data.walletCategory.first
    //                             : categoryController.text,
    //                         name: walletNameController.text,
    //                         balance: parsedNumber,
    //                         paymentMethod: paymentMethodController.text == ""
    //                             ? data.paymentMethod.first
    //                             : paymentMethodController.text);
    //                     await BlocProvider.of<WalletCubit>(context)
    //                         .addNote(walletModel);
    //                     if (context.mounted) {
    //                       AutoRouter.of(context)
    //                           .push(HomeRoute(index: 0, pageIndex: 7));
    //                     }
    //                   }
    //                 },
    //                 borderColor: MyColors.primary,
    //                 title: tr(context, "addWallet"),
    //                 color: MyColors.primary,
    //               ),
    //             ],
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }

  // Future<void> chosenTime() async {
  //   final chosenDate = await showTimePicker(
  //     context: context,
  //     initialTime: TimeOfDay.now(),
  //   );
  //   if (chosenDate != null) {
  //     selectedtTime = chosenDate;
  //     timeController.text = selectedtTime.toString();
  //     setState(() {});
  //   }
  // }

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
      });
    }
  }

  // Future<void> chosenDate() async {
  //   final DateTime picked = await showDatePicker(
  //       context: context,
  //       initialDate: selectedDate ?? DateTime.now(),
  //       firstDate: DateTime.now(2000),
  //       lastDate: DateTime.now().add(const Duration(days: 365)));

  //   if (chosenDate != null) {
  //     selectedDate = chosenDate;
  //     dateController.text = selectedDate.toString();
  //     setState(() {});
  //   }
  // }

  // void dateRange() async {
  //   DateTimeRange? dateRange = await showDateRangePicker(
  //     context: context,
  //     firstDate: context.read<WalletCubit>().startDate,
  //     lastDate: context.read<WalletCubit>().endDate,
  //   );

  //   if (dateRange != null) {
  //     setState(() {
  //       selectRangeDate = dateRange;
  //       rangeDateController.text =
  //           "${dateRange.start.day}/${dateRange.start.month}/${dateRange.start.year} - ${dateRange.end.day}/${dateRange.end.month}/${dateRange.end.year}";
  //     });
  //   }
  // }

  @override
  void dispose() {
    walletNameController.dispose();
    balanceController.dispose();
    dateController.dispose();
    timeController.dispose();
    rangeDateController.dispose();
    categoryController.dispose();
    encomSourceController.dispose();
    valueCategoryController.dispose();
    openDateController.dispose();
    openTimeController.dispose();
    paymentMethodController.dispose();
    super.dispose();
  }
}
