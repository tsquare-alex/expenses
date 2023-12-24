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
<<<<<<< HEAD
import 'package:auto_route/auto_route.dart' as _i25;
=======
import 'package:auto_route/auto_route.dart' as _i33;
>>>>>>> development
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
    as _i37;
import 'package:expenses/user/models/database_model/database_model.dart'
<<<<<<< HEAD
    as _i27;
=======
    as _i35;
import 'package:expenses/user/models/transaction_model/transaction_model.dart'
    as _i36;
>>>>>>> development
import 'package:expenses/user/screens/add_transaction/add_transaction_imports.dart'
    as _i13;
import 'package:expenses/user/screens/bmi_calculator/bmi_calculator_imports.dart'
<<<<<<< HEAD
    as _i14;
import 'package:expenses/user/screens/budget/widget/add_transaction.dart'
=======
    as _i17;
import 'package:expenses/user/screens/budget/widget/add_transaction.dart'
    as _i32;
import 'package:expenses/user/screens/cash_transactions/cash_transactions_imports.dart'
>>>>>>> development
    as _i21;
import 'package:expenses/user/screens/cash_transactions/cash_transactions_imports.dart'
    as _i19;
import 'package:expenses/user/screens/change_currency/change_currency_imports.dart'
<<<<<<< HEAD
    as _i15;
import 'package:expenses/user/screens/commitments/commitments_imports.dart'
    as _i16;
=======
    as _i18;
>>>>>>> development
import 'package:expenses/user/screens/database/widgets/add_database.dart'
    as _i12;
import 'package:expenses/user/screens/database/widgets/database_details.dart'
    as _i11;
import 'package:expenses/user/screens/expense/expense_imports.dart' as _i23;
import 'package:expenses/user/screens/home/home_imports.dart' as _i10;
<<<<<<< HEAD
import 'package:expenses/user/screens/recurring_transactions/recurring_transactions_imports.dart'
    as _i20;
import 'package:expenses/user/screens/shopping/shopping_imports.dart' as _i17;
import 'package:expenses/user/screens/target/target_imports.dart' as _i18;
import 'package:expenses/user/screens/tools_helper/tools_helper.dart' as _i24;
import 'package:expenses/user/screens/wallet/widgets/add_wallet.dart' as _i23;
import 'package:expenses/user/screens/wallet/widgets/balance_transfer.dart'
    as _i22;
import 'package:flutter/material.dart' as _i26;

class AppRouter extends _i25.RootStackRouter {
  AppRouter([_i26.GlobalKey<_i26.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i25.AdaptivePage<dynamic>(
=======
import 'package:expenses/user/screens/repeated_transactions/repeated_transactions_imports.dart'
    as _i22;
import 'package:expenses/user/screens/reports/statistics/statistics_imports.dart'
    as _i26;
import 'package:expenses/user/screens/shopping/shopping_imports.dart' as _i19;
import 'package:expenses/user/screens/target/target_imports.dart' as _i20;
import 'package:expenses/user/screens/tools_helper/tools_helper.dart' as _i31;
import 'package:expenses/user/screens/tools_helper/widgets/arena_converter/arena_converter.dart'
    as _i16;
import 'package:expenses/user/screens/tools_helper/widgets/qiblah/compass.dart'
    as _i13;
import 'package:expenses/user/screens/transaction_details/transaction_details_imports.dart'
    as _i15;
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart'
    as _i38;
import 'package:expenses/user/screens/wallet/wallet_imports.dart' as _i27;
import 'package:expenses/user/screens/wallet/widgets/add_balance.dart' as _i30;
import 'package:expenses/user/screens/wallet/widgets/add_wallet.dart' as _i25;
import 'package:expenses/user/screens/wallet/widgets/balance_transfer.dart'
    as _i24;
import 'package:expenses/user/screens/wallet/widgets/balance_withdrawal.dart'
    as _i29;
import 'package:expenses/user/screens/wallet/widgets/edit_Wallet.dart' as _i28;
import 'package:flutter/material.dart' as _i34;

class AppRouter extends _i33.RootStackRouter {
  AppRouter([_i34.GlobalKey<_i34.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i33.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: _i1.Splash(navigatorKey: args.navigatorKey),
        opaque: true,
      );
    },
    WelcomePageRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: const _i2.WelcomePage(),
        opaque: true,
      );
    },
    SelectLanguageRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.SelectLanguage(),
        transitionsBuilder: _i25.TransitionsBuilders.fadeIn,
=======
      return _i33.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.SelectLanguage(),
        transitionsBuilder: _i33.TransitionsBuilders.fadeIn,
>>>>>>> development
        durationInMilliseconds: 1500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.CustomPage<dynamic>(
=======
      return _i33.CustomPage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: const _i4.Login(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ForgetPasswordRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: const _i5.ForgetPassword(),
        opaque: true,
      );
    },
    SelectCountryRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: const _i6.SelectCountry(),
        opaque: true,
      );
    },
    SelectCurrencyRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: const _i7.SelectCurrency(),
        opaque: true,
      );
    },
    CurrencyRateRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: const _i8.CurrencyRate(),
        opaque: true,
      );
    },
    RegisterRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: const _i9.Register(),
        opaque: true,
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
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
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
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
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: _i12.AddDatabase(),
        opaque: true,
      );
    },
