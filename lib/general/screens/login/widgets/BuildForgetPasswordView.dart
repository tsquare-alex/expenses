part of 'login_widgets_imports.dart';

class BuildForgetPasswordView extends StatelessWidget {
  const BuildForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: InkWell(
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => AutoRouter.of(context).push(const ForgetPasswordRoute()),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: MyText(
            title: tr(context, "forgetPassword"),
            color: MyColors.blackOpacity,
            size: 12,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
