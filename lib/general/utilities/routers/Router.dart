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
    AdaptiveRoute(page: TransactionDetails),
    AdaptiveRoute(page: AreaConverter),
    AdaptiveRoute(page: BMICalculator),
    AdaptiveRoute(page: ChangeCurrency),
    AdaptiveRoute(page: Shopping),
    AdaptiveRoute(page: Target),
    AdaptiveRoute(page: CashTransactions),
    AdaptiveRoute(page: RepeatedTransactions),
    AdaptiveRoute(page: Expense),
    AdaptiveRoute(page: AddTransactionBudget),
    AdaptiveRoute(page: BalanceTransfer),
    AdaptiveRoute(page: AddWallet),
    AdaptiveRoute(page: Statistics),
    AdaptiveRoute(page: Wallet),
    AdaptiveRoute(page: EditWallet),
    AdaptiveRoute(page: BalanceWithdrawal),
    AdaptiveRoute(page: AddBalance),
    AdaptiveRoute(page: ToolsHelper),
    AdaptiveRoute(page: AddBudgetItem),
  ],
)
class $AppRouter {}