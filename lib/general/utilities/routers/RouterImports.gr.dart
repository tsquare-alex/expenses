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
import 'package:auto_route/auto_route.dart' as _i46;
import 'package:expenses/general/screens/currency_rate/currency_rate_imports.dart'
    as _i8;
import 'package:expenses/general/screens/forget_password/ForgetPasswordImports.dart'
    as _i5;
import 'package:expenses/general/screens/login/LoginImports.dart' as _i4;
import 'package:expenses/general/screens/main_currency/main_currency_imports.dart'
    as _i43;
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
    as _i50;
import 'package:expenses/user/models/cart_model/add_cart_model.dart' as _i55;
import 'package:expenses/user/models/cart_model/cart_model.dart' as _i54;
import 'package:expenses/user/models/database_model/database_model.dart'
    as _i48;
import 'package:expenses/user/models/transaction_model/transaction_model.dart'
    as _i51;
import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart'
    as _i49;
import 'package:expenses/user/screens/add_cart/add_cart_imports.dart' as _i39;
import 'package:expenses/user/screens/add_transaction/add_transaction_imports.dart'
    as _i13;
import 'package:expenses/user/screens/auth_info_cubit/auth_screen.dart' as _i36;
import 'package:expenses/user/screens/balance_transfer/wallet_balance_transfer_imports.dart'
    as _i32;
import 'package:expenses/user/screens/bmi_calculator/bmi_calculator_imports.dart'
    as _i15;
import 'package:expenses/user/screens/budget/data/model/budget_model.dart'
    as _i53;
import 'package:expenses/user/screens/budget/widget/add_transaction.dart'
    as _i29;
import 'package:expenses/user/screens/budget/widget/edit_budget.dart' as _i37;
import 'package:expenses/user/screens/cart/cart_imports.dart' as _i33;
import 'package:expenses/user/screens/cart_details/cart_details_imports.dart'
    as _i42;
import 'package:expenses/user/screens/cart_previously_used/cart_previously_used_imports.dart'
    as _i41;
import 'package:expenses/user/screens/cart_ready_models/cart_ready_models_imports.dart'
    as _i40;
import 'package:expenses/user/screens/cash_transactions/cash_transactions_imports.dart'
    as _i19;
import 'package:expenses/user/screens/change_currency/change_currency_imports.dart'
    as _i16;
import 'package:expenses/user/screens/commitments/commitments_imports.dart'
    as _i38;
import 'package:expenses/user/screens/database/widgets/add_database.dart'
    as _i12;
import 'package:expenses/user/screens/database/widgets/database_details.dart'
    as _i11;
import 'package:expenses/user/screens/home/home_imports.dart' as _i10;
import 'package:expenses/user/screens/notification/notification_imports.dart'
    as _i45;
import 'package:expenses/user/screens/repeated_transactions/repeated_transactions_imports.dart'
    as _i20;
import 'package:expenses/user/screens/reports/statistics/statistics_imports.dart'
    as _i23;
import 'package:expenses/user/screens/shopping_screen/shopping_screen_imports.dart'
    as _i17;
import 'package:expenses/user/screens/subscriptions/subscriptions.dart' as _i44;
import 'package:expenses/user/screens/target/target_imports.dart' as _i18;
import 'package:expenses/user/screens/tools_helper/tools_helper.dart' as _i28;
import 'package:expenses/user/screens/transaction_details/transaction_details_imports.dart'
    as _i14;
import 'package:expenses/user/screens/transaction_type/transaction_type_imports.dart'
    as _i34;
import 'package:expenses/user/screens/transfer_wallet_transaction/transfer_wallet_transaction_imports.dart'
    as _i31;
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart'
    as _i52;
import 'package:expenses/user/screens/wallet/wallet_imports.dart' as _i24;
import 'package:expenses/user/screens/wallet/widgets/add_balance.dart' as _i27;
import 'package:expenses/user/screens/wallet/widgets/add_wallet.dart' as _i22;
import 'package:expenses/user/screens/wallet/widgets/balance_transfer.dart'
    as _i21;
