part of 'SplashImports.dart';

class SplashController {
  // variables
  Location location = Location();

  // methods
  void checkingData(BuildContext context) async {
     Future.delayed(const Duration(milliseconds: 1500), () => manipulateSplashData(context));
  }

  Future<void> manipulateSplashData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var lang = await Storage.getLang();
    InitUtils.initCustomWidgets(language: lang ?? "ar");
    Utils.changeLanguage(lang ?? "ar",context);
    ApiNames.uId = await Storage.getToken();
    var uId = ApiNames.uId;
    uId = await Storage.getToken();
    print('uId = $uId');
    print('ApiNames.uId = ${ApiNames.uId}');
    if (uId == null) {
      AutoRouter.of(context).push(HomeRoute(index: 1));
    } else {
      AutoRouter.of(context).push(const WelcomePageRoute());
    }
  }

}

