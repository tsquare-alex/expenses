import 'package:equatable/equatable.dart';

class WalletState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WalletInitial extends WalletState {}

class WalletLoading extends WalletState {}

class WalletSuccess extends WalletState {}

class Walletfaliuer extends WalletState {
  final String message;

  Walletfaliuer({required this.message});
  @override
  List<Object?> get props => [message];
}