import 'package:expenses/user/screens/wallet/widgets/balance_withdrawal.dart'
    as _i26;
import 'package:expenses/user/screens/wallet/widgets/edit_Wallet.dart' as _i25;
import 'package:expenses/user/screens/wallet/widgets/wallet_category_screen.dart'
    as _i35;
import 'package:expenses/user/screens/wallet_transactions/wallet_transactions_imports.dart'
    as _i30;
import 'package:flutter/material.dart' as _i47;

class AppRouter extends _i46.RootStackRouter {
  AppRouter([_i47.GlobalKey<_i47.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i46.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i1.Splash(navigatorKey: args.navigatorKey),
        opaque: true,
      );
    },
    WelcomePageRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.WelcomePage(),
        opaque: true,
      );
    },
    SelectLanguageRoute.name: (routeData) {
      return _i46.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.SelectLanguage(),
        transitionsBuilder: _i46.TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500,
        opaque: true,
        barrierDismissible: false,
      );
    },
    LoginRoute.name: (routeData) {
      return _i46.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.Login(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.ForgetPassword(),
        opaque: true,
      );
    },
    SelectCountryRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.SelectCountry(),
        opaque: true,
      );
    },
    SelectCurrencyRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i7.SelectCurrency(),
        opaque: true,
      );
    },
    CurrencyRateRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i8.CurrencyRate(),
        opaque: true,
      );
    },
    RegisterRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.Register(),
        opaque: true,
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
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
      return _i46.AdaptivePage<dynamic>(
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
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i12.AddDatabase(),
        opaque: true,
      );
    },
    AddTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<AddTransactionRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i13.AddTransaction(
          key: args.key,
          model: args.model,
          transactionName: args.transactionName,
          boxName: args.boxName,
        ),
        opaque: true,
      );
    },
    TransactionDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<TransactionDetailsRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i14.TransactionDetails(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    BMICalculatorRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i15.BMICalculator(),
        opaque: true,
      );
    },
    ChangeCurrencyRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.ChangeCurrency(),
        opaque: true,
      );
    },
    ShoppingScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ShoppingScreenRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i17.ShoppingScreen(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    TargetRoute.name: (routeData) {
      final args = routeData.argsAs<TargetRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i18.Target(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    CashTransactionsRoute.name: (routeData) {
      final args = routeData.argsAs<CashTransactionsRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i19.CashTransactions(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    RepeatedTransactionsRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i20.RepeatedTransactions(),
        opaque: true,
      );
    },
    BalanceTransferRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i21.BalanceTransfer(),
        opaque: true,
      );
    },
    AddWalletRoute.name: (routeData) {
      final args = routeData.argsAs<AddWalletRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i22.AddWallet(
          key: args.key,
          selectItemIndex: args.selectItemIndex,
          selectedCategory: args.selectedCategory,
          iconPath: args.iconPath,
        ),
        opaque: true,
      );
    },
    StatisticsRoute.name: (routeData) {
      final args = routeData.argsAs<StatisticsRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i23.Statistics(
          key: args.key,
          option: args.option,
        ),
        opaque: true,
      );
    },
    WalletRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i24.Wallet(),
        opaque: true,
      );
    },
    EditWalletRoute.name: (routeData) {
      final args = routeData.argsAs<EditWalletRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i25.EditWallet(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    BalanceWithdrawalRoute.name: (routeData) {
      final args = routeData.argsAs<BalanceWithdrawalRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i26.BalanceWithdrawal(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    AddBalanceRoute.name: (routeData) {
      final args = routeData.argsAs<AddBalanceRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i27.AddBalance(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    ToolsHelperRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i28.ToolsHelper(),
        opaque: true,
      );
    },
    AddTransactionBudgetRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i29.AddTransactionBudget(),
        opaque: true,
      );
    },
    WalletTransactionsRoute.name: (routeData) {
      final args = routeData.argsAs<WalletTransactionsRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i30.WalletTransactions(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    TransferWalletTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<TransferWalletTransactionRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i31.TransferWalletTransaction(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    WalletBalanceTransferRoute.name: (routeData) {
      final args = routeData.argsAs<WalletBalanceTransferRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i32.WalletBalanceTransfer(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    CartRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i33.Cart(),
        opaque: true,
      );
    },
    TransactionTypeRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i34.TransactionType(),
        opaque: true,
      );
    },
    WalletCategoryRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i35.WalletCategory(),
        opaque: true,
      );
    },
    AuthenticationScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i36.AuthenticationScreen(),
        opaque: true,
      );
    },
    EditBudgetRoute.name: (routeData) {
      final args = routeData.argsAs<EditBudgetRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i37.EditBudget(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    CommitmentsRoute.name: (routeData) {
      final args = routeData.argsAs<CommitmentsRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i38.Commitments(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    AddCartRoute.name: (routeData) {
      final args = routeData.argsAs<AddCartRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i39.AddCart(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    CartReadyModelsRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i40.CartReadyModels(),
        opaque: true,
      );
    },
    CartPreviouslyUsedRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i41.CartPreviouslyUsed(),
        opaque: true,
      );
    },
    CartDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<CartDetailsRouteArgs>();
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i42.CartDetails(
          key: args.key,
          model: args.model,
        ),
        opaque: true,
      );
    },
    MainCurrencyRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i43.MainCurrency(),
        opaque: true,
      );
    },
    SubscriptionsRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i44.Subscriptions(),
        opaque: true,
      );
    },
    NotificationScreenRoute.name: (routeData) {
      return _i46.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i45.NotificationScreen(),
        opaque: true,
      );
    },
  };

  @override
  List<_i46.RouteConfig> get routes => [
        _i46.RouteConfig(
          SplashRoute.name,
          path: '/',
        ),
        _i46.RouteConfig(
          WelcomePageRoute.name,
          path: '/welcome-page',
        ),
        _i46.RouteConfig(
          SelectLanguageRoute.name,
          path: '/select-language',
        ),
        _i46.RouteConfig(
          LoginRoute.name,
          path: '/Login',
        ),
        _i46.RouteConfig(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        ),
        _i46.RouteConfig(
          SelectCountryRoute.name,
          path: '/select-country',
        ),
        _i46.RouteConfig(
          SelectCurrencyRoute.name,
          path: '/select-currency',
        ),
        _i46.RouteConfig(
          CurrencyRateRoute.name,
          path: '/currency-rate',
        ),
        _i46.RouteConfig(
          RegisterRoute.name,
          path: '/Register',
        ),
        _i46.RouteConfig(
          HomeRoute.name,
          path: '/Home',
        ),
        _i46.RouteConfig(
          DatabaseDetailsRoute.name,
          path: '/database-details',
        ),
        _i46.RouteConfig(
          AddDatabaseRoute.name,
          path: '/add-database',
        ),
        _i46.RouteConfig(
          AddTransactionRoute.name,
          path: '/add-transaction',
        ),
        _i46.RouteConfig(
          TransactionDetailsRoute.name,
          path: '/transaction-details',
        ),
        _i46.RouteConfig(
          BMICalculatorRoute.name,
          path: '/b-mi-calculator',
        ),
        _i46.RouteConfig(
          ChangeCurrencyRoute.name,
          path: '/change-currency',
        ),
        _i46.RouteConfig(
          ShoppingScreenRoute.name,
          path: '/shopping-screen',
        ),
        _i46.RouteConfig(
          TargetRoute.name,
          path: '/Target',
        ),
        _i46.RouteConfig(
          CashTransactionsRoute.name,
          path: '/cash-transactions',
        ),
        _i46.RouteConfig(
          RepeatedTransactionsRoute.name,
          path: '/repeated-transactions',
        ),
        _i46.RouteConfig(
          BalanceTransferRoute.name,
          path: '/balance-transfer',
        ),
        _i46.RouteConfig(
          AddWalletRoute.name,
          path: '/add-wallet',
        ),
        _i46.RouteConfig(
          StatisticsRoute.name,
          path: '/Statistics',
        ),
        _i46.RouteConfig(
          WalletRoute.name,
          path: '/Wallet',
        ),
        _i46.RouteConfig(
          EditWalletRoute.name,
          path: '/edit-wallet',
        ),
        _i46.RouteConfig(
          BalanceWithdrawalRoute.name,
          path: '/balance-withdrawal',
        ),
        _i46.RouteConfig(
          AddBalanceRoute.name,
          path: '/add-balance',
        ),
        _i46.RouteConfig(
          ToolsHelperRoute.name,
          path: '/tools-helper',
        ),
        _i46.RouteConfig(
          AddTransactionBudgetRoute.name,
          path: '/add-transaction-budget',
        ),
        _i46.RouteConfig(
          WalletTransactionsRoute.name,
          path: '/wallet-transactions',
        ),
        _i46.RouteConfig(
          TransferWalletTransactionRoute.name,
          path: '/transfer-wallet-transaction',
        ),
        _i46.RouteConfig(
          WalletBalanceTransferRoute.name,
          path: '/wallet-balance-transfer',
        ),
        _i46.RouteConfig(
          CartRoute.name,
          path: '/Cart',
        ),
        _i46.RouteConfig(
          TransactionTypeRoute.name,
          path: '/transaction-type',
        ),
        _i46.RouteConfig(
          WalletCategoryRoute.name,
          path: '/wallet-category',
        ),
        _i46.RouteConfig(
          AuthenticationScreenRoute.name,
          path: '/authentication-screen',
        ),
        _i46.RouteConfig(
          EditBudgetRoute.name,
          path: '/edit-budget',
        ),
        _i46.RouteConfig(
          CommitmentsRoute.name,
          path: '/Commitments',
        ),
        _i46.RouteConfig(
          AddCartRoute.name,
          path: '/add-cart',
        ),
        _i46.RouteConfig(
          CartReadyModelsRoute.name,
          path: '/cart-ready-models',
        ),
        _i46.RouteConfig(
          CartPreviouslyUsedRoute.name,
          path: '/cart-previously-used',
        ),
        _i46.RouteConfig(
          CartDetailsRoute.name,
          path: '/cart-details',
        ),
        _i46.RouteConfig(
          MainCurrencyRoute.name,
          path: '/main-currency',
        ),
        _i46.RouteConfig(
          SubscriptionsRoute.name,
          path: '/Subscriptions',
        ),
        _i46.RouteConfig(
          NotificationScreenRoute.name,
          path: '/notification-screen',
        ),
      ];
}

