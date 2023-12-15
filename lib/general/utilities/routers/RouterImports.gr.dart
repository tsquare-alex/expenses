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
import 'package:auto_route/auto_route.dart' as _i16;
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
    as _i18;
import 'package:expenses/user/screens/add_transaction/add_transaction_imports.dart'
    as _i14;
import 'package:expenses/user/screens/database/widgets/add_database.dart'
    as _i12;
import 'package:expenses/user/screens/database/widgets/database_details.dart'
    as _i11;
import 'package:expenses/user/screens/home/home_imports.dart' as _i10;
import 'package:expenses/user/screens/tools_helper/widgets/arena_converter/arena_converter.dart'
    as _i15;
import 'package:expenses/user/screens/tools_helper/widgets/qiblah/compass.dart'
    as _i13;
import 'package:flutter/material.dart' as _i17;

class AppRouter extends _i16.RootStackRouter {
  AppRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.Splash(navigatorKey: args.navigatorKey),
        opaque: true,
      );
    },
    WelcomePageRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
        opaque: true,
      );
    },
    SelectLanguageRoute.name: (routeData) {
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.SelectLanguage(),
        transitionsBuilder: _i16.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.Login(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgetPassword(),
        opaque: true,
      );
    },
    SelectCountryRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.SelectCountry(),
        opaque: true,
      );
    },
    SelectCurrencyRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.SelectCurrency(),
        opaque: true,
      );
    },
    CurrencyRateRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.CurrencyRate(),
        opaque: true,
      );
    },
    RegisterRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.Register(),
        opaque: true,
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i16.AdaptivePage<dynamic>(
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
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.DatabaseDetails(
          key: args.key,
          databaseData: args.databaseData,
        ),
        opaque: true,
      );
    },
    AddDatabaseRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i12.AddDatabase(),
        opaque: true,
      );
    },
    QiblahCompassWidgetRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i13.QiblahCompassWidget(),
        opaque: true,
      );
    },
    AddTransactionRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.AddTransaction(),
        opaque: true,
      );
    },
    AreaConverterRoute.name: (routeData) {
      return _i16.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i15.AreaConverter(),
        opaque: true,
      );
    },
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i16.RouteConfig(
          WelcomePageRoute.name,
          path: '/welcome-page',
        ),
        _i16.RouteConfig(
          SelectLanguageRoute.name,
          path: '/select-language',
        ),
        _i16.RouteConfig(
          LoginRoute.name,
          path: '/Login',
        ),
        _i16.RouteConfig(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        ),
        _i16.RouteConfig(
          SelectCountryRoute.name,
          path: '/select-country',
        ),
        _i16.RouteConfig(
          SelectCurrencyRoute.name,
          path: '/select-currency',
        ),
        _i16.RouteConfig(
          CurrencyRateRoute.name,
          path: '/currency-rate',
        ),
        _i16.RouteConfig(
          RegisterRoute.name,
          path: '/Register',
        ),
        _i16.RouteConfig(
          HomeRoute.name,
          path: '/Home',
        ),
        _i16.RouteConfig(
          DatabaseDetailsRoute.name,
          path: '/database-details',
        ),
        _i16.RouteConfig(
          AddDatabaseRoute.name,
          path: '/add-database',
        ),
        _i16.RouteConfig(
          QiblahCompassWidgetRoute.name,
          path: '/qiblah-compass-widget',
        ),
        _i16.RouteConfig(
          AddTransactionRoute.name,
          path: '/add-transaction',
        ),
        _i16.RouteConfig(
          AreaConverterRoute.name,
          path: '/area-converter',
        ),
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i16.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i17.GlobalKey<_i17.NavigatorState> navigatorKey})
      : super(
          SplashRoute.name,
          path: '/',
          args: SplashRouteArgs(navigatorKey: navigatorKey),
        );

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

  final _i17.GlobalKey<_i17.NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'SplashRouteArgs{navigatorKey: $navigatorKey}';
  }
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomePageRoute extends _i16.PageRouteInfo<void> {
  const WelcomePageRoute()
      : super(
          WelcomePageRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomePageRoute';
}

/// generated route for
/// [_i3.SelectLanguage]
class SelectLanguageRoute extends _i16.PageRouteInfo<void> {
  const SelectLanguageRoute()
      : super(
          SelectLanguageRoute.name,
          path: '/select-language',
        );

  static const String name = 'SelectLanguageRoute';
}

/// generated route for
/// [_i4.Login]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.ForgetPassword]
class ForgetPasswordRoute extends _i16.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        );

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i6.SelectCountry]
class SelectCountryRoute extends _i16.PageRouteInfo<void> {
  const SelectCountryRoute()
      : super(
          SelectCountryRoute.name,
          path: '/select-country',
        );

  static const String name = 'SelectCountryRoute';
}

/// generated route for
/// [_i7.SelectCurrency]
class SelectCurrencyRoute extends _i16.PageRouteInfo<void> {
  const SelectCurrencyRoute()
      : super(
          SelectCurrencyRoute.name,
          path: '/select-currency',
        );

  static const String name = 'SelectCurrencyRoute';
}

/// generated route for
/// [_i8.CurrencyRate]
class CurrencyRateRoute extends _i16.PageRouteInfo<void> {
  const CurrencyRateRoute()
      : super(
          CurrencyRateRoute.name,
          path: '/currency-rate',
        );

  static const String name = 'CurrencyRateRoute';
}

/// generated route for
/// [_i9.Register]
class RegisterRoute extends _i16.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/Register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i10.Home]
class HomeRoute extends _i16.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i17.Key? key,
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

  final _i17.Key? key;

  final int index;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i11.DatabaseDetails]
class DatabaseDetailsRoute
    extends _i16.PageRouteInfo<DatabaseDetailsRouteArgs> {
  DatabaseDetailsRoute({
    _i17.Key? key,
    required _i18.DatabaseModel databaseData,
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

  final _i17.Key? key;

  final _i18.DatabaseModel databaseData;

  @override
  String toString() {
    return 'DatabaseDetailsRouteArgs{key: $key, databaseData: $databaseData}';
  }
}

/// generated route for
/// [_i12.AddDatabase]
class AddDatabaseRoute extends _i16.PageRouteInfo<void> {
  const AddDatabaseRoute()
      : super(
          AddDatabaseRoute.name,
          path: '/add-database',
        );

  static const String name = 'AddDatabaseRoute';
}

/// generated route for
/// [_i13.QiblahCompassWidget]
class QiblahCompassWidgetRoute extends _i16.PageRouteInfo<void> {
  const QiblahCompassWidgetRoute()
      : super(
          QiblahCompassWidgetRoute.name,
          path: '/qiblah-compass-widget',
        );

  static const String name = 'QiblahCompassWidgetRoute';
}

/// generated route for
/// [_i14.AddTransaction]
class AddTransactionRoute extends _i16.PageRouteInfo<void> {
  const AddTransactionRoute()
      : super(
          AddTransactionRoute.name,
          path: '/add-transaction',
        );

  static const String name = 'AddTransactionRoute';
}

/// generated route for
/// [_i15.AreaConverter]
class AreaConverterRoute extends _i16.PageRouteInfo<void> {
  const AreaConverterRoute()
      : super(
          AreaConverterRoute.name,
          path: '/area-converter',
        );

  static const String name = 'AreaConverterRoute';
}
