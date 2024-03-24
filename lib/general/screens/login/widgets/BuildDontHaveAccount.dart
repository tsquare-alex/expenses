part of 'login_widgets_imports.dart';

class BuildDontHaveAccount extends StatelessWidget {
  const BuildDontHaveAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            title: tr(context, "don'tHaveAccount"),
            color: MyColors.black,
            size: 13,
          ),
          InkWell(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => AutoRouter.of(context).push(const RegisterRoute()),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: MyText(
                title: tr(context, "register"),
                color: MyColors.primary,
                size: 13,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
