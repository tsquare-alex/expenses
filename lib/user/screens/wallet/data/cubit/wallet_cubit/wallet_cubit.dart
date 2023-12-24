import 'package:expenses/general/constants/constants.dart';
import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_state.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class WalletCubit extends Cubit<WalletState> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 30));

  WalletCubit() : super(WalletInitial());

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
}
