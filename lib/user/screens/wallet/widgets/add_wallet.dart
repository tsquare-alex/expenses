import 'package:auto_route/auto_route.dart';
import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/general/widgets/MyText.dart';
import 'package:expenses/user/screens/settings/widgets/settings_widgets_imports.dart';
import 'package:expenses/user/screens/wallet/data/cubit/add_Wallet_cubit/add_wallet_cubit.dart';
import 'package:expenses/user/screens/wallet/data/cubit/add_Wallet_cubit/add_wallet_state.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:expenses/user/screens/wallet/wallet_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddWallet extends StatefulWidget {
  const AddWallet({super.key});

  @override
  State<AddWallet> createState() => _AddWalletState();
}

class _AddWalletState extends State<AddWallet> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController walletNameController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  final TextEditingController dropdownButtonController =
      TextEditingController();
  WalletData data = WalletData();
  int parsedNumber = 0;

  _AddWalletState();
  String? walletName;
  String? balance;
  String? paymentWay;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddWalletCubit(),
      child: Column(
        children: [
          Container(
            height: 105.h,
            width: double.infinity,
            color: MyColors.primary,
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                onPressed: () => AutoRouter.of(context).pop(),
                icon: const Icon(Icons.arrow_back_ios),
                color: MyColors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: BlocConsumer<AddWalletCubit, AddWalletState>(
              listener: (context, state) {},
              builder: (context, state) {
                return BlocConsumer<AddWalletCubit, AddWalletState>(
                  listener: (context, state) {
                    if (state is AddWalletLoading) {}
                    if (state is AddWalletfaliuer) {
                      print(state.message.toString());
                    }
                    if (state is AddWalletSucess) {}
                  },
                  builder: (context, state) {
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            // onChanged: (value) {
                            //   walletName = value;
                            // },

                            validator: (text) {
                              if (text == null || text.isEmpty) {
                                return "رجاء ادخال اسم المحفظة";
                              }
                              return null;
                            },
                            controller: walletNameController,
                            keyboardType: TextInputType.name,
                            textAlign: TextAlign.right,
                            cursorColor: MyColors.primary,
                            decoration: InputDecoration(
                                hoverColor: MyColors.primary,
                                fillColor: MyColors.primary,
                                hintText: " المحفظة",
                                hintStyle: TextStyle(
                                    fontSize: 18.sp, color: MyColors.grey),
                                focusColor: MyColors.primary),
                          ),
                          SizedBox(height: 40.h),
                          Row(
                            children: [
                              Container(
                                width: 45.w,
                                height: 45.h,
                                decoration: BoxDecoration(
                                    color: MyColors.white,
                                    borderRadius: BorderRadius.circular(8.r),
                                    border:
                                        Border.all(color: MyColors.primary)),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "ج.م",
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              SizedBox(
                                width: 270.w,
                                child: TextFormField(
                                  onChanged: (value) {
                                    balance=value;
                                  },
                                  validator: (text) {
                                    if (text == null || text.isEmpty) {
                                      return "رجاء ادخال الرصيد";
                                    }
                                    return null;
                                  },
                                  controller: balanceController,
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.right,
                                  cursorColor: MyColors.primary,
                                  decoration: InputDecoration(
                                      hintText: "الرصيد الحالي",
                                      hintStyle: TextStyle(
                                          fontSize: 18.sp,
                                          color: MyColors.grey),
                                      focusColor: MyColors.primary),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40.h,
                          ),
                          Row(
                            children: [
                              MyText(
                                  title: "طريقة الدفع",
                                  color: MyColors.black,
                                  size: 16.sp),
                              SizedBox(
                                width: 50.w,
                              ),
                              SizedBox(
                                width: 150.w,
                                child: TileDropdownButton(
                                  menuList: data.paymentMethod,
                                  value: data.paymentMethod.first,
                                  onChanged: (value) => {
                                    dropdownButtonController.text =
                                        value as String,
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 100.h,
                          ),
                          DefaultButton(
                            fontSize: 12.sp,
                            onTap: () {
                              validation();
                              var walletModel = WalletModel(
                                  walletName: walletNameController.text,
                                  balance: balanceController.text,
                                  paymentMethod: dropdownButtonController.text);
                              BlocProvider.of<AddWalletCubit>(context)
                                  .addNote(walletModel);
                            },
                            borderColor: MyColors.primary,
                            title: "إضافة محفظة",
                            color: MyColors.primary,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void validation() {
    if (formKey.currentState?.validate() == true) {
      Navigator.pop(context);
      setState(() {});
    }
  }
}
