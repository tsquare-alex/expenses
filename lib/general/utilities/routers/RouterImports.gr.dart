// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i37;
import 'package:expenses/general/screens/currency_rate/currency_rate_imports.dart'
    as _i8;
import 'package:expenses/general/screens/forget_password/ForgetPasswordImports.dart'
    as _i5;
import 'package:expenses/general/screens/login/LoginImports.dart' as _i4;
import 'package:expenses/general/screens/register/RegisterImports.dart' as _i9;
import 'package:expenses/general/screens/select_country/select_country_imports.dart'
    as _i6;
import 'package:expenses/general/screens/select_currency/select_currency_imports.dart'
    as _i7;
import 'package:expenses/general/screens/select_language/select_language_imports.dart'
    as _i3;
import 'package:expenses/general/screens/splash/SplashImports.dart' as _i1;
import 'package:expenses/general/screens/welcome_page/WelcomePageImports.dart'
    as _i2;
import 'package:expenses/user/models/add_transaction_model/add_transaction_model.dart'
    as _i41;
import 'package:expenses/user/models/database_model/database_model.dart'
    as _i39;
import 'package:expenses/user/models/transaction_model/transaction_model.dart'
    as _i40;
import 'package:expenses/user/screens/add_transaction/add_transaction_imports.dart'
    as _i13;
import 'package:expenses/user/screens/bag/bag_imports.dart' as _i34;
import 'package:expenses/user/screens/balance_transfer/wallet_balance_transfer_imports.dart'
    as _i33;
import 'package:expenses/user/screens/bmi_calculator/bmi_calculator_imports.dart'
    as _i15;
import 'package:expenses/user/screens/budget/widget/add_transaction.dart'
    as _i30;
import 'package:expenses/user/screens/cash_transactions/cash_transactions_imports.dart'
    as _i19;
import 'package:expenses/user/screens/change_currency/change_currency_imports.dart'
    as _i16;
import 'package:expenses/user/screens/database/widgets/add_database.dart'
    as _i12;
import 'package:expenses/user/screens/database/widgets/database_details.dart'
    as _i11;
import 'package:expenses/user/screens/expense/expense_imports.dart' as _i21;
import 'package:expenses/user/screens/home/home_imports.dart' as _i10;
import 'package:expenses/user/screens/repeated_transactions/repeated_transactions_imports.dart'
    as _i20;
import 'package:expenses/user/screens/reports/statistics/statistics_imports.dart'
    as _i24;
import 'package:expenses/user/screens/shopping/shopping_imports.dart' as _i17;
import 'package:expenses/user/screens/target/target_imports.dart' as _i18;
import 'package:expenses/user/screens/tools_helper/tools_helper.dart' as _i29;
import 'package:expenses/user/screens/transaction_details/transaction_details_imports.dart'
    as _i14;
import 'package:expenses/user/screens/transaction_type/transaction_type_imports.dart'
    as _i35;
import 'package:expenses/user/screens/transfer_wallet_transaction/transfer_wallet_transaction_imports.dart'
    as _i32;
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart'
    as _i42;
import 'package:expenses/user/screens/wallet/wallet_imports.dart' as _i25;
import 'package:expenses/user/screens/wallet/widgets/add_balance.dart' as _i28;
import 'package:expenses/user/screens/wallet/widgets/add_wallet.dart' as _i23;
import 'package:expenses/user/screens/wallet/widgets/balance_transfer.dart'
    as _i22;
import 'package:expenses/user/screens/wallet/widgets/balance_withdrawal.dart'
    as _i27;
import 'package:expenses/user/screens/wallet/widgets/edit_Wallet.dart' as _i26;
import 'package:expenses/user/screens/wallet/widgets/wallet_category_screen.dart'
    as _i36;
import 'package:expenses/user/screens/wallet_transactions/wallet_transactions_imports.dart'
    as _i31;
import 'package:flutter/material.dart' as _i38;

