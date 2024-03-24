part of 'login_widgets_imports.dart';

class BuildLoginSkip extends StatelessWidget {
  const BuildLoginSkip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginAnonymouslyErrorState) {
            CustomToast.showSimpleToast(
                msg: "Email address or password is wrong", color: Colors.red);
          }

          if (state is LoginAnonymouslySuccessState) {
            Storage.setToken(state.uId!).then((value) async {
              final isAuthenticated =
                  context.read<AuthenticationCubit>().state.isAuthenticated;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              bool skipAuthentication =
                  prefs.getBool(authSharedPrefSkip) ?? false;
              if (isAuthenticated || skipAuthentication) {
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
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Container(
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () async {
                cubit.signInAnonymously(context);
                // FirebaseMessaging messaging = FirebaseMessaging.instance;
                // String? token = await messaging.getToken();
                // await Storage.setSkipToken(token!).then((value) {
                //   AutoRouter.of(context).push(HomeRoute(index: 1));
                // });
              },
              child: state is LoginAnonymouslyLoadingState?Center(child: CircularProgressIndicator(color: MyColors.primary,),):MyText(
                title: tr(context, "skip"),
                color: context.read<AppThemeCubit>().isDarkMode
                    ? MyColors.white
                    : MyColors.primary,
                size: 16.sp,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          );
        },
      ),
    );
  }
}
