part of 'SplashImports.dart';
void callbackDispatcher() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized first
  // sendNotificationNow();
  print("function Called on calledbackDispatcher ========================");
  LocalNotifications.init();



  Workmanager().executeTask((task, inputData) async {
    // sendNotificationNow();
    print("ExecuteTask =======================================");
    // final String title = inputData!["Name"] ?? "Default Title";
    // final String body = "Hello, this is the notification body.";
    // final String payload = "yoooooo";
    //
    // LocalNotifications.showSimpleNotification(title: title, body: body, payload: payload);
    return Future.value(true);
  });
}
void sendNotificationNow() {
  Random random = Random();
  int notificationId = random.nextInt(100000); // Generate a random number as notification ID
  const title = 'Expenses Title Now';
  const body = 'Expenses Notification Body';

  print("Sending Notification $notificationId");
  LocalNotifications.showScheduleNotification9(
    title: title,
    body: body,
    notificationId: notificationId,
  );
}
class Splash extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const Splash({required this.navigatorKey});

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final SplashController controller = SplashController();

  @override
  void initState() {
    controller.checkingData(context);
    Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage(Res.logo), context);
    precacheImage(const AssetImage(Res.onboardingOne), context);
    precacheImage(const AssetImage(Res.onboardingTwo), context);
    precacheImage(const AssetImage(Res.onboardingTwo), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: context.watch<AppThemeCubit>().isDarkMode?AppDarkColors.backgroundColor:MyColors.white,
        ),
        child: Center(
          child: AnimationContainer(
            index: 0,
            vertical: true,
            duration: const Duration(milliseconds: 800),
            distance: MediaQuery.of(context).size.height * .3,
            child: Hero(
              tag: Res.logo,
              child: Image.asset(
                Res.logo,
                width: 350.w,
                height: 350.h,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