<<<<<<< HEAD
    AddTransactionRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.AddTransaction(),
        opaque: true,
      );
    },
    BMICalculatorRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.BMICalculator(),
        opaque: true,
      );
    },
    ChangeCurrencyRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.ChangeCurrency(),
        opaque: true,
      );
    },
    CommitmentsRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.Commitments(),
=======
    QiblahCompassWidgetRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i13.QiblahCompassWidget(),
        opaque: true,
      );
    },
    AddTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<AddTransactionRouteArgs>();
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i14.AddTransaction(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    TransactionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionDetailsRouteArgs>();
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i15.TransactionDetails(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    AreaConverterRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i16.AreaConverter(),
        opaque: true,
      );
    },
    BMICalculatorRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.BMICalculator(),
        opaque: true,
      );
    },
    ChangeCurrencyRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.ChangeCurrency(),
>>>>>>> development
        opaque: true,
      );
    },
    ShoppingRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: const _i17.Shopping(),
        opaque: true,
      );
    },
    TargetRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: const _i18.Target(),
        opaque: true,
      );
    },
    CashTransactionsRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: const _i19.CashTransactions(),
        opaque: true,
      );
    },
<<<<<<< HEAD
    RecurringTransactionsRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.RecurringTransactions(),
        opaque: true,
      );
    },
    AddTransactionBudgetRoute.name: (routeData) {
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i21.AddTransactionBudget(),
=======
    RepeatedTransactionsRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i22.RepeatedTransactions(),
        opaque: true,
      );
    },
    ExpenseRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i23.Expense(),
>>>>>>> development
        opaque: true,
      );
    },
    BalanceTransferRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: const _i22.BalanceTransfer(),
        opaque: true,
      );
    },
    AddWalletRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
