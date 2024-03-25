part of 'SelectLanguageWidgetsImports.dart';

class BuildLangNextButton extends StatelessWidget {
  const BuildLangNextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onTap: ()=>AutoRouter.of(context).push(SelectCountryRoute(fromSetting: false)),
      title: tr(context, "next"),
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
      textColor: MyColors.white,
      width: 100,
    );
  }
}
