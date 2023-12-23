import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart';
import 'package:expenses/user/screens/budget/data/cubit/budget_state.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:expenses/user/screens/wallet/widgets/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class BudgetCubit extends Cubit<BudgetState> {
  BudgetCubit() : super(AddBudgetInitial());

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 30));

  late List<WalletModel> wallets;
  fetchdataFromWallet() async {
    emit(AddBudgetInitial());
    var walletBox = Hive.box<WalletModel>(databaseBox);
    List<WalletModel> data = walletBox.values.toList();
    wallets = data;
  }

  late List<AddTransactionModel> transactioList;
  Future<void> fetchDataFromTransations() async {
    final box = await Hive.openBox<AddTransactionModel>("addTransactionBox");
    var transactionBox = Hive.box<AddTransactionModel>("addTransactionBox");
    List<AddTransactionModel> data = transactionBox.values.toList();
    box.close();
    data.sort((a, b) => b.transactionDate!.compareTo(a.transactionDate!));
    transactioList = data;
  }

  Future addData(WalletModel model) async {
    emit(AddBudgetLoading());
    try {
      var walletBox = Hive.box<WalletModel>(databaseBox);
      await walletBox.add(model);
      emit(AddBudgetSuccess());
    } catch (e) {
      emit(AddBudgetFaliuer(message: e.toString()));
    }
  }
}