=======
      return _i33.AdaptivePage<dynamic>(
>>>>>>> development
        routeData: routeData,
        child: const _i23.AddWallet(),
        opaque: true,
      );
    },
    StatisticsRoute.name: (routeData) {
      final args = routeData.argsAs<StatisticsRouteArgs>();
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i26.Statistics(
          key: args.key,
          option: args.option,
        ),
        opaque: true,
      );
    },
    WalletRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i27.Wallet(),
        opaque: true,
      );
    },
    EditWalletRoute.name: (routeData) {
      final args = routeData.argsAs<EditWalletRouteArgs>();
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i28.EditWallet(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    BalanceWithdrawalRoute.name: (routeData) {
      final args = routeData.argsAs<BalanceWithdrawalRouteArgs>();
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i29.BalanceWithdrawal(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    AddBalanceRoute.name: (routeData) {
      final args = routeData.argsAs<AddBalanceRouteArgs>();
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i30.AddBalance(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    ToolsHelperRoute.name: (routeData) {
<<<<<<< HEAD
      return _i25.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i24.ToolsHelper(),
=======
      final args = routeData.argsAs<ToolsHelperRouteArgs>(
          orElse: () => const ToolsHelperRouteArgs());
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i31.ToolsHelper(key: args.key),
        opaque: true,
      );
    },
    AddTransactionBudgetRoute.name: (routeData) {
      return _i33.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i32.AddTransactionBudget(),
>>>>>>> development
        opaque: true,
      );
    },
  };

  @override
<<<<<<< HEAD
  List<_i25.RouteConfig> get routes => [
        _i25.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i25.RouteConfig(
          WelcomePageRoute.name,
          path: '/welcome-page',
        ),
        _i25.RouteConfig(
          SelectLanguageRoute.name,
          path: '/select-language',
        ),
        _i25.RouteConfig(
          LoginRoute.name,
          path: '/Login',
        ),
        _i25.RouteConfig(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        ),
        _i25.RouteConfig(
          SelectCountryRoute.name,
          path: '/select-country',
        ),
        _i25.RouteConfig(
          SelectCurrencyRoute.name,
          path: '/select-currency',
        ),
        _i25.RouteConfig(
          CurrencyRateRoute.name,
          path: '/currency-rate',
        ),
        _i25.RouteConfig(
          RegisterRoute.name,
          path: '/Register',
        ),
        _i25.RouteConfig(
          HomeRoute.name,
          path: '/Home',
        ),
        _i25.RouteConfig(
          DatabaseDetailsRoute.name,
          path: '/database-details',
        ),
        _i25.RouteConfig(
          AddDatabaseRoute.name,
          path: '/add-database',
        ),
        _i25.RouteConfig(
          AddTransactionRoute.name,
          path: '/add-transaction',
        ),
        _i25.RouteConfig(
          BMICalculatorRoute.name,
          path: '/b-mi-calculator',
        ),
        _i25.RouteConfig(
          ChangeCurrencyRoute.name,
          path: '/change-currency',
        ),
        _i25.RouteConfig(
          CommitmentsRoute.name,
          path: '/Commitments',
        ),
        _i25.RouteConfig(
          ShoppingRoute.name,
          path: '/Shopping',
        ),
        _i25.RouteConfig(
          TargetRoute.name,
          path: '/Target',
        ),
        _i25.RouteConfig(
          CashTransactionsRoute.name,
          path: '/cash-transactions',
        ),
        _i25.RouteConfig(
          RecurringTransactionsRoute.name,
          path: '/recurring-transactions',
        ),
        _i25.RouteConfig(
          AddTransactionBudgetRoute.name,
          path: '/add-transaction-budget',
        ),
        _i25.RouteConfig(
          BalanceTransferRoute.name,
          path: '/balance-transfer',
        ),
        _i25.RouteConfig(
          AddWalletRoute.name,
          path: '/add-wallet',
        ),
        _i25.RouteConfig(
          ToolsHelperRoute.name,
          path: '/tools-helper',
        ),
=======
  List<_i33.RouteConfig> get routes => [
        _i33.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i33.RouteConfig(
          WelcomePageRoute.name,
          path: '/welcome-page',
        ),
        _i33.RouteConfig(
          SelectLanguageRoute.name,
          path: '/select-language',
        ),
        _i33.RouteConfig(
          LoginRoute.name,
          path: '/Login',
        ),
        _i33.RouteConfig(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        ),
        _i33.RouteConfig(
          SelectCountryRoute.name,
          path: '/select-country',
        ),
        _i33.RouteConfig(
          SelectCurrencyRoute.name,
          path: '/select-currency',
        ),
        _i33.RouteConfig(
          CurrencyRateRoute.name,
          path: '/currency-rate',
        ),
        _i33.RouteConfig(
          RegisterRoute.name,
          path: '/Register',
        ),
        _i33.RouteConfig(
          HomeRoute.name,
          path: '/Home',
        ),
        _i33.RouteConfig(
          DatabaseDetailsRoute.name,
          path: '/database-details',
        ),
        _i33.RouteConfig(
          AddDatabaseRoute.name,
          path: '/add-database',
        ),
        _i33.RouteConfig(
          QiblahCompassWidgetRoute.name,
          path: '/qiblah-compass-widget',
        ),
        _i33.RouteConfig(
          AddTransactionRoute.name,
          path: '/add-transaction',
        ),
        _i33.RouteConfig(
          TransactionDetailsRoute.name,
          path: '/transaction-details',
        ),
        _i33.RouteConfig(
          AreaConverterRoute.name,
          path: '/area-converter',
        ),
        _i33.RouteConfig(
          BMICalculatorRoute.name,
          path: '/b-mi-calculator',
        ),
        _i33.RouteConfig(
          ChangeCurrencyRoute.name,
          path: '/change-currency',
        ),
        _i33.RouteConfig(
          ShoppingRoute.name,
          path: '/Shopping',
        ),
        _i33.RouteConfig(
          TargetRoute.name,
          path: '/Target',
        ),
        _i33.RouteConfig(
          CashTransactionsRoute.name,
          path: '/cash-transactions',
        ),
        _i33.RouteConfig(
          RepeatedTransactionsRoute.name,
          path: '/repeated-transactions',
        ),
        _i33.RouteConfig(
          ExpenseRoute.name,
          path: '/Expense',
        ),
        _i33.RouteConfig(
          BalanceTransferRoute.name,
          path: '/balance-transfer',
        ),
        _i33.RouteConfig(
          AddWalletRoute.name,
          path: '/add-wallet',
        ),
        _i33.RouteConfig(
          StatisticsRoute.name,
          path: '/Statistics',
        ),
        _i33.RouteConfig(
          WalletRoute.name,
          path: '/Wallet',
        ),
        _i33.RouteConfig(
          EditWalletRoute.name,
          path: '/edit-wallet',
        ),
        _i33.RouteConfig(
          BalanceWithdrawalRoute.name,
          path: '/balance-withdrawal',
        ),
        _i33.RouteConfig(
          AddBalanceRoute.name,
          path: '/add-balance',
        ),
        _i33.RouteConfig(
          ToolsHelperRoute.name,
          path: '/tools-helper',
        ),
        _i33.RouteConfig(
          AddTransactionBudgetRoute.name,
          path: '/add-transaction-budget',
        ),
>>>>>>> development
      ];
}

/// generated route for
/// [_i1.Splash]
<<<<<<< HEAD
class SplashRoute extends _i25.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i26.GlobalKey<_i26.NavigatorState> navigatorKey})
=======
class SplashRoute extends _i33.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i34.GlobalKey<_i34.NavigatorState> navigatorKey})
>>>>>>> development
      : super(
          SplashRoute.name,
          path: '/',
          args: SplashRouteArgs(navigatorKey: navigatorKey),
        );

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

