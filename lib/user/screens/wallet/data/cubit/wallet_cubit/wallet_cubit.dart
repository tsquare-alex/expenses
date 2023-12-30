import 'dart:math';

import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/constants/constants.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_state.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class WalletCubit extends Cubit<WalletState> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 30));

  WalletCubit() : super(WalletInitial());
  bool? isBalanceVisible = true;
  bool? isLocked = true;
  bool checkedValue = false;
  ValueNotifier<int> selectedCategoryIndex = ValueNotifier<int>(0);

  List<String> valueCategory = [
    "نقدي",
    "حساب بنكي",
    "تحويل بنكي",
    "موبايل كاش",
    "نقاط",
    "انستاباي",
  ];
  Color generateRandomColor() {
    Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
  List<Image> Images = [
    Image.asset(
      "assets/images/currency.png",
      height: 36.h,
    ),
    Image.asset(
      "assets/images/currency.png",
      height: 36.h,
    ),
    Image.asset(
      "assets/images/currency.png",
      height: 36.h,
    ),
    Image.asset(
      "assets/images/currency.png",
      height: 36.h,
    ),
    Image.asset(
      "assets/images/cashTransactions.png",
      height: 36.h,
    ),
    Image.asset(
      "assets/images/dollar.png",
      height: 36.h,
    ),
    Image.asset(
      "assets/images/expense.png",
      height: 36.h,
    ),
    Image.asset(
      "assets/images/register.png",
      height: 36.h,
    ),
    Image.asset(
      "assets/images/repeatedTransactions.png",
      height: 36.h,
    ),
    Image.asset(
      "assets/images/repeatedTransactions.png",
      height: 36.h,
    ),
  ];

  List<String> paymentMethod = ["تحويل بنكي", "حساب بنكي", "نقدي"];
  List<String> walletDuplicate = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10"
  ];
  List<String> walletCategory = [
    "حافز",
    "راتب",
    "إضافي",
    "مكافأة",
    "هدايا",
    "حساب بنكي",
    "إيجار",
    "عائد مشروع",
    "صفقة",
    "اخري"
  ];
  List<String> encomeSource = ["شخص", "جهة"];
  List<String> curancyType = ["ر.س", "ج.م"];
  List<String> repeatWallet = [
    "يومياً",
    "اسبوعياً",
    "شهرياً",
    "ربع سنوياً",
    "نصف سنوياً",
    "سنوياً",
  ];

  List<WalletModel> walletList = [];
  fetchAllData() async {
    emit(WalletInitial());
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    walletList = walletBox.values.toList();
    emit(WalletSuccess(wallet: walletList));
  }

  Future addNote(WalletModel model) async {
    emit(AddWalletLoading());
    try {
      var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
      await walletBox.add(model);
      emit(AddWalletSucess());
    } catch (e) {
      emit(AddWalletfaliuer(message: e.toString()));
    }
  }

  void toggleBalanceVisibility(WalletModel model) {
    emit(AddWalletLoading());

    if (model.isHide == true) {
      model.isHide = false;
    } else {
      model.isHide = true;
    }
    emit(WalletVisibilityState());
  }

  void toggleWalletLock(WalletModel model) {
    emit(AddWalletLoading());

    if (model.isClosed == true) {
      model.isClosed = false;
    } else {
      model.isClosed = true;
    }
    emit(WalletLock());
  }

  addPaymentMethodValue(
    context,
    build,
    TextEditingController controller,
  ) {
    showModalBottomSheet(
      isScrollControlled: false,
      elevation: 0,
      context: context,
      builder: (buildContext) {
        return Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.right,
                cursorColor: MyColors.primary,
                decoration: InputDecoration(
                    hintText: " ادخل القيمة",
                    hintStyle: TextStyle(fontSize: 18.sp, color: MyColors.grey),
                    focusColor: MyColors.primary),
              ),
              SizedBox(height: 15.h),
              DefaultButton(
                  title: "اضافة",
                  onTap: () {
                    emit(WalletInitial());

                    if (controller.text.isNotEmpty) {
                      paymentMethod.add(controller.text);
                      emit(AddWalletSucess());
                      Navigator.of(context).pop();
                    }
                  }),
            ],
          ),
        );
      },
    );
  }

  addCategoryMethodValue(
    context,
    build,
    TextEditingController controller,
  ) {
    showModalBottomSheet(
      isScrollControlled: false,
      elevation: 0,
      context: context,
      builder: (buildContext) {
        return Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.right,
                cursorColor: MyColors.primary,
                decoration: InputDecoration(
                    hintText: " ادخل القيمة",
                    hintStyle: TextStyle(fontSize: 18.sp, color: MyColors.grey),
                    focusColor: MyColors.primary),
              ),
              SizedBox(height: 15.h),
              DefaultButton(
                  title: "اضافة",
                  onTap: () {
                    emit(WalletInitial());

                    if (controller.text.isNotEmpty) {
                      walletCategory.add(controller.text);
                      emit(AddWalletSucess());
                      Navigator.of(context).pop();
                    }
                  }),
            ],
          ),
        );
      },
    );
  }

  addEncomeSourceValue(
    context,
    build,
    TextEditingController controller,
  ) {
    showModalBottomSheet(
      isScrollControlled: false,
      elevation: 0,
      context: context,
      builder: (buildContext) {
        return Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.right,
                cursorColor: MyColors.primary,
                decoration: InputDecoration(
                    hintText: " ادخل القيمة",
                    hintStyle: TextStyle(fontSize: 18.sp, color: MyColors.grey),
                    focusColor: MyColors.primary),
              ),
              SizedBox(height: 15.h),
              DefaultButton(
                  title: "اضافة",
                  onTap: () {
                    emit(WalletInitial());

                    if (controller.text.isNotEmpty) {
                      encomeSource.add(controller.text);
                      emit(AddWalletSucess());
                      Navigator.of(context).pop();
                    }
                  }),
            ],
          ),
        );
      },
    );
  }

  addValueCategory(
    context,
    build,
    TextEditingController controller,
  ) {
    showModalBottomSheet(
      isScrollControlled: false,
      elevation: 0,
      context: context,
      builder: (buildContext) {
        return Padding(
          padding: EdgeInsets.all(12.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller,
                keyboardType: TextInputType.text,
                textAlign: TextAlign.right,
                cursorColor: MyColors.primary,
                decoration: InputDecoration(
                    hintText: " ادخل القيمة",
                    hintStyle: TextStyle(fontSize: 18.sp, color: MyColors.grey),
                    focusColor: MyColors.primary),
              ),
              SizedBox(height: 15.h),
              DefaultButton(
                  title: "اضافة",
                  onTap: () {
                    emit(WalletInitial());

                    if (controller.text.isNotEmpty) {
                      valueCategory.add(controller.text);
                      emit(AddWalletSucess());
                      Navigator.of(context).pop();
                    }
                  }),
            ],
          ),
        );
      },
    );
  }
}
