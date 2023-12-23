import 'package:expenses/user/screens/budget/data/cubit/budget_state.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:expenses/user/screens/wallet/widgets/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class BudgetCubit extends Cubit<BudgetState> {
  BudgetCubit() : super(AddBudgetInitial());
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  List<WalletModel> walletList = [];

  fetchdataFromWallet() async {
    emit(AddBudgetInitial());
    var walletBox = Hive.box<WalletModel>(databaseBox);
    walletList = walletBox.values.toList();
  }
}
