import 'package:equatable/equatable.dart';
import 'package:expenses/general/models/currency_model/currency_model.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_category/category_model.dart';

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

class CurrencyWallet extends WalletState {}

class WalletVisibilityState extends WalletState {}

class WalletLock extends WalletState {}

class WalletCategoryListLoaded extends WalletState {
  final List<String> categoryList;

  WalletCategoryListLoaded({required this.categoryList});
}

class AddWalletCategory extends WalletState {}

class CurrencyLoading extends WalletState {}

class CurrencyLoaded extends WalletState {
  final List<CurrencyModel> currencyData;

  CurrencyLoaded({required this.currencyData});
}

class AddWalletfaliuer extends WalletState {
  final String message;

  AddWalletfaliuer({required this.message});
  @override
  List<Object?> get props => [message];
}

class CategorySuccess extends WalletState {
  final List<CategoryModel> categoryList;
  CategorySuccess({required this.categoryList});
}
