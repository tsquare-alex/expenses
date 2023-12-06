part of 'RegisterImports.dart';

class RegisterDate {
  // blocs
  final GenericBloc<bool> passwordCubit = GenericBloc(false);
  final GenericBloc<bool> confirmPasswordBloc = GenericBloc(false);

  // keys
  final GlobalKey<CustomButtonState> btnKey = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey();

  // controllers
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =TextEditingController();


  //
  userRegister(BuildContext context) async{
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    final user = UsersModel(
        id: docUser.id,
        name: firstNameController.text,
        email: emailController.text
    );


    final json = user.toJson();

    await docUser.set(json);

    if (formKey.currentState!.validate()) {

      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((value) {
        print(value.user!.email);
        print(value.user!.uid);
        print('success');
        AutoRouter.of(context).pushAndPopUntil(const LoginRoute(), predicate: (p)=>false);
      }).catchError((error) {
        print(error.toString());
      });
    }
  }

}
