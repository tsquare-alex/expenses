part of 'WelcomePageImports.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final WelcomePageData welcomePageData = WelcomePageData();
  late final LocalAuthentication auth;

  bool _supportState = false;
  bool _isAuthenticated = false;
  @override
  void initState() {
    welcomePageData.initPagesData(context);
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then((bool isSupported) => setState((){
      _supportState = isSupported;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(

        body: _isAuthenticated ? BlocBuilder<GenericBloc<int>, GenericState<int>>(
          bloc: welcomePageData.pagesCubit,
          builder: (_, state) => AnimatedSwitcher(
            duration: const Duration(milliseconds: 1500),
            reverseDuration: const Duration(milliseconds: 1500),
            transitionBuilder: (child, animation) => FadeTransition(opacity: animation,child: child),
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: welcomePageData.data[state.data],
          ),
        ) : Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _getAvalibaleBiometrics, child: Text("Get available biometrics")),

            ElevatedButton(onPressed: _authenticate, child: Text("Authenticate To Can Move to Home screen")),
          ],
        )),
      ),
      onWillPop: () async => false,
    );
  }


  void _getAvalibaleBiometrics()  async{
    List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();
    print("List of availableBiometrics $availableBiometrics");

    if(!mounted){
      return;
    }
  }

  void _authenticate() async {
    try{
      bool authenticated = await auth.authenticate(
        localizedReason: "Subcribe or you will never find any data",
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: false,
        ),
      );
      setState(() {
        _isAuthenticated = authenticated;
      });
      _saveAuthenticationStatus(authenticated);
      print("Authenticated : $authenticated");
    }on PlatformException catch(e){
      print(e);
    }
  }

  void _saveAuthenticationStatus(bool isAuthenticated) async {
    final box = await Hive.openBox<AuthenticationInfo>('authentication_box');
    await box.put(1, AuthenticationInfo(isAuthenticated: isAuthenticated));
  }
}