class AppRouter extends _i37.RootStackRouter {
  AppRouter([_i38.GlobalKey<_i38.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i37.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.Splash(navigatorKey: args.navigatorKey),
        opaque: true,
      );
    },
    WelcomePageRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
        opaque: true,
      );
    },
    SelectLanguageRoute.name: (routeData) {
      return _i37.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.SelectLanguage(),
        transitionsBuilder: _i37.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i37.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.Login(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgetPassword(),
        opaque: true,
      );
    },
    SelectCountryRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.SelectCountry(),
        opaque: true,
      );
    },
    SelectCurrencyRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.SelectCurrency(),
        opaque: true,
      );
    },
    CurrencyRateRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.CurrencyRate(),
        opaque: true,
      );
    },
    RegisterRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.Register(),
        opaque: true,
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i10.Home(
          key: args.key,
          index: args.index,
          pageIndex: args.pageIndex,
        ),
        opaque: true,
      );
    },
    DatabaseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DatabaseDetailsRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.DatabaseDetails(
          key: args.key,
          databaseData: args.databaseData,
          onDataChanged: args.onDataChanged,
        ),
        opaque: true,
      );
    },
    AddDatabaseRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i12.AddDatabase(),
        opaque: true,
      );
    },
    AddTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<AddTransactionRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i13.AddTransaction(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    TransactionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionDetailsRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i14.TransactionDetails(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    BMICalculatorRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.BMICalculator(),
        opaque: true,
      );
    },
    ChangeCurrencyRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.ChangeCurrency(),
        opaque: true,
      );
    },
    ShoppingRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.Shopping(),
        opaque: true,
      );
    },
    TargetRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.Target(),
        opaque: true,
      );
    },
    CashTransactionsRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.CashTransactions(),
        opaque: true,
      );
    },
    RepeatedTransactionsRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.RepeatedTransactions(),
        opaque: true,
      );
    },
    ExpenseRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i21.Expense(),
        opaque: true,
      );
    },
    BalanceTransferRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i22.BalanceTransfer(),
        opaque: true,
      );
    },
    AddWalletRoute.name: (routeData) {
      final args = routeData.argsAs<AddWalletRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i23.AddWallet(
          key: args.key,
          selectItemIndex: args.selectItemIndex,
        ),
        opaque: true,
      );
    },
    StatisticsRoute.name: (routeData) {
      final args = routeData.argsAs<StatisticsRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i24.Statistics(
          key: args.key,
          option: args.option,
        ),
        opaque: true,
      );
    },
    WalletRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i25.Wallet(),
        opaque: true,
      );
    },
    EditWalletRoute.name: (routeData) {
      final args = routeData.argsAs<EditWalletRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i26.EditWallet(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    BalanceWithdrawalRoute.name: (routeData) {
      final args = routeData.argsAs<BalanceWithdrawalRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i27.BalanceWithdrawal(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    AddBalanceRoute.name: (routeData) {
      final args = routeData.argsAs<AddBalanceRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i28.AddBalance(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    ToolsHelperRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i29.ToolsHelper(),
        opaque: true,
      );
    },
    AddTransactionBudgetRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i30.AddTransactionBudget(),
        opaque: true,
      );
    },
    WalletTransactionsRoute.name: (routeData) {
      final args = routeData.argsAs<WalletTransactionsRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i31.WalletTransactions(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    TransferWalletTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<TransferWalletTransactionRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i32.TransferWalletTransaction(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    WalletBalanceTransferRoute.name: (routeData) {
      final args = routeData.argsAs<WalletBalanceTransferRouteArgs>();
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i33.WalletBalanceTransfer(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    BagRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i34.Bag(),
        opaque: true,
      );
    },
    TransactionTypeRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i35.TransactionType(),
        opaque: true,
      );
    },
    WalletCategoryRoute.name: (routeData) {
      return _i37.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i36.WalletCategory(),
        opaque: true,
      );
    },
  };

  @override
  List<_i37.RouteConfig> get routes => [
        _i37.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i37.RouteConfig(
          WelcomePageRoute.name,
          path: '/welcome-page',
        ),
        _i37.RouteConfig(
          SelectLanguageRoute.name,
          path: '/select-language',
        ),
        _i37.RouteConfig(
          LoginRoute.name,
          path: '/Login',
        ),
        _i37.RouteConfig(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        ),
        _i37.RouteConfig(
          SelectCountryRoute.name,
          path: '/select-country',
        ),
        _i37.RouteConfig(
          SelectCurrencyRoute.name,
          path: '/select-currency',
        ),
        _i37.RouteConfig(
          CurrencyRateRoute.name,
          path: '/currency-rate',
        ),
        _i37.RouteConfig(
          RegisterRoute.name,
          path: '/Register',
        ),
        _i37.RouteConfig(
          HomeRoute.name,
          path: '/Home',
        ),
        _i37.RouteConfig(
          DatabaseDetailsRoute.name,
          path: '/database-details',
        ),
        _i37.RouteConfig(
          AddDatabaseRoute.name,
          path: '/add-database',
        ),
        _i37.RouteConfig(
          AddTransactionRoute.name,
          path: '/add-transaction',
        ),
        _i37.RouteConfig(
          TransactionDetailsRoute.name,
          path: '/transaction-details',
        ),
        _i37.RouteConfig(
          BMICalculatorRoute.name,
          path: '/b-mi-calculator',
        ),
        _i37.RouteConfig(
          ChangeCurrencyRoute.name,
          path: '/change-currency',
        ),
        _i37.RouteConfig(
          ShoppingRoute.name,
          path: '/Shopping',
        ),
        _i37.RouteConfig(
          TargetRoute.name,
          path: '/Target',
        ),
        _i37.RouteConfig(
          CashTransactionsRoute.name,
          path: '/cash-transactions',
        ),
        _i37.RouteConfig(
          RepeatedTransactionsRoute.name,
          path: '/repeated-transactions',
        ),
        _i37.RouteConfig(
          ExpenseRoute.name,
          path: '/Expense',
        ),
        _i37.RouteConfig(
          BalanceTransferRoute.name,
          path: '/balance-transfer',
        ),
        _i37.RouteConfig(
          AddWalletRoute.name,
          path: '/add-wallet',
        ),
        _i37.RouteConfig(
          StatisticsRoute.name,
          path: '/Statistics',
        ),
        _i37.RouteConfig(
          WalletRoute.name,
          path: '/Wallet',
        ),
        _i37.RouteConfig(
          EditWalletRoute.name,
          path: '/edit-wallet',
        ),
        _i37.RouteConfig(
          BalanceWithdrawalRoute.name,
          path: '/balance-withdrawal',
        ),
        _i37.RouteConfig(
          AddBalanceRoute.name,
          path: '/add-balance',
        ),
        _i37.RouteConfig(
          ToolsHelperRoute.name,
          path: '/tools-helper',
        ),
        _i37.RouteConfig(
          AddTransactionBudgetRoute.name,
          path: '/add-transaction-budget',
        ),
        _i37.RouteConfig(
          WalletTransactionsRoute.name,
          path: '/wallet-transactions',
        ),
        _i37.RouteConfig(
          TransferWalletTransactionRoute.name,
          path: '/transfer-wallet-transaction',
        ),
        _i37.RouteConfig(
          WalletBalanceTransferRoute.name,
          path: '/wallet-balance-transfer',
        ),
        _i37.RouteConfig(
          BagRoute.name,
          path: '/Bag',
        ),
        _i37.RouteConfig(
          TransactionTypeRoute.name,
          path: '/transaction-type',
        ),
        _i37.RouteConfig(
          WalletCategoryRoute.name,
          path: '/wallet-category',
        ),
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i37.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i38.GlobalKey<_i38.NavigatorState> navigatorKey})
      : super(
          SplashRoute.name,
          path: '/',
          args: SplashRouteArgs(navigatorKey: navigatorKey),
        );

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

  final _i38.GlobalKey<_i38.NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'SplashRouteArgs{navigatorKey: $navigatorKey}';
  }
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomePageRoute extends _i37.PageRouteInfo<void> {
  const WelcomePageRoute()
      : super(
          WelcomePageRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomePageRoute';
}

/// generated route for
/// [_i3.SelectLanguage]
class SelectLanguageRoute extends _i37.PageRouteInfo<void> {
  const SelectLanguageRoute()
      : super(
          SelectLanguageRoute.name,
          path: '/select-language',
        );

  static const String name = 'SelectLanguageRoute';
}

/// generated route for
/// [_i4.Login]
class LoginRoute extends _i37.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.ForgetPassword]
class ForgetPasswordRoute extends _i37.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        );

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i6.SelectCountry]
class SelectCountryRoute extends _i37.PageRouteInfo<void> {
  const SelectCountryRoute()
      : super(
          SelectCountryRoute.name,
          path: '/select-country',
        );

