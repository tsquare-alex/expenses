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
import 'package:auto_route/auto_route.dart' as _i22;
import 'package:expenses/general/models/data_base_model/data_base_model.dart'
    as _i24;
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
import 'package:expenses/user/screens/add_transaction/add_transaction_imports.dart'
    as _i13;
import 'package:expenses/user/screens/bmi_calculator/bmi_calculator_imports.dart'
    as _i14;
import 'package:expenses/user/screens/budget/widget/add_transaction.dart'
    as _i21;
import 'package:expenses/user/screens/cash_transactions/cash_transactions_imports.dart'
    as _i19;
import 'package:expenses/user/screens/change_currency/change_currency_imports.dart'
    as _i15;
import 'package:expenses/user/screens/commitments/commitments_imports.dart'
    as _i16;
import 'package:expenses/user/screens/database/widgets/add_database.dart'
    as _i12;
import 'package:expenses/user/screens/database/widgets/database_details.dart'
    as _i11;
import 'package:expenses/user/screens/home/home_imports.dart' as _i10;
import 'package:expenses/user/screens/recurring_transactions/recurring_transactions_imports.dart'
    as _i20;
import 'package:expenses/user/screens/shopping/shopping_imports.dart' as _i17;
import 'package:expenses/user/screens/target/target_imports.dart' as _i18;
import 'package:flutter/material.dart' as _i23;

class AppRouter extends _i22.RootStackRouter {
  AppRouter([_i23.GlobalKey<_i23.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i22.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.Splash(navigatorKey: args.navigatorKey),
        opaque: true,
      );
    },
    WelcomePageRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
        opaque: true,
      );
    },
    SelectLanguageRoute.name: (routeData) {
      return _i22.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.SelectLanguage(),
        transitionsBuilder: _i22.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i22.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.Login(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgetPassword(),
        opaque: true,
      );
    },
    SelectCountryRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.SelectCountry(),
        opaque: true,
      );
    },
    SelectCurrencyRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.SelectCurrency(),
        opaque: true,
      );
    },
    CurrencyRateRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.CurrencyRate(),
        opaque: true,
      );
    },
    RegisterRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.Register(),
        opaque: true,
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i22.AdaptivePage<dynamic>(
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
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.DatabaseDetails(
          key: args.key,
          databaseData: args.databaseData,
        ),
        opaque: true,
      );
    },
    AddDatabaseRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i12.AddDatabase(),
        opaque: true,
      );
    },
    AddTransactionRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i13.AddTransaction(),
        opaque: true,
      );
    },
    BMICalculatorRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.BMICalculator(),
        opaque: true,
      );
    },
    ChangeCurrencyRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.ChangeCurrency(),
        opaque: true,
      );
    },
    CommitmentsRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.Commitments(),
        opaque: true,
      );
    },
    ShoppingRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.Shopping(),
        opaque: true,
      );
    },
    TargetRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.Target(),
        opaque: true,
      );
    },
    CashTransactionsRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.CashTransactions(),
        opaque: true,
      );
    },
    RecurringTransactionsRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.RecurringTransactions(),
        opaque: true,
      );
    },
    AddTransactionBudgetRoute.name: (routeData) {
      return _i22.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i21.AddTransactionBudget(),
        opaque: true,
      );
    },
  };

  @override
  List<_i22.RouteConfig> get routes => [
        _i22.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i22.RouteConfig(
          WelcomePageRoute.name,
          path: '/welcome-page',
        ),
        _i22.RouteConfig(
          SelectLanguageRoute.name,
          path: '/select-language',
        ),
        _i22.RouteConfig(
          LoginRoute.name,
          path: '/Login',
        ),
        _i22.RouteConfig(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        ),
        _i22.RouteConfig(
          SelectCountryRoute.name,
          path: '/select-country',
        ),
        _i22.RouteConfig(
          SelectCurrencyRoute.name,
          path: '/select-currency',
        ),
        _i22.RouteConfig(
          CurrencyRateRoute.name,
          path: '/currency-rate',
        ),
        _i22.RouteConfig(
          RegisterRoute.name,
          path: '/Register',
        ),
        _i22.RouteConfig(
          HomeRoute.name,
          path: '/Home',
        ),
        _i22.RouteConfig(
          DatabaseDetailsRoute.name,
          path: '/database-details',
        ),
        _i22.RouteConfig(
          AddDatabaseRoute.name,
          path: '/add-database',
        ),
        _i22.RouteConfig(
          AddTransactionRoute.name,
          path: '/add-transaction',
        ),
        _i22.RouteConfig(
          BMICalculatorRoute.name,
          path: '/b-mi-calculator',
        ),
        _i22.RouteConfig(
          ChangeCurrencyRoute.name,
          path: '/change-currency',
        ),
        _i22.RouteConfig(
          CommitmentsRoute.name,
          path: '/Commitments',
        ),
        _i22.RouteConfig(
          ShoppingRoute.name,
          path: '/Shopping',
        ),
        _i22.RouteConfig(
          TargetRoute.name,
          path: '/Target',
        ),
        _i22.RouteConfig(
          CashTransactionsRoute.name,
          path: '/cash-transactions',
        ),
        _i22.RouteConfig(
          RecurringTransactionsRoute.name,
          path: '/recurring-transactions',
        ),
        _i22.RouteConfig(
          AddTransactionBudgetRoute.name,
          path: '/add-transaction-budget',
        ),
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i22.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i23.GlobalKey<_i23.NavigatorState> navigatorKey})
      : super(
          SplashRoute.name,
          path: '/',
          args: SplashRouteArgs(navigatorKey: navigatorKey),
        );

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

  final _i23.GlobalKey<_i23.NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'SplashRouteArgs{navigatorKey: $navigatorKey}';
  }
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomePageRoute extends _i22.PageRouteInfo<void> {
  const WelcomePageRoute()
      : super(
          WelcomePageRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomePageRoute';
}

/// generated route for
/// [_i3.SelectLanguage]
class SelectLanguageRoute extends _i22.PageRouteInfo<void> {
  const SelectLanguageRoute()
      : super(
          SelectLanguageRoute.name,
          path: '/select-language',
        );

  static const String name = 'SelectLanguageRoute';
}

/// generated route for
/// [_i4.Login]
class LoginRoute extends _i22.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.ForgetPassword]
class ForgetPasswordRoute extends _i22.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        );

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i6.SelectCountry]
class SelectCountryRoute extends _i22.PageRouteInfo<void> {
  const SelectCountryRoute()
      : super(
          SelectCountryRoute.name,
          path: '/select-country',
        );

