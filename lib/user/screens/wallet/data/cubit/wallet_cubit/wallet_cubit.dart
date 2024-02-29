import 'dart:math';

import 'package:expenses/general/constants/MyColors.dart';
import 'package:expenses/general/constants/constants.dart';
import 'package:expenses/general/models/currency_model/currency_model.dart';
import 'package:expenses/general/packages/input_fields/GenericTextField.dart';
import 'package:expenses/general/packages/localization/Localizations.dart';
import 'package:expenses/general/widgets/DefaultButton.dart';
import 'package:expenses/res.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_state.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_category/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class WalletCubit extends Cubit<WalletState> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 30));
  final GlobalKey<FormState> formKey = GlobalKey();

  WalletCubit() : super(WalletInitial());

  Box<CategoryModel>? categoryBox;

  var currencyBox = Hive.box<CurrencyModel>("currencyBox");

  bool? isBalanceVisible = true;
  bool? isLocked = true;
  bool checkedValue = false;
  bool checkFavorite = false;
  ValueNotifier<int> selectedCategoryIndex = ValueNotifier<int>(0);
  final TextEditingController walletNameController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  final TextEditingController openDateController = TextEditingController();
  final TextEditingController closedDateController = TextEditingController();
  final TextEditingController valueCategoryController = TextEditingController();
  final TextEditingController encomSourceController = TextEditingController();
  final TextEditingController addCategoryController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();
  final TextEditingController repeatedController = TextEditingController();

  List<String> valueCategory = [
    "bankTransfer",
    "points",
    "walletCash",
    "bankAccount",
  ];

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
    "هدية",
    "حساب بنكي",
    "إيجار",
    "عائد مشروع",
    "صفقة",
    "عمولة",
    "بيع",
    "مضاربة"
  ];
  List<Image> walletCategoryImage = [
    Image.asset(Res.salary),
    Image.asset(Res.incentive),
    Image.asset(Res.extra),
    Image.asset(Res.reward),
    Image.asset(Res.gift),
    Image.asset(Res.bank_account),
    Image.asset(Res.project_income),
    Image.asset(Res.deal),
    Image.asset(Res.rent),
    Image.asset(Res.commission),
    Image.asset(Res.sale),
    Image.asset(Res.Speculation),
  ];

  List<String> encomeSource = ["entity", "person"];

  List<String> repeatWallet = [
    "daily",
    "weekly",
    "monthly",
    "quarterly",
    "semiAnnually",
    "annually",
  ];

  List<WalletModel> walletList = [];
  fetchAllData() async {
    emit(WalletInitial());
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    walletList = walletBox.values.toList();
    emit(WalletSuccess(wallet: walletList));
    valueCategoryController.clear();
    addCategoryController.clear();
    balanceController.clear();
    closedDateController.clear();
    encomSourceController.clear();
    noteController.clear();
    noteController.clear();
    openDateController.clear();
    walletNameController.clear();
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

  double calculateTotalBalance(List<WalletModel> wallets) {
    double totalBalance = 0;
    for (var wallet in wallets) {
      totalBalance += wallet.totalBalance ?? 0;
    }
    return totalBalance;
  }

  Future addNewCategory(CategoryModel model) async {
    emit(AddWalletLoading());
    try {
      var categoryBox = Hive.box<CategoryModel>("walletCategoryModel");
      await categoryBox.add(model);
      emit(AddWalletCategory());
    } catch (e) {
      emit(AddWalletfaliuer(message: e.toString()));
    }
  }

  List<CategoryModel> categoryModel = [
    CategoryModel(name: "salary", imagePath: Res.salary),
    CategoryModel(name: "incentive", imagePath: Res.incentive),
    CategoryModel(name: "extra", imagePath: Res.extra),
    CategoryModel(name: "reward", imagePath: Res.reward),
    CategoryModel(name: "gift", imagePath: Res.gift),
    CategoryModel(name: "bankAccount", imagePath: Res.bank_account),
    CategoryModel(name: "projectYield", imagePath: Res.project_income),
    CategoryModel(name: "deal", imagePath: Res.deal),
    CategoryModel(name: "commission", imagePath: Res.commission),
    CategoryModel(name: "sale", imagePath: Res.sale),
    CategoryModel(name: "speculation", imagePath: Res.Speculation),
    CategoryModel(name: "rent", imagePath: Res.rent)
  ];

  List<CategoryModel> categoryList = [];
  iniData(BuildContext context) async {
    emit(WalletInitial());
    var walletBox = await Hive.openBox<CategoryModel>("walletCategoryModel");

    try {
      var list = walletBox.values.toList();
      for (var item in categoryModel) {
        if (!list.any((element) => element.name == item.name)) {
          await walletBox.add(item);
        }
      }
      await getCategory();
      emit(CategorySuccess(categoryList: categoryList));
    } finally {
      await walletBox.close();
    }
  }

  Future<void> getCategory() async {
    var categoryBox = await Hive.openBox<CategoryModel>("walletCategoryModel");

    try {
      categoryList.clear();
      var list = categoryBox.values.map((dynamic value) {
        if (value is CategoryModel) {
          return value;
        } else {
          return CategoryModel();
        }
      }).toList();
      categoryList.addAll(list);
      emit(CategorySuccess(categoryList: categoryList));
    } catch (e) {
      print('Error fetching data from Hive: $e');
    } finally {
      await categoryBox.close();
    }
  }

  Future<void> addValueCategory(
    context,
    build,
    TextEditingController controller,
  ) async {
    showModalBottomSheet(
      isScrollControlled: false,
      elevation: 0,
      context: context,
      builder: (buildContext) {
        return Padding(
          padding: EdgeInsets.all(12.h),
          child: SizedBox(
            height: 500.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GenericTextField(
                    hint: tr(context, "pleaseEnterValue"),
                    controller: controller,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.name,
                    action: TextInputAction.next,
                    validate: (text) {}),
                SizedBox(height: 15.h),
                DefaultButton(
                  title: tr(context, "add"),
                  onTap: () async {
                    emit(WalletInitial());
                    if (controller.text.isNotEmpty) {
                      final box = await Hive.openBox<CategoryModel>(
                          "walletCategoryModel");
                      final randomIndex =
                          Random().nextInt(categoryModel.length);
                      await box.add(CategoryModel(
                        name: controller.text,
                        imagePath: categoryModel[randomIndex].imagePath,
                      ));
                      emit(AddWalletSucess());
                      getCategory();
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  addEncomeSource(context, build, TextEditingController controller) {
    showModalBottomSheet(
      isScrollControlled: false,
      elevation: 0,
      context: context,
      builder: (buildContext) {
        return Padding(
          padding: EdgeInsets.all(12.h),
          child: SizedBox(
            height: 500.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GenericTextField(
                    hint: tr(context, "pleaseEnterValue"),
                    controller: controller,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.name,
                    action: TextInputAction.next,
                    validate: (text) {}),
                SizedBox(height: 16.h),
                DefaultButton(
                    title: tr(context, "add"),
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
          ),
        );
      },
    );
  }

  addValue(context, build, TextEditingController controller) {
    showModalBottomSheet(
      isScrollControlled: false,
      elevation: 0,
      context: context,
      builder: (buildContext) {
        return Padding(
          padding: EdgeInsets.all(12.h),
          child: SizedBox(
            height: 500.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GenericTextField(
                    hint: tr(context, "pleaseEnterValue"),
                    controller: controller,
                    fieldTypes: FieldTypes.normal,
                    type: TextInputType.name,
                    action: TextInputAction.next,
                    validate: (text) {}),
                SizedBox(height: 16.h),
                DefaultButton(
                    title: tr(context, "add"),
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
          ),
        );
      },
    );
  }

  late List<CurrencyModel> currencyData;

  Future<void> fetchCurrencyData(contex) async {
    var box = Hive.box<CurrencyModel>("currencyBox");
    List<CurrencyModel> data = box.values.toList();
    currencyData = data;
  }

  Future<void> getCurrencyData(context) async {
    emit(CurrencyLoading());
    await Future.wait([fetchCurrencyData(context)]);
    emit(CurrencyWallet());
  }

  Widget buildCurrencyList({
    required String currencyList,
    required String selectedCurrency,
    required void Function(String?) onCurrencySelected,
  }) {
    List<String> currencies = currencyList.split(',');

    return Column(
      children: [
        for (String item in currencies)
          Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0.r),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item),
                    Radio<String>(
                      activeColor: MyColors.primary,
                      value: item,
                      groupValue: selectedCurrency,
                      onChanged: onCurrencySelected,
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
          ),
      ],
    );
  }
}
