part of 'login_widgets_imports.dart';

class BuildLoginButton extends StatelessWidget {
  final LoginData loginData;

  const BuildLoginButton({Key? key, required this.loginData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){
          if (state is LoginErrorState) {
            CustomToast.showSimpleToast(msg: "Email address or password is wrong", color: Colors.red);
          }

          if (state is LoginSuccessState) {
            CustomToast.showSimpleToast(
              msg: "Login Success",
              color: Colors.green,
            );
            Storage.setToken(state.uId!).then((value) {
              final isAuthenticated =
                  context.read<AuthenticationCubit>().state.isAuthenticated;
              if (isAuthenticated) {
                AutoRouter.of(context).push(HomeRoute(index: 1));
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AuthenticationScreen(),
                  ),
                );
              }
            });

          }
        },
        builder: (context,state)=>LoadingButton(
          borderRadius: 8,
          borderColor: MyColors.primary,
          title: tr(context, "login"),
          onTap: (){
            if (loginData.formKey.currentState!.validate()) {
              loginData.btnKey.currentState!.animateForward();
              LoginCubit.get(context).userLogin(
                email: loginData.emailController.text.trim(),
                password: loginData.passwordController.text.trim(),
              );
              loginData.btnKey.currentState!.animateReverse();
            }
          },
          color: MyColors.primary,
          textColor: MyColors.white,
          btnKey: loginData.btnKey,
          margin: const EdgeInsets.only(top: 40),
          fontSize: 13,
        ),
      ),
    );
  }
}
