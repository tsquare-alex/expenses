part of 'RouterImports.dart';


@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AdaptiveRoute(page: Splash, initial: true),
    AdaptiveRoute(page: WelcomePage),
    CustomRoute(page: SelectLanguage,transitionsBuilder: TransitionsBuilders.fadeIn,durationInMilliseconds: 1500),
    CustomRoute(page: Login,),
    AdaptiveRoute(page: ForgetPassword),
    AdaptiveRoute(page: SelectCountry),
    AdaptiveRoute(page: SelectCurrency),
    AdaptiveRoute(page: CurrencyRate),

    // user routes
    AdaptiveRoute(page: Register),
    AdaptiveRoute(page: Home),
    AdaptiveRoute(page: AddTransaction),


  ],
)
class $AppRouter {}