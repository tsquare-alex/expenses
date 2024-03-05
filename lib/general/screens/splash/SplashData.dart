part of 'SplashImports.dart';

class SplashController {
  // variables
  Location location = Location();

  // methods
  void checkingData(BuildContext context) async {
     Future.delayed(const Duration(milliseconds: 1500), () => manipulateSplashData(context));
  }

  Future<void> manipulateSplashData(BuildContext context) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    var lang = await Storage.getLang();
    InitUtils.initCustomWidgets(language: lang ?? "ar");
    Utils.changeLanguage(lang ?? "ar",context);
    ApiNames.uId = await Storage.getToken();
    ApiNames.skipToken = await Storage.getSkipToken();
    var uId = ApiNames.uId;
    var skipToken = ApiNames.skipToken;
    uId = await Storage.getToken();
    skipToken = await Storage.getSkipToken();
    print('uId = $uId');
    print('ApiNames.uId = ${ApiNames.uId}');
    print('ApiNames.skipToken = ${ApiNames.skipToken}');

    // if (uId != null) {
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //
    //   bool isAuthenticated = await context.read<AuthenticationCubit>().isAuthenticationRequired();
    //   bool skipAuthentication = prefs.getBool(authSharedPrefSkip) ?? false;
    //
    //   if (skipAuthentication) {
    //     AutoRouter.of(context).push(HomeRoute(index: 1));
    //   } else if(!isAuthenticated) {
    //     AutoRouter.of(context).push(AuthenticationScreenRoute());
    //   }
    // } else {
    //   AutoRouter.of(context).push(const WelcomePageRoute());
    // }








    if (skipToken!=null || uId !=null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool skipAuthentication = prefs.getBool(authSharedPrefSkip) ?? false;

      bool isAuthenticated = await context.read<AuthenticationCubit>().isAuthenticationRequired();

      if (!isAuthenticated && !skipAuthentication) {
        AutoRouter.of(context).push(AuthenticationScreenRoute());
      } else if (skipAuthentication) {
        AutoRouter.of(context).push(HomeRoute(index: 1));
      } else {
        AutoRouter.of(context).push(HomeRoute(index: 1));
      }
    } else {
      AutoRouter.of(context).push( SelectCountryRoute(fromSetting: false));
    }

  }

}

