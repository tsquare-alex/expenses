import 'package:equatable/equatable.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';

class AddWalletState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WalletInitial extends AddWalletState {}

class WalletLoading extends AddWalletState {}

class WalletSucess extends AddWalletState {
  final List<WalletModel> wallet;

  WalletSucess({required this.wallet});
}

class Walletfaliuer extends AddWalletState {
  final String message;

  Walletfaliuer({required this.message});
  @override
  List<Object?> get props => [message];
}
