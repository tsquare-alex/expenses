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
import 'package:auto_route/auto_route.dart' as _i32;
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
import 'package:expenses/user/models/database_model/database_model.dart'
    as _i34;
import 'package:expenses/user/screens/add_transaction/add_transaction_imports.dart'
    as _i14;
import 'package:expenses/user/screens/bmi_calculator/bmi_calculator_imports.dart'
    as _i16;
import 'package:expenses/user/screens/budget/widget/add_budget_item.dart'
    as _i31;
import 'package:expenses/user/screens/budget/widget/add_transaction.dart'
    as _i23;
import 'package:expenses/user/screens/cash_transactions/cash_transactions_imports.dart'
    as _i21;
import 'package:expenses/user/screens/change_currency/change_currency_imports.dart'
    as _i17;
import 'package:expenses/user/screens/commitments/commitments_imports.dart'
    as _i18;
import 'package:expenses/user/screens/database/widgets/add_database.dart'
    as _i12;
import 'package:expenses/user/screens/database/widgets/database_details.dart'
    as _i11;
import 'package:expenses/user/screens/home/home_imports.dart' as _i10;
import 'package:expenses/user/screens/recurring_transactions/recurring_transactions_imports.dart'
    as _i22;
import 'package:expenses/user/screens/shopping/shopping_imports.dart' as _i19;
import 'package:expenses/user/screens/target/target_imports.dart' as _i20;
import 'package:expenses/user/screens/tools_helper/tools_helper.dart' as _i30;
import 'package:expenses/user/screens/tools_helper/widgets/arena_converter/arena_converter.dart'
    as _i15;
import 'package:expenses/user/screens/tools_helper/widgets/qiblah/compass.dart'
    as _i13;
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart'
    as _i35;
import 'package:expenses/user/screens/wallet/wallet_imports.dart' as _i26;
import 'package:expenses/user/screens/wallet/widgets/add_balance.dart' as _i29;
import 'package:expenses/user/screens/wallet/widgets/add_wallet.dart' as _i25;
import 'package:expenses/user/screens/wallet/widgets/balance_transfer.dart'
    as _i24;
import 'package:expenses/user/screens/wallet/widgets/balance_withdrawal.dart'
    as _i28;
import 'package:expenses/user/screens/wallet/widgets/edit_Wallet.dart' as _i27;
import 'package:flutter/material.dart' as _i33;

