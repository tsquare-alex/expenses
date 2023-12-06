part of 'select_language_imports.dart';

class SelectLanguageData {
  // keys
  final GlobalKey<CustomButtonState> btnKey1 = GlobalKey();
  final GlobalKey<CustomButtonState> btnKey2 = GlobalKey();
  final GlobalKey<CustomButtonState> btnKey3 = GlobalKey();

  // methods
  // void onSelectManager(BuildContext context) {
  //   context.read<UserCubit>().onUpdateUserData(
  //         UserModel(
  //           user: UserData(isTrader: 1),
  //         ),
  //       );
  //   AutoRouter.of(context).push(const LoginRoute());
  // }
  //
  // void onSelectVisitor(BuildContext context) {
  //   context.read<UserCubit>().onUpdateUserData(
  //     UserModel(
  //      user: UserData(isTrader: 0),
  //     ),
  //       );
  //   AutoRouter.of(context).push(const LoginRoute());
  // }
}
