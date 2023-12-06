part of 'ForgetPasswordImports.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final ForgetPasswordData forgetPasswordData = ForgetPasswordData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15.r),
        child: Column(
          children: [
            HeaderLogo(topPadding: 100.r,image: Res.forgetPassword,),
            BuildForgetForm(forgetPasswordData: forgetPasswordData),
            BuildForgetPasswordButton(forgetPasswordData: forgetPasswordData),
          ],
        ),
      ),
    );
  }
}
