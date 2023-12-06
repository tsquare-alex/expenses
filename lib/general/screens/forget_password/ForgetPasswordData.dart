part of 'ForgetPasswordImports.dart';

class ForgetPasswordData {
  // keys
  GlobalKey<FormState> formKey = GlobalKey();
  GlobalKey<CustomButtonState> btnKey = GlobalKey();

  // controllers
  TextEditingController email = TextEditingController();

  // blocs

  // methods
  void resetPassword(BuildContext context) async {
    print('ss');
    if (formKey.currentState!.validate()) {
      btnKey.currentState!.animateForward();
      try{
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text.trim());
        CustomToast.showSimpleToast(msg: "Password reset email send");
        AutoRouter.of(context).push(const LoginRoute());
      } on FirebaseAuthException catch(e){
        print(e.message);
        CustomToast.showSimpleToast(msg: e.message!,color: Colors.red);
      }
      btnKey.currentState!.animateReverse();
    }
  }
}