class AppRouter extends _i32.RootStackRouter {
  AppRouter([_i33.GlobalKey<_i33.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i32.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.Splash(navigatorKey: args.navigatorKey),
        opaque: true,
      );
    },
    WelcomePageRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
        opaque: true,
      );
    },
    SelectLanguageRoute.name: (routeData) {
      return _i32.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.SelectLanguage(),
        transitionsBuilder: _i32.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i32.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.Login(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgetPassword(),
        opaque: true,
      );
    },
    SelectCountryRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.SelectCountry(),
        opaque: true,
      );
    },
    SelectCurrencyRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.SelectCurrency(),
        opaque: true,
      );
    },
    CurrencyRateRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.CurrencyRate(),
        opaque: true,
      );
    },
    RegisterRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.Register(),
        opaque: true,
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i10.Home(
          key: args.key,
          index: args.index,
        ),
        opaque: true,
      );
    },
    DatabaseDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DatabaseDetailsRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.DatabaseDetails(
          key: args.key,
          databaseData: args.databaseData,
        ),
        opaque: true,
      );
    },
    AddDatabaseRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i12.AddDatabase(),
        opaque: true,
      );
    },
    QiblahCompassWidgetRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i13.QiblahCompassWidget(),
        opaque: true,
      );
    },
    AddTransactionRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.AddTransaction(),
        opaque: true,
      );
    },
    AreaConverterRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i15.AreaConverter(),
        opaque: true,
      );
    },
    BMICalculatorRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.BMICalculator(),
        opaque: true,
      );
    },
    ChangeCurrencyRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.ChangeCurrency(),
        opaque: true,
      );
    },
    CommitmentsRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.Commitments(),
        opaque: true,
      );
    },
    ShoppingRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.Shopping(),
        opaque: true,
      );
    },
    TargetRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.Target(),
        opaque: true,
      );
    },
    CashTransactionsRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i21.CashTransactions(),
        opaque: true,
      );
    },
    RecurringTransactionsRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i22.RecurringTransactions(),
        opaque: true,
      );
    },
    AddTransactionBudgetRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i23.AddTransactionBudget(),
        opaque: true,
      );
    },
    BalanceTransferRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i24.BalanceTransfer(),
        opaque: true,
      );
    },
    AddWalletRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i25.AddWallet(),
        opaque: true,
      );
    },
    WalletRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i26.Wallet(),
        opaque: true,
      );
    },
    EditWalletRoute.name: (routeData) {
      final args = routeData.argsAs<EditWalletRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i27.EditWallet(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    BalanceWithdrawalRoute.name: (routeData) {
      final args = routeData.argsAs<BalanceWithdrawalRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i28.BalanceWithdrawal(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    AddBalanceRoute.name: (routeData) {
      final args = routeData.argsAs<AddBalanceRouteArgs>();
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i29.AddBalance(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    ToolsHelperRoute.name: (routeData) {
      final args = routeData.argsAs<ToolsHelperRouteArgs>(
          orElse: () => const ToolsHelperRouteArgs());
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i30.ToolsHelper(key: args.key),
        opaque: true,
      );
    },
    AddBudgetItemRoute.name: (routeData) {
      return _i32.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i31.AddBudgetItem(),
        opaque: true,
      );
    },
  };

  @override
  List<_i32.RouteConfig> get routes => [
        _i32.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i32.RouteConfig(
          WelcomePageRoute.name,
          path: '/welcome-page',
        ),
        _i32.RouteConfig(
          SelectLanguageRoute.name,
          path: '/select-language',
        ),
        _i32.RouteConfig(
          LoginRoute.name,
          path: '/Login',
        ),
        _i32.RouteConfig(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        ),
        _i32.RouteConfig(
          SelectCountryRoute.name,
          path: '/select-country',
        ),
        _i32.RouteConfig(
          SelectCurrencyRoute.name,
          path: '/select-currency',
        ),
        _i32.RouteConfig(
          CurrencyRateRoute.name,
          path: '/currency-rate',
        ),
        _i32.RouteConfig(
          RegisterRoute.name,
          path: '/Register',
        ),
        _i32.RouteConfig(
          HomeRoute.name,
          path: '/Home',
        ),
        _i32.RouteConfig(
          DatabaseDetailsRoute.name,
          path: '/database-details',
        ),
        _i32.RouteConfig(
          AddDatabaseRoute.name,
          path: '/add-database',
        ),
        _i32.RouteConfig(
          QiblahCompassWidgetRoute.name,
          path: '/qiblah-compass-widget',
        ),
        _i32.RouteConfig(
          AddTransactionRoute.name,
          path: '/add-transaction',
        ),
        _i32.RouteConfig(
          AreaConverterRoute.name,
          path: '/area-converter',
        ),
        _i32.RouteConfig(
          BMICalculatorRoute.name,
          path: '/b-mi-calculator',
        ),
        _i32.RouteConfig(
          ChangeCurrencyRoute.name,
          path: '/change-currency',
        ),
        _i32.RouteConfig(
          CommitmentsRoute.name,
          path: '/Commitments',
        ),
        _i32.RouteConfig(
          ShoppingRoute.name,
          path: '/Shopping',
        ),
        _i32.RouteConfig(
          TargetRoute.name,
          path: '/Target',
        ),
        _i32.RouteConfig(
          CashTransactionsRoute.name,
          path: '/cash-transactions',
        ),
        _i32.RouteConfig(
          RecurringTransactionsRoute.name,
          path: '/recurring-transactions',
        ),
        _i32.RouteConfig(
          AddTransactionBudgetRoute.name,
          path: '/add-transaction-budget',
        ),
        _i32.RouteConfig(
          BalanceTransferRoute.name,
          path: '/balance-transfer',
        ),
        _i32.RouteConfig(
          AddWalletRoute.name,
          path: '/add-wallet',
        ),
        _i32.RouteConfig(
          WalletRoute.name,
          path: '/Wallet',
        ),
        _i32.RouteConfig(
          EditWalletRoute.name,
          path: '/edit-wallet',
        ),
        _i32.RouteConfig(
          BalanceWithdrawalRoute.name,
          path: '/balance-withdrawal',
        ),
        _i32.RouteConfig(
          AddBalanceRoute.name,
          path: '/add-balance',
        ),
        _i32.RouteConfig(
          ToolsHelperRoute.name,
          path: '/tools-helper',
        ),
        _i32.RouteConfig(
          AddBudgetItemRoute.name,
          path: '/add-budget-item',
        ),
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i32.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i33.GlobalKey<_i33.NavigatorState> navigatorKey})
      : super(
          SplashRoute.name,
          path: '/',
          args: SplashRouteArgs(navigatorKey: navigatorKey),
        );

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

  final _i33.GlobalKey<_i33.NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'SplashRouteArgs{navigatorKey: $navigatorKey}';
  }
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomePageRoute extends _i32.PageRouteInfo<void> {
  const WelcomePageRoute()
      : super(
          WelcomePageRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomePageRoute';
}

/// generated route for
/// [_i3.SelectLanguage]
class SelectLanguageRoute extends _i32.PageRouteInfo<void> {
  const SelectLanguageRoute()
      : super(
          SelectLanguageRoute.name,
          path: '/select-language',
        );

  static const String name = 'SelectLanguageRoute';
}

/// generated route for
/// [_i4.Login]
class LoginRoute extends _i32.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.ForgetPassword]
class ForgetPasswordRoute extends _i32.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        );

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i6.SelectCountry]
class SelectCountryRoute extends _i32.PageRouteInfo<void> {
  const SelectCountryRoute()
      : super(
          SelectCountryRoute.name,
          path: '/select-country',
        );

