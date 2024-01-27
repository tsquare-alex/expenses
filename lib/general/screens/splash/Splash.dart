part of 'SplashImports.dart';
void callbackDispatcher() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure Flutter is initialized first
  // sendNotificationNow();
  print("function Called on calledbackDispatcher ========================");
  LocalNotifications.init();

  Workmanager().executeTask((task, inputData) async {
    sendNotificationNow();
    print("ExecuteTask =======================================");
    // String taskId = inputData?['Id'] ?? "";
    // if (taskId == "The Name") {
    //   // Execute logic for the task with Name "The Name"
    //   print("Executing background logic for task with Name 'transaction'");
    //   myBackgroundMethodForTheName();
    // }
    repeatedTransaction();
    // final String title = inputData!["Name"] ?? "Default Title";
    // final String body = "Hello, this is the notification body.";
    // final String payload = "yoooooo";
    //
    // LocalNotifications.showSimpleNotification(title: title, body: body, payload: payload);
    return Future.value(true);
  });
}

void repeatedTransaction() async{
  print("object1");
  // await Hive.initFlutter();
  // var box = Hive.box<CountryModel>(
  //     "countryBox");
  // var list = box.values.toList();
  // print(list.length);
  print("object8");
  // for (AddTransactionModel item in list) {
  //   print("object3");
  //   AddTransactionModel newModel = AddTransactionModel(
  //     image: item.image,
  //     total: item.total,
  //     amount: item.amount,
  //     time: DateFormat("hh:mm aa", "en").format(DateTime(
  //         DateTime.now().year,
  //         DateTime.now().month,
  //         DateTime.now().day,
  //         TimeOfDay.now().hour,
  //         TimeOfDay.now().minute)),
  //     description: item.description,
  //     putReminderInWallet: item.putReminderInWallet,
  //     notify: null,
  //     requiredValue: item.requiredValue,
  //     initialValue: item.initialValue,
  //     transactionName: item.transactionName,
  //     priority: item.priority,
  //     endDate: item.endDate,
  //     startDate:
  //     DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
  //     targetValue: item.targetValue,
  //     transactionType: item.transactionType,
  //     brandName: item.brandName,
  //     repeated: null,
  //     transactionDate:
  //     DateFormat("dd/MM/yyyy", "en").format(DateTime.now()),
  //     unit: item.unit,
  //     incomeSource: item.incomeSource,
  //     transactionContent: item.transactionContent,
  //     budget: item.budget,
  //     cashTransactionType: item.cashTransactionType,
  //     completedNotify: item.completedNotify,
  //     database: item.database,
  //     ratio: item.ratio,
  //     targetType: item.targetType,
  //   );
  //   if (item.repeated != null) {
  //     print("object4");
  //     if (item.repeated?.name == "daily") {
  //       print("object5");
  //       double total = double.parse(item.total!);
  //       if (total <= item.incomeSource!.totalBalance!) {
  //         print("object6");
  //         var walletBox = Hive.box<WalletModel>(walletDatabaseBox);
  //         var walletList = walletBox.values.toList();
  //         WalletModel? targetModel = walletList.firstWhere(
  //               (model) => model.name == item.incomeSource?.name,
  //         );
  //         print("object ${targetModel.name}");
  //         targetModel.totalBalance = targetModel.totalBalance! - total;
  //         print("balance ${targetModel.totalBalance!}");
  //         await walletBox.put(targetModel.key, targetModel);
  //         print(item.incomeSource!.totalBalance!);
  //         box.add(newModel);
  //       } else {
  //         CustomToast.showSimpleToast(msg: "msg");
  //       }
  //     }
  //   }
  // }
  print("object9");
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
    initApp();
    super.initState();
  }

  Future<void> initApp() async{
    await Hive.initFlutter();
    Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: true,
    );
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
