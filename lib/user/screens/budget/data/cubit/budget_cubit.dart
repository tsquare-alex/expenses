import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:expenses/user/models/transaction_model/transaction_model.dart';
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
    // final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    // var transactionBox = Hive.box<AddTransactionModel>("addTransactionBox");
    // List<AddTransactionModel> data = transactionBox.values.toList();
    // transactioList = data;
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");

    var list = box.values.map((dynamic value) {
      if (value is AddTransactionModel) {
        return value;
      } else {
        return AddTransactionModel(); // Replace with your default value or handle it accordingly
      }
    }).toList();
    transactioList = list;

    box.close();
    // data.sort((a, b) => b.transactionDate!.compareTo(a.transactionDate!));
    // print(data);

    // transactioList = data;
    // transactioList = data.where((model) => model.budget?.name == "m").toList();
    // print(transactioList);
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
    await Future.wait(
        [fetchDataFromTransations(context), fetchdataFromWallet(context)]);
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