  static const String name = 'SelectCountryRoute';
}

/// generated route for
/// [_i7.SelectCurrency]
class SelectCurrencyRoute extends _i32.PageRouteInfo<void> {
  const SelectCurrencyRoute()
      : super(
          SelectCurrencyRoute.name,
          path: '/select-currency',
        );

  static const String name = 'SelectCurrencyRoute';
}

/// generated route for
/// [_i8.CurrencyRate]
class CurrencyRateRoute extends _i32.PageRouteInfo<void> {
  const CurrencyRateRoute()
      : super(
          CurrencyRateRoute.name,
          path: '/currency-rate',
        );

  static const String name = 'CurrencyRateRoute';
}

/// generated route for
/// [_i9.Register]
class RegisterRoute extends _i32.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/Register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i10.Home]
class HomeRoute extends _i32.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i33.Key? key,
    required int index,
  }) : super(
          HomeRoute.name,
          path: '/Home',
          args: HomeRouteArgs(
            key: key,
            index: index,
          ),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.index,
  });

  final _i33.Key? key;

  final int index;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i11.DatabaseDetails]
class DatabaseDetailsRoute
    extends _i32.PageRouteInfo<DatabaseDetailsRouteArgs> {
  DatabaseDetailsRoute({
    _i33.Key? key,
    required _i34.DatabaseModel databaseData,
  }) : super(
          DatabaseDetailsRoute.name,
          path: '/database-details',
          args: DatabaseDetailsRouteArgs(
            key: key,
            databaseData: databaseData,
          ),
        );

  static const String name = 'DatabaseDetailsRoute';
}

class DatabaseDetailsRouteArgs {
  const DatabaseDetailsRouteArgs({
    this.key,
    required this.databaseData,
  });

  final _i33.Key? key;

  final _i34.DatabaseModel databaseData;

  @override
  String toString() {
    return 'DatabaseDetailsRouteArgs{key: $key, databaseData: $databaseData}';
  }
}

/// generated route for
/// [_i12.AddDatabase]
class AddDatabaseRoute extends _i32.PageRouteInfo<void> {
  const AddDatabaseRoute()
      : super(
          AddDatabaseRoute.name,
          path: '/add-database',
        );

  static const String name = 'AddDatabaseRoute';
}

/// generated route for
/// [_i13.QiblahCompassWidget]
class QiblahCompassWidgetRoute extends _i32.PageRouteInfo<void> {
  const QiblahCompassWidgetRoute()
      : super(
          QiblahCompassWidgetRoute.name,
          path: '/qiblah-compass-widget',
        );

  static const String name = 'QiblahCompassWidgetRoute';
}

/// generated route for
/// [_i14.AddTransaction]
class AddTransactionRoute extends _i32.PageRouteInfo<void> {
  const AddTransactionRoute()
      : super(
          AddTransactionRoute.name,
          path: '/add-transaction',
        );

  static const String name = 'AddTransactionRoute';
}

/// generated route for
/// [_i15.AreaConverter]
class AreaConverterRoute extends _i32.PageRouteInfo<void> {
  const AreaConverterRoute()
      : super(
          AreaConverterRoute.name,
          path: '/area-converter',
        );

  static const String name = 'AreaConverterRoute';
}

/// generated route for
/// [_i16.BMICalculator]
class BMICalculatorRoute extends _i32.PageRouteInfo<void> {
  const BMICalculatorRoute()
      : super(
          BMICalculatorRoute.name,
          path: '/b-mi-calculator',
        );

  static const String name = 'BMICalculatorRoute';
}

/// generated route for
/// [_i17.ChangeCurrency]
class ChangeCurrencyRoute extends _i32.PageRouteInfo<void> {
  const ChangeCurrencyRoute()
      : super(
          ChangeCurrencyRoute.name,
          path: '/change-currency',
        );

  static const String name = 'ChangeCurrencyRoute';
}

