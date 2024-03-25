part of 'LoginImports.dart';

class LoginData {
  // keys
  final GlobalKey<FormState> formKey = GlobalKey();


  // controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // blocs
  final GenericBloc<bool> passwordCubit = GenericBloc(false);

  // methods
}