<<<<<<< HEAD
  final _i26.GlobalKey<_i26.NavigatorState> navigatorKey;
=======
  final _i34.GlobalKey<_i34.NavigatorState> navigatorKey;
>>>>>>> development

  @override
  String toString() {
    return 'SplashRouteArgs{navigatorKey: $navigatorKey}';
  }
}

/// generated route for
/// [_i2.WelcomePage]
<<<<<<< HEAD
class WelcomePageRoute extends _i25.PageRouteInfo<void> {
=======
class WelcomePageRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const WelcomePageRoute()
      : super(
          WelcomePageRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomePageRoute';
}

/// generated route for
/// [_i3.SelectLanguage]
<<<<<<< HEAD
class SelectLanguageRoute extends _i25.PageRouteInfo<void> {
=======
class SelectLanguageRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const SelectLanguageRoute()
      : super(
          SelectLanguageRoute.name,
          path: '/select-language',
        );

  static const String name = 'SelectLanguageRoute';
}

/// generated route for
/// [_i4.Login]
<<<<<<< HEAD
class LoginRoute extends _i25.PageRouteInfo<void> {
=======
class LoginRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.ForgetPassword]
<<<<<<< HEAD
class ForgetPasswordRoute extends _i25.PageRouteInfo<void> {
=======
class ForgetPasswordRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const ForgetPasswordRoute()
      : super(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        );

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i6.SelectCountry]
<<<<<<< HEAD
class SelectCountryRoute extends _i25.PageRouteInfo<void> {
=======
class SelectCountryRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const SelectCountryRoute()
      : super(
          SelectCountryRoute.name,
          path: '/select-country',
        );