  static const String name = 'SelectCountryRoute';
}

/// generated route for
/// [_i7.SelectCurrency]
class SelectCurrencyRoute extends _i22.PageRouteInfo<void> {
  const SelectCurrencyRoute()
      : super(
          SelectCurrencyRoute.name,
          path: '/select-currency',
        );

  static const String name = 'SelectCurrencyRoute';
}

/// generated route for
/// [_i8.CurrencyRate]
class CurrencyRateRoute extends _i22.PageRouteInfo<void> {
  const CurrencyRateRoute()
      : super(
          CurrencyRateRoute.name,
          path: '/currency-rate',
        );

  static const String name = 'CurrencyRateRoute';
}

/// generated route for
/// [_i9.Register]
class RegisterRoute extends _i22.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/Register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i10.Home]
class HomeRoute extends _i22.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i23.Key? key,
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

  final _i23.Key? key;

  final int index;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i11.DatabaseDetails]
class DatabaseDetailsRoute
    extends _i22.PageRouteInfo<DatabaseDetailsRouteArgs> {
  DatabaseDetailsRoute({
    _i23.Key? key,
    required _i24.DataBaseModel databaseData,
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

  final _i23.Key? key;

  final _i24.DataBaseModel databaseData;

  @override
  String toString() {
    return 'DatabaseDetailsRouteArgs{key: $key, databaseData: $databaseData}';
  }
}

/// generated route for
/// [_i12.AddDatabase]
class AddDatabaseRoute extends _i22.PageRouteInfo<void> {
  const AddDatabaseRoute()
      : super(
          AddDatabaseRoute.name,
          path: '/add-database',
        );

  static const String name = 'AddDatabaseRoute';
}

/// generated route for
/// [_i13.AddTransaction]
class AddTransactionRoute extends _i22.PageRouteInfo<void> {
  const AddTransactionRoute()
      : super(
          AddTransactionRoute.name,
          path: '/add-transaction',
        );

  static const String name = 'AddTransactionRoute';
}

/// generated route for
/// [_i14.BMICalculator]
class BMICalculatorRoute extends _i22.PageRouteInfo<void> {
  const BMICalculatorRoute()
      : super(
          BMICalculatorRoute.name,
          path: '/b-mi-calculator',
        );

  static const String name = 'BMICalculatorRoute';
}

/// generated route for
/// [_i15.ChangeCurrency]
class ChangeCurrencyRoute extends _i22.PageRouteInfo<void> {
  const ChangeCurrencyRoute()
      : super(
          ChangeCurrencyRoute.name,
          path: '/change-currency',
        );

  static const String name = 'ChangeCurrencyRoute';
}

/// generated route for
/// [_i16.Commitments]
class CommitmentsRoute extends _i22.PageRouteInfo<void> {
  const CommitmentsRoute()
      : super(
          CommitmentsRoute.name,
          path: '/Commitments',
        );

  static const String name = 'CommitmentsRoute';
}

/// generated route for
/// [_i17.Shopping]
class ShoppingRoute extends _i22.PageRouteInfo<void> {
  const ShoppingRoute()
      : super(
          ShoppingRoute.name,
          path: '/Shopping',
        );

  static const String name = 'ShoppingRoute';
}

/// generated route for
/// [_i18.Target]
class TargetRoute extends _i22.PageRouteInfo<void> {
  const TargetRoute()
      : super(
          TargetRoute.name,
          path: '/Target',
        );

  static const String name = 'TargetRoute';
}

/// generated route for
/// [_i19.CashTransactions]
class CashTransactionsRoute extends _i22.PageRouteInfo<void> {
  const CashTransactionsRoute()
      : super(
          CashTransactionsRoute.name,
          path: '/cash-transactions',
        );

  static const String name = 'CashTransactionsRoute';
}

/// generated route for
/// [_i20.RecurringTransactions]
class RecurringTransactionsRoute extends _i22.PageRouteInfo<void> {
  const RecurringTransactionsRoute()
      : super(
          RecurringTransactionsRoute.name,
          path: '/recurring-transactions',
        );

  static const String name = 'RecurringTransactionsRoute';
}

/// generated route for
/// [_i21.AddTransactionBudget]
class AddTransactionBudgetRoute extends _i22.PageRouteInfo<void> {
  const AddTransactionBudgetRoute()
      : super(
          AddTransactionBudgetRoute.name,
          path: '/add-transaction-budget',
        );

  static const String name = 'AddTransactionBudgetRoute';
}
