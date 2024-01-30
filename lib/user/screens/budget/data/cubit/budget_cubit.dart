import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:expenses/user/models/transaction_model/transaction_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart';
import 'package:expenses/user/screens/budget/data/cubit/budget_state.dart';
import 'package:expenses/user/screens/budget/data/model/budget_model.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../../general/constants/constants.dart';

class BudgetCubit extends Cubit<BudgetState> {
  bool checkedValue = false;

  final TextEditingController openDateController = TextEditingController();
  final TextEditingController closeDateController = TextEditingController();
  final TextEditingController budgetBalace = TextEditingController();
  final TextEditingController budgetValueController = TextEditingController();
  final TextEditingController transactionNameController =
      TextEditingController();
  final TextEditingController walletNameController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  BudgetCubit() : super(AddBudgetInitial());

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 30));
  late WalletModel walletModel;
  late TransactionModel transactionModel;
  late List<WalletModel> wallets;
  Future<void> fetchdataFromWallet(context) async {
    var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
    List<WalletModel> data = walletBox.values.toList();
    wallets = data;
  }

  late List<AddTransactionModel> transactioList;
  Future<void> fetchDataFromTransations(context) async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    var list = box.values.map((dynamic value) {
      if (value is AddTransactionModel) {
        return value;
      } else {
        return AddTransactionModel();
      }
    }).toList();
    transactioList = list;
    box.close();
  }

  late List<TransactionTypeModel> transactionShopping;
  Future<void> fetchTransactionShopping(context) async {
    final box =
        await Hive.openBox<TransactionTypeModel>("transactionShoppingBox");
    var list = box.values.map((dynamic value) {
      if (value is TransactionTypeModel) {
        return value;
      } else {
        return TransactionTypeModel();
      }
    }).toList();
    transactionShopping = list;
    box.close();
  }

  late List<TransactionTypeModel> transactionBox;
  Future<void> fetchTransactionBox(context) async {
    final box = await Hive.openBox<TransactionTypeModel>("transactionBox");
    var list = box.values.map((dynamic value) {
      if (value is TransactionTypeModel) {
        return value;
      } else {
        return TransactionTypeModel();
      }
    }).toList();
    transactionBox = list;
    box.close();
  }

  late List<TransactionTypeModel> transactionTargetBBox;
  Future<void> fetchTransactionTargetBox(context) async {
    final box = await Hive.openBox<TransactionTypeModel>("targetBox");
    var list = box.values.map((dynamic value) {
      if (value is TransactionTypeModel) {
        return value;
      } else {
        return TransactionTypeModel();
      }
    }).toList();
    transactionTargetBBox = list;
    box.close();
  }

  late List<TransactionTypeModel> cashTransactionBox;
  Future<void> fetchCashTransaction(context) async {
    final box = await Hive.openBox<TransactionTypeModel>("cashTransactionBox");
    var list = box.values.map((dynamic value) {
      if (value is TransactionTypeModel) {
        return value;
      } else {
        return TransactionTypeModel();
      }
    }).toList();
    cashTransactionBox = list;
    box.close();
  }

  Future addData(BudgetModel model) async {
    emit(AddBudgetLoading());
    var budgetbox = Hive.box<BudgetModel>("budgetBox");
    await budgetbox.add(model);

    try {
      emit(AddBudgetSuccess());
    } catch (e) {
      emit(AddBudgetFaliuer(message: e.toString()));
    }
  }

  Future<void> getBudgetData(context) async {
    emit(AddBudgetLoading());
    await Future.wait([
      fetchDataFromTransations(context),
      fetchdataFromWallet(context),
      fetchCashTransaction(context),
      fetchTransactionBox(context),
      fetchTransactionTargetBox(
        context,
      ),
      fetchTransactionShopping(context)
    ]);
    emit(OpenBudget());
  }

  List<BudgetModel> budgetList = [];
  Future<void> fetchData() async {
    emit(AddBudgetInitial());
    var budgetBox = Hive.box<BudgetModel>("budgetBox");
    budgetList = budgetBox.values.toList();
    emit(SuccessFetchData(budgets: budgetList));
  }

  Future<void> budgetValue(
      AddTransactionModel transactionModel, WalletModel walletModel) async {
    double walletValue = walletModel.balance;
    double transactionValue = double.parse(transactionModel.total ?? '0');
    var res = transactionValue / walletValue;
    emit(BudgetValu(value: res));
  }

  double calculatedInitial = 0.0;

  Future<void> calcualteRatio(BuildContext context) async {
    emit(LoadingCalculat());
    var budgetBox = Hive.box<BudgetModel>("budgetBox");
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    var budgetBoxList = budgetBox.values.toList();
    var transactionBoxList = box.values.toList();
    for (int i = 0; i < budgetBoxList.length; i++) {
      calculatedInitial = 0;
      var targetBudet = budgetBoxList
          .firstWhere((element) => element.key == budgetBoxList[i].key);
      targetBudet.transactionValue = 0;
      budgetBox.put(targetBudet.key, targetBudet);

      for (int g = 0; g < transactionBoxList.length; g++) {
        if (budgetBoxList[i].transactionName ==
            transactionBoxList[g].transactionContent?.name) {
          print(budgetBoxList[i].transactionName ==
              transactionBoxList[g].transactionContent?.name);
          var targetBudet = budgetBoxList
              .firstWhere((element) => element.key == budgetBoxList[i].key);
          var total = double.parse(transactionBoxList[g].total!);
          // calculatedInitial = calculatedInitial + total;
          // print(calculatedInitial);

          targetBudet.transactionValue = targetBudet.transactionValue! + total;
          budgetBox.put(targetBudet.key, targetBudet);
          getBudgetData(context);

          print(targetBudet.transactionValue);
        }
      }
    }
    emit(SuccessCalculat(calculatedValue: 15));
  }

  List<String> dummyTransaction = [
    "فاتورة كهرباء",
    "فاتورة مياه",
    "فاتورة نت",
  ];
  List<String> budgetRepate = [
    "يومياً",
    "اسبوعياً",
    "شهرياً",
    "ربع سنوياً",
    "نصف سنوياً",
    "سنوياً",
  ];
}