  static const String name = 'SelectCountryRoute';
}

/// generated route for
/// [_i7.SelectCurrency]
<<<<<<< HEAD
class SelectCurrencyRoute extends _i25.PageRouteInfo<void> {
=======
class SelectCurrencyRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const SelectCurrencyRoute()
      : super(
          SelectCurrencyRoute.name,
          path: '/select-currency',
        );

  static const String name = 'SelectCurrencyRoute';
}

/// generated route for
/// [_i8.CurrencyRate]
<<<<<<< HEAD
class CurrencyRateRoute extends _i25.PageRouteInfo<void> {
=======
class CurrencyRateRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const CurrencyRateRoute()
      : super(
          CurrencyRateRoute.name,
          path: '/currency-rate',
        );

  static const String name = 'CurrencyRateRoute';
}

/// generated route for
/// [_i9.Register]
<<<<<<< HEAD
class RegisterRoute extends _i25.PageRouteInfo<void> {
=======
class RegisterRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/Register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i10.Home]
<<<<<<< HEAD
class HomeRoute extends _i25.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i26.Key? key,
=======
class HomeRoute extends _i33.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i34.Key? key,
>>>>>>> development
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

<<<<<<< HEAD
  final _i26.Key? key;
=======
  final _i34.Key? key;
>>>>>>> development

  final int index;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i11.DatabaseDetails]