/// generated route for
/// [_i18.Commitments]
class CommitmentsRoute extends _i32.PageRouteInfo<void> {
  const CommitmentsRoute()
      : super(
          CommitmentsRoute.name,
          path: '/Commitments',
        );

  static const String name = 'CommitmentsRoute';
}

/// generated route for
/// [_i19.Shopping]
class ShoppingRoute extends _i32.PageRouteInfo<void> {
  const ShoppingRoute()
      : super(
          ShoppingRoute.name,
          path: '/Shopping',
        );

  static const String name = 'ShoppingRoute';
}

/// generated route for
/// [_i20.Target]
class TargetRoute extends _i32.PageRouteInfo<void> {
  const TargetRoute()
      : super(
          TargetRoute.name,
          path: '/Target',
        );

  static const String name = 'TargetRoute';
}

/// generated route for
/// [_i21.CashTransactions]
class CashTransactionsRoute extends _i32.PageRouteInfo<void> {
  const CashTransactionsRoute()
      : super(
          CashTransactionsRoute.name,
          path: '/cash-transactions',
        );

  static const String name = 'CashTransactionsRoute';
}

/// generated route for
/// [_i22.RecurringTransactions]
class RecurringTransactionsRoute extends _i32.PageRouteInfo<void> {
  const RecurringTransactionsRoute()
      : super(
          RecurringTransactionsRoute.name,
          path: '/recurring-transactions',
        );

  static const String name = 'RecurringTransactionsRoute';
}

/// generated route for
/// [_i23.AddTransactionBudget]
class AddTransactionBudgetRoute extends _i32.PageRouteInfo<void> {
  const AddTransactionBudgetRoute()
      : super(
          AddTransactionBudgetRoute.name,
          path: '/add-transaction-budget',
        );

  static const String name = 'AddTransactionBudgetRoute';
}

/// generated route for
/// [_i24.BalanceTransfer]
class BalanceTransferRoute extends _i32.PageRouteInfo<void> {
  const BalanceTransferRoute()
      : super(
          BalanceTransferRoute.name,
          path: '/balance-transfer',
        );

  static const String name = 'BalanceTransferRoute';
}

/// generated route for
/// [_i25.AddWallet]
class AddWalletRoute extends _i32.PageRouteInfo<void> {
  const AddWalletRoute()
      : super(
          AddWalletRoute.name,
          path: '/add-wallet',
        );

  static const String name = 'AddWalletRoute';
}

/// generated route for
/// [_i26.Wallet]
class WalletRoute extends _i32.PageRouteInfo<void> {
  const WalletRoute()
      : super(
          WalletRoute.name,
          path: '/Wallet',
        );

  static const String name = 'WalletRoute';
}

/// generated route for
/// [_i27.EditWallet]
class EditWalletRoute extends _i32.PageRouteInfo<EditWalletRouteArgs> {
  EditWalletRoute({
    _i33.Key? key,
    required _i35.WalletModel model,
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

  final _i33.Key? key;

  final _i35.WalletModel model;

  @override
  String toString() {
    return 'EditWalletRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i28.BalanceWithdrawal]
class BalanceWithdrawalRoute
    extends _i32.PageRouteInfo<BalanceWithdrawalRouteArgs> {
  BalanceWithdrawalRoute({
    _i33.Key? key,
    required _i35.WalletModel model,
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

  final _i33.Key? key;

  final _i35.WalletModel model;

  @override
  String toString() {
    return 'BalanceWithdrawalRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i29.AddBalance]
class AddBalanceRoute extends _i32.PageRouteInfo<AddBalanceRouteArgs> {
  AddBalanceRoute({
    _i33.Key? key,
    required _i35.WalletModel model,
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

  final _i33.Key? key;

  final _i35.WalletModel model;

  @override
  String toString() {
    return 'AddBalanceRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i30.ToolsHelper]
class ToolsHelperRoute extends _i32.PageRouteInfo<ToolsHelperRouteArgs> {
  ToolsHelperRoute({_i33.Key? key})
      : super(
          ToolsHelperRoute.name,
          path: '/tools-helper',
          args: ToolsHelperRouteArgs(key: key),
        );

  static const String name = 'ToolsHelperRoute';
}

class ToolsHelperRouteArgs {
  const ToolsHelperRouteArgs({this.key});

  final _i33.Key? key;

  @override
  String toString() {
    return 'ToolsHelperRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i31.AddBudgetItem]
class AddBudgetItemRoute extends _i32.PageRouteInfo<void> {
  const AddBudgetItemRoute()
      : super(
          AddBudgetItemRoute.name,
          path: '/add-budget-item',
        );

  static const String name = 'AddBudgetItemRoute';
}
