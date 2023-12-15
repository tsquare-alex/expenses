part of 'RouterImports.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AdaptiveRoute(page: Splash, initial: true),
    AdaptiveRoute(page: WelcomePage),
    CustomRoute(
        page: SelectLanguage,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500),
    CustomRoute(
      page: Login,
    ),
    AdaptiveRoute(page: ForgetPassword),
    AdaptiveRoute(page: SelectCountry),
    AdaptiveRoute(page: SelectCurrency),
    AdaptiveRoute(page: CurrencyRate),
    // user routes
    AdaptiveRoute(page: Register),
    AdaptiveRoute(page: Home),
    AdaptiveRoute(page: DatabaseDetails),
    AdaptiveRoute(page: AddDatabase),
    AdaptiveRoute(page: QiblahCompassWidget),


    AdaptiveRoute(page: AddTransaction),
    AdaptiveRoute(page: AreaConverter),


    AdaptiveRoute(page: BMICalculator),
    AdaptiveRoute(page: ChangeCurrency),
    AdaptiveRoute(page: Commitments),
    AdaptiveRoute(page: Shopping),
    AdaptiveRoute(page: Target),
    AdaptiveRoute(page: CashTransactions),
    AdaptiveRoute(page: RecurringTransactions),
    AdaptiveRoute(page: AddTransactionBudget),
    AdaptiveRoute(page: BalanceTransfer),
    AdaptiveRoute(page: AddWallet),
    AdaptiveRoute(page: ToolsHelper),
  ],
)
class $AppRouter {}