  static const String name = 'SelectCountryRoute';
}

/// generated route for
/// [_i7.SelectCurrency]
class SelectCurrencyRoute extends _i37.PageRouteInfo<void> {
  const SelectCurrencyRoute()
      : super(
          SelectCurrencyRoute.name,
          path: '/select-currency',
        );

  static const String name = 'SelectCurrencyRoute';
}

/// generated route for
/// [_i8.CurrencyRate]
class CurrencyRateRoute extends _i37.PageRouteInfo<void> {
  const CurrencyRateRoute()
      : super(
          CurrencyRateRoute.name,
          path: '/currency-rate',
        );

  static const String name = 'CurrencyRateRoute';
}

/// generated route for
/// [_i9.Register]
class RegisterRoute extends _i37.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/Register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i10.Home]
class HomeRoute extends _i37.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i38.Key? key,
    required int index,
    int? pageIndex,
  }) : super(
          HomeRoute.name,
          path: '/Home',
          args: HomeRouteArgs(
            key: key,
            index: index,
            pageIndex: pageIndex,
          ),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.index,
    this.pageIndex,
  });

  final _i38.Key? key;

  final int index;

  final int? pageIndex;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, index: $index, pageIndex: $pageIndex}';
  }
}

/// generated route for
/// [_i11.DatabaseDetails]
class DatabaseDetailsRoute
    extends _i37.PageRouteInfo<DatabaseDetailsRouteArgs> {
  DatabaseDetailsRoute({
    _i38.Key? key,
    required _i39.DatabaseModel databaseData,
    required dynamic Function() onDataChanged,
  }) : super(
          DatabaseDetailsRoute.name,
          path: '/database-details',
          args: DatabaseDetailsRouteArgs(
            key: key,
            databaseData: databaseData,
            onDataChanged: onDataChanged,
          ),
        );

  static const String name = 'DatabaseDetailsRoute';
}