class DatabaseDetailsRoute
<<<<<<< HEAD
    extends _i25.PageRouteInfo<DatabaseDetailsRouteArgs> {
  DatabaseDetailsRoute({
    _i26.Key? key,
    required _i27.DatabaseModel databaseData,
    required dynamic Function() onDataChanged,
=======
    extends _i33.PageRouteInfo<DatabaseDetailsRouteArgs> {
  DatabaseDetailsRoute({
    _i34.Key? key,
    required _i35.DatabaseModel databaseData,
>>>>>>> development
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

<<<<<<< HEAD
  final _i26.Key? key;

  final _i27.DatabaseModel databaseData;

  final dynamic Function() onDataChanged;
=======
  final _i34.Key? key;

  final _i35.DatabaseModel databaseData;
>>>>>>> development

  @override
  String toString() {
    return 'DatabaseDetailsRouteArgs{key: $key, databaseData: $databaseData, onDataChanged: $onDataChanged}';
  }
}

/// generated route for
/// [_i12.AddDatabase]
<<<<<<< HEAD
class AddDatabaseRoute extends _i25.PageRouteInfo<void> {
=======
class AddDatabaseRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const AddDatabaseRoute()
      : super(
          AddDatabaseRoute.name,
          path: '/add-database',
        );

  static const String name = 'AddDatabaseRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i13.AddTransaction]
class AddTransactionRoute extends _i25.PageRouteInfo<void> {
  const AddTransactionRoute()
      : super(
=======
/// [_i13.QiblahCompassWidget]
class QiblahCompassWidgetRoute extends _i33.PageRouteInfo<void> {
  const QiblahCompassWidgetRoute()
      : super(
          QiblahCompassWidgetRoute.name,
          path: '/qiblah-compass-widget',
        );

  static const String name = 'QiblahCompassWidgetRoute';
}

/// generated route for
/// [_i14.AddTransaction]
class AddTransactionRoute extends _i33.PageRouteInfo<AddTransactionRouteArgs> {
  AddTransactionRoute({
    _i34.Key? key,
    required _i36.TransactionModel? model,
  }) : super(
>>>>>>> development
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

  final _i34.Key? key;

  final _i36.TransactionModel? model;

  @override
  String toString() {
    return 'AddTransactionRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i15.TransactionDetails]
class TransactionDetailsRoute
    extends _i33.PageRouteInfo<TransactionDetailsRouteArgs> {
  TransactionDetailsRoute({
    _i34.Key? key,
    required _i37.AddTransactionModel model,
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

  final _i34.Key? key;

  final _i37.AddTransactionModel model;

  @override
  String toString() {
    return 'TransactionDetailsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
<<<<<<< HEAD
/// [_i14.BMICalculator]
class BMICalculatorRoute extends _i25.PageRouteInfo<void> {
=======
/// [_i16.AreaConverter]
class AreaConverterRoute extends _i33.PageRouteInfo<void> {
  const AreaConverterRoute()
      : super(
          AreaConverterRoute.name,
          path: '/area-converter',
        );

  static const String name = 'AreaConverterRoute';
}

/// generated route for
/// [_i17.BMICalculator]
class BMICalculatorRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const BMICalculatorRoute()
      : super(
          BMICalculatorRoute.name,
          path: '/b-mi-calculator',
        );

  static const String name = 'BMICalculatorRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i15.ChangeCurrency]
class ChangeCurrencyRoute extends _i25.PageRouteInfo<void> {
=======
/// [_i18.ChangeCurrency]
class ChangeCurrencyRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const ChangeCurrencyRoute()
      : super(
          ChangeCurrencyRoute.name,
          path: '/change-currency',
        );

  static const String name = 'ChangeCurrencyRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i16.Commitments]
class CommitmentsRoute extends _i25.PageRouteInfo<void> {
  const CommitmentsRoute()
      : super(
          CommitmentsRoute.name,
          path: '/Commitments',
        );

  static const String name = 'CommitmentsRoute';
}

/// generated route for
/// [_i17.Shopping]
class ShoppingRoute extends _i25.PageRouteInfo<void> {
=======
/// [_i19.Shopping]
class ShoppingRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const ShoppingRoute()
      : super(
          ShoppingRoute.name,
          path: '/Shopping',
        );

  static const String name = 'ShoppingRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i18.Target]
class TargetRoute extends _i25.PageRouteInfo<void> {
=======
/// [_i20.Target]
class TargetRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const TargetRoute()
      : super(
          TargetRoute.name,
          path: '/Target',
        );

  static const String name = 'TargetRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i19.CashTransactions]
class CashTransactionsRoute extends _i25.PageRouteInfo<void> {
=======
/// [_i21.CashTransactions]
class CashTransactionsRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const CashTransactionsRoute()
      : super(
          CashTransactionsRoute.name,
          path: '/cash-transactions',
        );

  static const String name = 'CashTransactionsRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i20.RecurringTransactions]
class RecurringTransactionsRoute extends _i25.PageRouteInfo<void> {
  const RecurringTransactionsRoute()
=======
/// [_i22.RepeatedTransactions]
class RepeatedTransactionsRoute extends _i33.PageRouteInfo<void> {
  const RepeatedTransactionsRoute()
>>>>>>> development
      : super(
          RepeatedTransactionsRoute.name,
          path: '/repeated-transactions',
        );

  static const String name = 'RepeatedTransactionsRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i21.AddTransactionBudget]
class AddTransactionBudgetRoute extends _i25.PageRouteInfo<void> {
  const AddTransactionBudgetRoute()
=======
/// [_i23.Expense]
class ExpenseRoute extends _i33.PageRouteInfo<void> {
  const ExpenseRoute()
>>>>>>> development
      : super(
          ExpenseRoute.name,
          path: '/Expense',
        );

  static const String name = 'ExpenseRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i22.BalanceTransfer]
class BalanceTransferRoute extends _i25.PageRouteInfo<void> {
=======
/// [_i24.BalanceTransfer]
class BalanceTransferRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const BalanceTransferRoute()
      : super(
          BalanceTransferRoute.name,
          path: '/balance-transfer',
        );

  static const String name = 'BalanceTransferRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i23.AddWallet]
class AddWalletRoute extends _i25.PageRouteInfo<void> {
=======
/// [_i25.AddWallet]
class AddWalletRoute extends _i33.PageRouteInfo<void> {
>>>>>>> development
  const AddWalletRoute()
      : super(
          AddWalletRoute.name,
          path: '/add-wallet',
        );

  static const String name = 'AddWalletRoute';
}

/// generated route for
<<<<<<< HEAD
/// [_i24.ToolsHelper]
class ToolsHelperRoute extends _i25.PageRouteInfo<void> {
  const ToolsHelperRoute()
=======
/// [_i26.Statistics]
class StatisticsRoute extends _i33.PageRouteInfo<StatisticsRouteArgs> {
  StatisticsRoute({
    _i34.Key? key,
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

  final _i34.Key? key;

  final String option;

  @override
  String toString() {
    return 'StatisticsRouteArgs{key: $key, option: $option}';
  }
}

/// generated route for
/// [_i27.Wallet]
class WalletRoute extends _i33.PageRouteInfo<void> {
  const WalletRoute()
      : super(
          WalletRoute.name,
          path: '/Wallet',
        );

  static const String name = 'WalletRoute';
}

/// generated route for
/// [_i28.EditWallet]
class EditWalletRoute extends _i33.PageRouteInfo<EditWalletRouteArgs> {
  EditWalletRoute({
    _i34.Key? key,
    required _i38.WalletModel model,
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

  final _i34.Key? key;

  final _i38.WalletModel model;

  @override
  String toString() {
    return 'EditWalletRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i29.BalanceWithdrawal]
class BalanceWithdrawalRoute
    extends _i33.PageRouteInfo<BalanceWithdrawalRouteArgs> {
  BalanceWithdrawalRoute({
    _i34.Key? key,
    required _i38.WalletModel model,
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

  final _i34.Key? key;

  final _i38.WalletModel model;

  @override
  String toString() {
    return 'BalanceWithdrawalRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i30.AddBalance]
class AddBalanceRoute extends _i33.PageRouteInfo<AddBalanceRouteArgs> {
  AddBalanceRoute({
    _i34.Key? key,
    required _i38.WalletModel model,
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

  final _i34.Key? key;

  final _i38.WalletModel model;

  @override
  String toString() {
    return 'AddBalanceRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i31.ToolsHelper]
class ToolsHelperRoute extends _i33.PageRouteInfo<ToolsHelperRouteArgs> {
  ToolsHelperRoute({_i34.Key? key})
>>>>>>> development
      : super(
          ToolsHelperRoute.name,
          path: '/tools-helper',
        );

  static const String name = 'ToolsHelperRoute';
}
<<<<<<< HEAD
=======

class ToolsHelperRouteArgs {
  const ToolsHelperRouteArgs({this.key});

  final _i34.Key? key;

  @override
  String toString() {
    return 'ToolsHelperRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i32.AddTransactionBudget]
class AddTransactionBudgetRoute extends _i33.PageRouteInfo<void> {
  const AddTransactionBudgetRoute()
      : super(
          AddTransactionBudgetRoute.name,
          path: '/add-transaction-budget',
        );

  static const String name = 'AddTransactionBudgetRoute';
}
>>>>>>> development
