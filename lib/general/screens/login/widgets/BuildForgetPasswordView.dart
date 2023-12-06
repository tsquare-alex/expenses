part of 'login_widgets_imports.dart';

class BuildForgetPasswordView extends StatelessWidget {
  const BuildForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: InkWell(
        onTap: () => AutoRouter.of(context).push(const ForgetPasswordRoute()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: MyText(
            title: "هل نسيت كلمه المرور ؟",
            color: MyColors.blackOpacity,
            size: 12,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
