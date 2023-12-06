part of 'forget_password_widgets_imports.dart';

class BuildForgetPasswordButton extends StatelessWidget {
  final ForgetPasswordData forgetPasswordData;

  const BuildForgetPasswordButton({Key? key, required this.forgetPasswordData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingButton(
      borderRadius: 8,
      borderColor: MyColors.primary,
      title: tr(context, "send"),
      onTap: () =>forgetPasswordData.resetPassword(context),
      color: MyColors.primary,
      textColor: MyColors.white,
      btnKey: forgetPasswordData.btnKey,
      margin: const EdgeInsets.only(top: 40),
      fontSize: 14,
    );
  }
}