/// generated route for
/// [_i1.Splash]
class SplashRoute extends _i46.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i47.GlobalKey<_i47.NavigatorState> navigatorKey})
      : super(
          SplashRoute.name,
          path: '/',
          args: SplashRouteArgs(navigatorKey: navigatorKey),
        );

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

  final _i47.GlobalKey<_i47.NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'SplashRouteArgs{navigatorKey: $navigatorKey}';
  }
}

/// generated route for
/// [_i2.WelcomePage]
class WelcomePageRoute extends _i46.PageRouteInfo<void> {
  const WelcomePageRoute()
      : super(
          WelcomePageRoute.name,
          path: '/welcome-page',
        );

  static const String name = 'WelcomePageRoute';
}

/// generated route for
/// [_i3.SelectLanguage]
class SelectLanguageRoute extends _i46.PageRouteInfo<void> {
  const SelectLanguageRoute()
      : super(
          SelectLanguageRoute.name,
          path: '/select-language',
        );

  static const String name = 'SelectLanguageRoute';
}

/// generated route for
/// [_i4.Login]
class LoginRoute extends _i46.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i5.ForgetPassword]
class ForgetPasswordRoute extends _i46.PageRouteInfo<void> {
  const ForgetPasswordRoute()
      : super(
          ForgetPasswordRoute.name,
          path: '/forget-password',
        );

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for
/// [_i6.SelectCountry]
class SelectCountryRoute extends _i46.PageRouteInfo<void> {
  const SelectCountryRoute()
      : super(
          SelectCountryRoute.name,
          path: '/select-country',
        );

