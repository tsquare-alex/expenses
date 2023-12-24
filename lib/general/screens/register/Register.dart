part of 'RegisterImports.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RegisterDate registerDate = RegisterDate();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(15.r),
          child: Column(
            children: [
              HeaderLogo(topPadding: 100.r,image: Res.register,color: MyColors.primary,),
              const BuildRegisterText(),
              BuildRegisterFields(registerDate: registerDate),
              const BuildHaveAccount(),
              BuildRegisterButton(registerDate: registerDate),
            ],
          ),
        ),
      ),
    );
  }
}