class DatabaseDetailsRouteArgs {
  const DatabaseDetailsRouteArgs({
    this.key,
    required this.databaseData,
    required this.onDataChanged,
  });

  final _i38.Key? key;

  final _i39.DatabaseModel databaseData;

  final dynamic Function() onDataChanged;

  @override
  String toString() {
    return 'DatabaseDetailsRouteArgs{key: $key, databaseData: $databaseData, onDataChanged: $onDataChanged}';
  }
}

/// generated route for
/// [_i12.AddDatabase]
class AddDatabaseRoute extends _i37.PageRouteInfo<void> {
  const AddDatabaseRoute()
      : super(
          AddDatabaseRoute.name,
          path: '/add-database',
        );

  static const String name = 'AddDatabaseRoute';
}

/// generated route for
/// [_i13.AddTransaction]
class AddTransactionRoute extends _i37.PageRouteInfo<AddTransactionRouteArgs> {
  AddTransactionRoute({
    _i38.Key? key,
    required _i40.TransactionModel? model,
  }) : super(
          AddTransactionRoute.name,
          path: '/add-transaction',
          args: AddTransactionRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'AddTransactionRoute';
}

class AddTransactionRouteArgs {
  const AddTransactionRouteArgs({
    this.key,
    required this.model,
  });

  final _i38.Key? key;

  final _i40.TransactionModel? model;