  static const String name = 'SelectCountryRoute';
}

/// generated route for
/// [_i7.SelectCurrency]
class SelectCurrencyRoute extends _i46.PageRouteInfo<void> {
  const SelectCurrencyRoute()
      : super(
          SelectCurrencyRoute.name,
          path: '/select-currency',
        );

  static const String name = 'SelectCurrencyRoute';
}

/// generated route for
/// [_i8.CurrencyRate]
class CurrencyRateRoute extends _i46.PageRouteInfo<void> {
  const CurrencyRateRoute()
      : super(
          CurrencyRateRoute.name,
          path: '/currency-rate',
        );

  static const String name = 'CurrencyRateRoute';
}

/// generated route for
/// [_i9.Register]
class RegisterRoute extends _i46.PageRouteInfo<void> {
  const RegisterRoute()
      : super(
          RegisterRoute.name,
          path: '/Register',
        );

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [_i10.Home]
class HomeRoute extends _i46.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i47.Key? key,
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

  final _i47.Key? key;

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
    extends _i46.PageRouteInfo<DatabaseDetailsRouteArgs> {
  DatabaseDetailsRoute({
    _i47.Key? key,
    required _i48.DatabaseModel databaseData,
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

  final _i47.Key? key;

  final _i48.DatabaseModel databaseData;

  final dynamic Function() onDataChanged;

  @override
  String toString() {
    return 'DatabaseDetailsRouteArgs{key: $key, databaseData: $databaseData, onDataChanged: $onDataChanged}';
  }
}

/// generated route for
/// [_i12.AddDatabase]
class AddDatabaseRoute extends _i46.PageRouteInfo<void> {
  const AddDatabaseRoute()
      : super(
          AddDatabaseRoute.name,
          path: '/add-database',
        );

  static const String name = 'AddDatabaseRoute';
}

/// generated route for
/// [_i13.AddTransaction]
class AddTransactionRoute extends _i46.PageRouteInfo<AddTransactionRouteArgs> {
  AddTransactionRoute({
    _i47.Key? key,
    required _i49.TransactionTypeModel? model,
    String? transactionName,
    String? boxName,
  }) : super(
          AddTransactionRoute.name,
          path: '/add-transaction',
          args: AddTransactionRouteArgs(
            key: key,
            model: model,
            transactionName: transactionName,
            boxName: boxName,
          ),
        );

  static const String name = 'AddTransactionRoute';
}

class AddTransactionRouteArgs {
  const AddTransactionRouteArgs({
    this.key,
    required this.model,
    this.transactionName,
    this.boxName,
  });

  final _i47.Key? key;

  final _i49.TransactionTypeModel? model;

  final String? transactionName;

  final String? boxName;

  @override
  String toString() {
    return 'AddTransactionRouteArgs{key: $key, model: $model, transactionName: $transactionName, boxName: $boxName}';
  }
}

/// generated route for
/// [_i14.TransactionDetails]
class TransactionDetailsRoute
    extends _i46.PageRouteInfo<TransactionDetailsRouteArgs> {
  TransactionDetailsRoute({
    _i47.Key? key,
    required _i50.AddTransactionModel model,
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

  final _i47.Key? key;

  final _i50.AddTransactionModel model;

  @override
  String toString() {
    return 'TransactionDetailsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i15.BMICalculator]
class BMICalculatorRoute extends _i46.PageRouteInfo<void> {
  const BMICalculatorRoute()
      : super(
          BMICalculatorRoute.name,
          path: '/b-mi-calculator',
        );

  static const String name = 'BMICalculatorRoute';
}

/// generated route for
/// [_i16.ChangeCurrency]
class ChangeCurrencyRoute extends _i46.PageRouteInfo<void> {
  const ChangeCurrencyRoute()
      : super(
          ChangeCurrencyRoute.name,
          path: '/change-currency',
        );

  static const String name = 'ChangeCurrencyRoute';
}

/// generated route for
/// [_i17.ShoppingScreen]
class ShoppingScreenRoute extends _i46.PageRouteInfo<ShoppingScreenRouteArgs> {
  ShoppingScreenRoute({
    _i47.Key? key,
    required _i51.TransactionModel model,
  }) : super(
          ShoppingScreenRoute.name,
          path: '/shopping-screen',
          args: ShoppingScreenRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'ShoppingScreenRoute';
}

class ShoppingScreenRouteArgs {
  const ShoppingScreenRouteArgs({
    this.key,
    required this.model,
  });

  final _i47.Key? key;

  final _i51.TransactionModel model;

  @override
  String toString() {
    return 'ShoppingScreenRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i18.Target]
class TargetRoute extends _i46.PageRouteInfo<TargetRouteArgs> {
  TargetRoute({
    _i47.Key? key,
    required _i51.TransactionModel model,
  }) : super(
          TargetRoute.name,
          path: '/Target',
          args: TargetRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'TargetRoute';
}

class TargetRouteArgs {
  const TargetRouteArgs({
    this.key,
    required this.model,
  });

  final _i47.Key? key;

  final _i51.TransactionModel model;

  @override
  String toString() {
    return 'TargetRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i19.CashTransactions]
class CashTransactionsRoute
    extends _i46.PageRouteInfo<CashTransactionsRouteArgs> {
  CashTransactionsRoute({
    _i47.Key? key,
    required _i51.TransactionModel model,
  }) : super(
          CashTransactionsRoute.name,
          path: '/cash-transactions',
          args: CashTransactionsRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'CashTransactionsRoute';
}

class CashTransactionsRouteArgs {
  const CashTransactionsRouteArgs({
    this.key,
    required this.model,
  });

  final _i47.Key? key;

  final _i51.TransactionModel model;

  @override
  String toString() {
    return 'CashTransactionsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i20.RepeatedTransactions]
class RepeatedTransactionsRoute extends _i46.PageRouteInfo<void> {
  const RepeatedTransactionsRoute()
      : super(
          RepeatedTransactionsRoute.name,
          path: '/repeated-transactions',
        );

  static const String name = 'RepeatedTransactionsRoute';
}

/// generated route for
/// [_i21.BalanceTransfer]
class BalanceTransferRoute extends _i46.PageRouteInfo<void> {
  const BalanceTransferRoute()
      : super(
          BalanceTransferRoute.name,
          path: '/balance-transfer',
        );

  static const String name = 'BalanceTransferRoute';
}

/// generated route for
/// [_i22.AddWallet]
class AddWalletRoute extends _i46.PageRouteInfo<AddWalletRouteArgs> {
  AddWalletRoute({
    _i47.Key? key,
    required int selectItemIndex,
    required String selectedCategory,
    required String iconPath,
  }) : super(
          AddWalletRoute.name,
          path: '/add-wallet',
          args: AddWalletRouteArgs(
            key: key,
            selectItemIndex: selectItemIndex,
            selectedCategory: selectedCategory,
            iconPath: iconPath,
          ),
        );

  static const String name = 'AddWalletRoute';
}

class AddWalletRouteArgs {
  const AddWalletRouteArgs({
    this.key,
    required this.selectItemIndex,
    required this.selectedCategory,
    required this.iconPath,
  });

  final _i47.Key? key;

  final int selectItemIndex;

  final String selectedCategory;

  final String iconPath;

  @override
  String toString() {
    return 'AddWalletRouteArgs{key: $key, selectItemIndex: $selectItemIndex, selectedCategory: $selectedCategory, iconPath: $iconPath}';
  }
}

/// generated route for
/// [_i23.Statistics]
class StatisticsRoute extends _i46.PageRouteInfo<StatisticsRouteArgs> {
  StatisticsRoute({
    _i47.Key? key,
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

  final _i47.Key? key;

  final String option;

  @override
  String toString() {
    return 'StatisticsRouteArgs{key: $key, option: $option}';
  }
}

/// generated route for
/// [_i24.Wallet]
class WalletRoute extends _i46.PageRouteInfo<void> {
  const WalletRoute()
      : super(
          WalletRoute.name,
          path: '/Wallet',
        );

  static const String name = 'WalletRoute';
}

/// generated route for
/// [_i25.EditWallet]
class EditWalletRoute extends _i46.PageRouteInfo<EditWalletRouteArgs> {
  EditWalletRoute({
    _i47.Key? key,
    required _i52.WalletModel model,
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

  final _i47.Key? key;

  final _i52.WalletModel model;

  @override
  String toString() {
    return 'EditWalletRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i26.BalanceWithdrawal]
class BalanceWithdrawalRoute
    extends _i46.PageRouteInfo<BalanceWithdrawalRouteArgs> {
  BalanceWithdrawalRoute({
    _i47.Key? key,
    required _i52.WalletModel model,
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

  final _i47.Key? key;

  final _i52.WalletModel model;

  @override
  String toString() {
    return 'BalanceWithdrawalRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i27.AddBalance]
class AddBalanceRoute extends _i46.PageRouteInfo<AddBalanceRouteArgs> {
  AddBalanceRoute({
    _i47.Key? key,
    required _i52.WalletModel model,
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

  final _i47.Key? key;

  final _i52.WalletModel model;

  @override
  String toString() {
    return 'AddBalanceRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i28.ToolsHelper]
class ToolsHelperRoute extends _i46.PageRouteInfo<void> {
  const ToolsHelperRoute()
      : super(
          ToolsHelperRoute.name,
          path: '/tools-helper',
        );

  static const String name = 'ToolsHelperRoute';
}

/// generated route for
/// [_i29.AddTransactionBudget]
class AddTransactionBudgetRoute extends _i46.PageRouteInfo<void> {
  const AddTransactionBudgetRoute()
      : super(
          AddTransactionBudgetRoute.name,
          path: '/add-transaction-budget',
        );

  static const String name = 'AddTransactionBudgetRoute';
}

/// generated route for
/// [_i30.WalletTransactions]
class WalletTransactionsRoute
    extends _i46.PageRouteInfo<WalletTransactionsRouteArgs> {
  WalletTransactionsRoute({
    _i47.Key? key,
    required _i52.WalletModel model,
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

  final _i47.Key? key;

  final _i52.WalletModel model;

  @override
  String toString() {
    return 'WalletTransactionsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i31.TransferWalletTransaction]
class TransferWalletTransactionRoute
    extends _i46.PageRouteInfo<TransferWalletTransactionRouteArgs> {
  TransferWalletTransactionRoute({
    _i47.Key? key,
    required _i50.AddTransactionModel model,
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

  final _i47.Key? key;

  final _i50.AddTransactionModel model;

  @override
  String toString() {
    return 'TransferWalletTransactionRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i32.WalletBalanceTransfer]
class WalletBalanceTransferRoute
    extends _i46.PageRouteInfo<WalletBalanceTransferRouteArgs> {
  WalletBalanceTransferRoute({
    _i47.Key? key,
    required _i52.WalletModel model,
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

  final _i47.Key? key;

  final _i52.WalletModel model;

  @override
  String toString() {
    return 'WalletBalanceTransferRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i33.Cart]
class CartRoute extends _i46.PageRouteInfo<void> {
  const CartRoute()
      : super(
          CartRoute.name,
          path: '/Cart',
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i34.TransactionType]
class TransactionTypeRoute extends _i46.PageRouteInfo<void> {
  const TransactionTypeRoute()
      : super(
          TransactionTypeRoute.name,
          path: '/transaction-type',
        );

  static const String name = 'TransactionTypeRoute';
}

/// generated route for
/// [_i35.WalletCategory]
class WalletCategoryRoute extends _i46.PageRouteInfo<void> {
  const WalletCategoryRoute()
      : super(
          WalletCategoryRoute.name,
          path: '/wallet-category',
        );

  static const String name = 'WalletCategoryRoute';
}

/// generated route for
/// [_i36.AuthenticationScreen]
class AuthenticationScreenRoute extends _i46.PageRouteInfo<void> {
  const AuthenticationScreenRoute()
      : super(
          AuthenticationScreenRoute.name,
          path: '/authentication-screen',
        );

  static const String name = 'AuthenticationScreenRoute';
}

/// generated route for
/// [_i37.EditBudget]
class EditBudgetRoute extends _i46.PageRouteInfo<EditBudgetRouteArgs> {
  EditBudgetRoute({
    _i47.Key? key,
    required _i53.BudgetModel model,
  }) : super(
          EditBudgetRoute.name,
          path: '/edit-budget',
          args: EditBudgetRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'EditBudgetRoute';
}

class EditBudgetRouteArgs {
  const EditBudgetRouteArgs({
    this.key,
    required this.model,
  });

  final _i47.Key? key;

  final _i53.BudgetModel model;

  @override
  String toString() {
    return 'EditBudgetRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i38.Commitments]
class CommitmentsRoute extends _i46.PageRouteInfo<CommitmentsRouteArgs> {
  CommitmentsRoute({
    _i47.Key? key,
    required _i51.TransactionModel model,
  }) : super(
          CommitmentsRoute.name,
          path: '/Commitments',
          args: CommitmentsRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'CommitmentsRoute';
}

class CommitmentsRouteArgs {
  const CommitmentsRouteArgs({
    this.key,
    required this.model,
  });

  final _i47.Key? key;

  final _i51.TransactionModel model;

  @override
  String toString() {
    return 'CommitmentsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i39.AddCart]
class AddCartRoute extends _i46.PageRouteInfo<AddCartRouteArgs> {
  AddCartRoute({
    _i47.Key? key,
    required _i54.CartModel model,
  }) : super(
          AddCartRoute.name,
          path: '/add-cart',
          args: AddCartRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'AddCartRoute';
}

class AddCartRouteArgs {
  const AddCartRouteArgs({
    this.key,
    required this.model,
  });

  final _i47.Key? key;

  final _i54.CartModel model;

  @override
  String toString() {
    return 'AddCartRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i40.CartReadyModels]
class CartReadyModelsRoute extends _i46.PageRouteInfo<void> {
  const CartReadyModelsRoute()
      : super(
          CartReadyModelsRoute.name,
          path: '/cart-ready-models',
        );

  static const String name = 'CartReadyModelsRoute';
}

/// generated route for
/// [_i41.CartPreviouslyUsed]
class CartPreviouslyUsedRoute extends _i46.PageRouteInfo<void> {
  const CartPreviouslyUsedRoute()
      : super(
          CartPreviouslyUsedRoute.name,
          path: '/cart-previously-used',
        );

  static const String name = 'CartPreviouslyUsedRoute';
}

/// generated route for
/// [_i42.CartDetails]
class CartDetailsRoute extends _i46.PageRouteInfo<CartDetailsRouteArgs> {
  CartDetailsRoute({
    _i47.Key? key,
    required _i55.AddCartModel model,
  }) : super(
          CartDetailsRoute.name,
          path: '/cart-details',
          args: CartDetailsRouteArgs(
            key: key,
            model: model,
          ),
        );

  static const String name = 'CartDetailsRoute';
}

class CartDetailsRouteArgs {
  const CartDetailsRouteArgs({
    this.key,
    required this.model,
  });

  final _i47.Key? key;

  final _i55.AddCartModel model;

  @override
  String toString() {
    return 'CartDetailsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i43.MainCurrency]
class MainCurrencyRoute extends _i46.PageRouteInfo<void> {
  const MainCurrencyRoute()
      : super(
          MainCurrencyRoute.name,
          path: '/main-currency',
        );

  static const String name = 'MainCurrencyRoute';
}

/// generated route for
/// [_i44.Subscriptions]
class SubscriptionsRoute extends _i46.PageRouteInfo<void> {
  const SubscriptionsRoute()
      : super(
          SubscriptionsRoute.name,
          path: '/Subscriptions',
        );

  static const String name = 'SubscriptionsRoute';
}

/// generated route for
/// [_i45.NotificationScreen]
class NotificationScreenRoute extends _i46.PageRouteInfo<void> {
  const NotificationScreenRoute()
      : super(
          NotificationScreenRoute.name,
          path: '/notification-screen',
        );

  static const String name = 'NotificationScreenRoute';
}
