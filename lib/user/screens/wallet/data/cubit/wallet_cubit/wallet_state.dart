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

class AddWalletInitial extends WalletState {}

class AddWalletLoading extends WalletState {}

class AddWalletSucess extends WalletState {}

class WalletVisibilityState extends WalletState {}

class WalletLock extends WalletState {}

class WalletCategoryListLoaded extends WalletState {
  final List<String> categoryList;

  WalletCategoryListLoaded({required this.categoryList});
}

class WalletCategoryListEmpty extends WalletState {}

class WalletCategoryImageListLoaded extends WalletState {
  final List<String> categoryImageList;

  WalletCategoryImageListLoaded(this.categoryImageList);
}

class WalletCategoryImageListEmpty extends WalletState {}

class AddWalletfaliuer extends WalletState {
  final String message;

  AddWalletfaliuer({required this.message});
  @override
  List<Object?> get props => [message];
}