  @override
  String toString() {
    return 'AddTransactionRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i14.TransactionDetails]
class TransactionDetailsRoute
    extends _i37.PageRouteInfo<TransactionDetailsRouteArgs> {
  TransactionDetailsRoute({
    _i38.Key? key,
    required _i41.AddTransactionModel model,
  }) : super(
          TransactionDetailsRoute.name,
          path: '/transaction-details',
          args: TransactionDetailsRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'TransactionDetailsRoute';
}

class TransactionDetailsRouteArgs {
  const TransactionDetailsRouteArgs({
    this.key,
    required this.model,
  });

  final _i38.Key? key;

  final _i41.AddTransactionModel model;

  @override
  String toString() {
    return 'TransactionDetailsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i15.BMICalculator]
class BMICalculatorRoute extends _i37.PageRouteInfo<void> {
  const BMICalculatorRoute()
      : super(
          BMICalculatorRoute.name,
          path: '/b-mi-calculator',
        );

  static const String name = 'BMICalculatorRoute';
}

/// generated route for
/// [_i16.ChangeCurrency]
class ChangeCurrencyRoute extends _i37.PageRouteInfo<void> {
  const ChangeCurrencyRoute()
      : super(
          ChangeCurrencyRoute.name,
          path: '/change-currency',
        );

  static const String name = 'ChangeCurrencyRoute';
}

/// generated route for
/// [_i17.Shopping]
class ShoppingRoute extends _i37.PageRouteInfo<void> {
  const ShoppingRoute()
      : super(
          ShoppingRoute.name,
          path: '/Shopping',
        );

  static const String name = 'ShoppingRoute';
}

/// generated route for
/// [_i18.Target]
class TargetRoute extends _i37.PageRouteInfo<void> {
  const TargetRoute()
      : super(
          TargetRoute.name,
          path: '/Target',
        );

  static const String name = 'TargetRoute';
}

/// generated route for
/// [_i19.CashTransactions]
class CashTransactionsRoute extends _i37.PageRouteInfo<void> {
  const CashTransactionsRoute()
      : super(
          CashTransactionsRoute.name,
          path: '/cash-transactions',
        );

  static const String name = 'CashTransactionsRoute';
}

/// generated route for
/// [_i20.RepeatedTransactions]
class RepeatedTransactionsRoute extends _i37.PageRouteInfo<void> {
  const RepeatedTransactionsRoute()
      : super(
          RepeatedTransactionsRoute.name,
          path: '/repeated-transactions',
        );

  static const String name = 'RepeatedTransactionsRoute';
}

/// generated route for
/// [_i21.Expense]
class ExpenseRoute extends _i37.PageRouteInfo<void> {
  const ExpenseRoute()
      : super(
          ExpenseRoute.name,
          path: '/Expense',
        );

  static const String name = 'ExpenseRoute';
}

/// generated route for
/// [_i22.BalanceTransfer]
class BalanceTransferRoute extends _i37.PageRouteInfo<void> {
  const BalanceTransferRoute()
      : super(
          BalanceTransferRoute.name,
          path: '/balance-transfer',
        );

  static const String name = 'BalanceTransferRoute';
}

/// generated route for
/// [_i23.AddWallet]
class AddWalletRoute extends _i37.PageRouteInfo<AddWalletRouteArgs> {
  AddWalletRoute({
    _i38.Key? key,
    required int selectItemIndex,
  }) : super(
          AddWalletRoute.name,
          path: '/add-wallet',
          args: AddWalletRouteArgs(
            key: key,
            selectItemIndex: selectItemIndex,
          ),
        );

  static const String name = 'AddWalletRoute';
}

class AddWalletRouteArgs {
  const AddWalletRouteArgs({
    this.key,
    required this.selectItemIndex,
  });

  final _i38.Key? key;

  final int selectItemIndex;

  @override
  String toString() {
    return 'AddWalletRouteArgs{key: $key, selectItemIndex: $selectItemIndex}';
  }
}

/// generated route for
/// [_i24.Statistics]
class StatisticsRoute extends _i37.PageRouteInfo<StatisticsRouteArgs> {
  StatisticsRoute({
    _i38.Key? key,
    required String option,
  }) : super(
          StatisticsRoute.name,
          path: '/Statistics',
          args: StatisticsRouteArgs(
            key: key,
            option: option,
          ),
        );

  static const String name = 'StatisticsRoute';
}

class StatisticsRouteArgs {
  const StatisticsRouteArgs({
    this.key,
    required this.option,
  });

  final _i38.Key? key;

  final String option;

  @override
  String toString() {
    return 'StatisticsRouteArgs{key: $key, option: $option}';
  }
}

/// generated route for
/// [_i25.Wallet]
class WalletRoute extends _i37.PageRouteInfo<void> {
  const WalletRoute()
      : super(
          WalletRoute.name,
          path: '/Wallet',
        );

  static const String name = 'WalletRoute';
}

/// generated route for
/// [_i26.EditWallet]
class EditWalletRoute extends _i37.PageRouteInfo<EditWalletRouteArgs> {
  EditWalletRoute({
    _i38.Key? key,
    required _i42.WalletModel model,
  }) : super(
          EditWalletRoute.name,
          path: '/edit-wallet',
          args: EditWalletRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'EditWalletRoute';
}

class EditWalletRouteArgs {
  const EditWalletRouteArgs({
    this.key,
    required this.model,
  });

  final _i38.Key? key;

  final _i42.WalletModel model;

  @override
  String toString() {
    return 'EditWalletRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i27.BalanceWithdrawal]
class BalanceWithdrawalRoute
    extends _i37.PageRouteInfo<BalanceWithdrawalRouteArgs> {
  BalanceWithdrawalRoute({
    _i38.Key? key,
    required _i42.WalletModel model,
  }) : super(
          BalanceWithdrawalRoute.name,
          path: '/balance-withdrawal',
          args: BalanceWithdrawalRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'BalanceWithdrawalRoute';
}

class BalanceWithdrawalRouteArgs {
  const BalanceWithdrawalRouteArgs({
    this.key,
    required this.model,
  });

  final _i38.Key? key;

  final _i42.WalletModel model;

  @override
  String toString() {
    return 'BalanceWithdrawalRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i28.AddBalance]
class AddBalanceRoute extends _i37.PageRouteInfo<AddBalanceRouteArgs> {
  AddBalanceRoute({
    _i38.Key? key,
    required _i42.WalletModel model,
  }) : super(
          AddBalanceRoute.name,
          path: '/add-balance',
          args: AddBalanceRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'AddBalanceRoute';
}

class AddBalanceRouteArgs {
  const AddBalanceRouteArgs({
    this.key,
    required this.model,
  });

  final _i38.Key? key;

  final _i42.WalletModel model;

  @override
  String toString() {
    return 'AddBalanceRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i29.ToolsHelper]
class ToolsHelperRoute extends _i37.PageRouteInfo<void> {
  const ToolsHelperRoute()
      : super(
          ToolsHelperRoute.name,
          path: '/tools-helper',
        );

  static const String name = 'ToolsHelperRoute';
}

/// generated route for
/// [_i30.AddTransactionBudget]
class AddTransactionBudgetRoute extends _i37.PageRouteInfo<void> {
  const AddTransactionBudgetRoute()
      : super(
          AddTransactionBudgetRoute.name,
          path: '/add-transaction-budget',
        );

  static const String name = 'AddTransactionBudgetRoute';
}

/// generated route for
/// [_i31.WalletTransactions]
class WalletTransactionsRoute
    extends _i37.PageRouteInfo<WalletTransactionsRouteArgs> {
  WalletTransactionsRoute({
    _i38.Key? key,
    required _i42.WalletModel model,
  }) : super(
          WalletTransactionsRoute.name,
          path: '/wallet-transactions',
          args: WalletTransactionsRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'WalletTransactionsRoute';
}

class WalletTransactionsRouteArgs {
  const WalletTransactionsRouteArgs({
    this.key,
    required this.model,
  });

  final _i38.Key? key;

  final _i42.WalletModel model;

  @override
  String toString() {
    return 'WalletTransactionsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i32.TransferWalletTransaction]
class TransferWalletTransactionRoute
    extends _i37.PageRouteInfo<TransferWalletTransactionRouteArgs> {
  TransferWalletTransactionRoute({
    _i38.Key? key,
    required _i41.AddTransactionModel model,
  }) : super(
          TransferWalletTransactionRoute.name,
          path: '/transfer-wallet-transaction',
          args: TransferWalletTransactionRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'TransferWalletTransactionRoute';
}

class TransferWalletTransactionRouteArgs {
  const TransferWalletTransactionRouteArgs({
    this.key,
    required this.model,
  });

  final _i38.Key? key;

  final _i41.AddTransactionModel model;

  @override
  String toString() {
    return 'TransferWalletTransactionRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i33.WalletBalanceTransfer]
class WalletBalanceTransferRoute
    extends _i37.PageRouteInfo<WalletBalanceTransferRouteArgs> {
  WalletBalanceTransferRoute({
    _i38.Key? key,
    required _i42.WalletModel model,
  }) : super(
          WalletBalanceTransferRoute.name,
          path: '/wallet-balance-transfer',
          args: WalletBalanceTransferRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'WalletBalanceTransferRoute';
}

class WalletBalanceTransferRouteArgs {
  const WalletBalanceTransferRouteArgs({
    this.key,
    required this.model,
  });

  final _i38.Key? key;

  final _i42.WalletModel model;

  @override
  String toString() {
    return 'WalletBalanceTransferRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i34.Bag]
class BagRoute extends _i37.PageRouteInfo<void> {
  const BagRoute()
      : super(
          BagRoute.name,
          path: '/Bag',
        );

  static const String name = 'BagRoute';
}

/// generated route for
/// [_i35.TransactionType]
class TransactionTypeRoute extends _i37.PageRouteInfo<void> {
  const TransactionTypeRoute()
      : super(
          TransactionTypeRoute.name,
          path: '/transaction-type',
        );

  static const String name = 'TransactionTypeRoute';
}

/// generated route for
/// [_i36.WalletCategory]
class WalletCategoryRoute extends _i37.PageRouteInfo<void> {
  const WalletCategoryRoute()
      : super(
          WalletCategoryRoute.name,
          path: '/wallet-category',
        );

  static const String name = 'WalletCategoryRoute';
}
