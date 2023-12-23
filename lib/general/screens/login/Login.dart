part of 'LoginImports.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final LoginData loginData = LoginData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                HeaderLogo(topPadding: 100.r,height: MediaQuery.of(context).size.height * 0.35,width: MediaQuery.of(context).size.width * 0.70,),
                BuildLoginForm(loginData: loginData),
                BuildLoginButton(loginData: loginData),
                const BuildForgetPasswordView(),
                const BuildDontHaveAccount()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
