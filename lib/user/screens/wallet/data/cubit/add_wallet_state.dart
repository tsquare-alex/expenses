import 'package:equatable/equatable.dart';

class AddWalletCubitState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddWalletInitial extends AddWalletCubitState {}

class AddWalletLoading extends AddWalletCubitState {}

class AddWalletSucess extends AddWalletCubitState {}

class AddWalletfaliuer extends AddWalletCubitState {
  final String message;

  AddWalletfaliuer({required this.message});
  @override
  List<Object?> get props => [message];
}
