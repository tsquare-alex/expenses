import 'package:equatable/equatable.dart';

class AddWalletState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddWalletInitial extends AddWalletState {}

class AddWalletLoading extends AddWalletState {}

class AddWalletSucess extends AddWalletState {}

class AddWalletfaliuer extends AddWalletState {
  final String message;

  AddWalletfaliuer({required this.message});
  @override
  List<Object?> get props => [message];
}
