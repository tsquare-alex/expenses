import 'package:equatable/equatable.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';

class WalletState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletSuccess extends WalletState {
  final List<WalletModel> wallet;

  WalletSuccess({required this.wallet});
}

class Walletfaliuer extends WalletState {
  final String message;

  Walletfaliuer({required this.message});
  @override
  List<Object?> get props => [message];
}
