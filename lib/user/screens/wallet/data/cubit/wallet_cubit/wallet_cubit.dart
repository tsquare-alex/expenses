import 'package:expenses/user/screens/wallet/data/cubit/wallet_cubit/wallet_state.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:expenses/user/screens/wallet/widgets/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());
  List<WalletModel> walletList = [];
  fetchAllData() async {
    var walletBox = Hive.box<WalletModel>(databaseBox);
    walletList = walletBox.values.toList();
    emit(WalletSuccess());
  }
}
