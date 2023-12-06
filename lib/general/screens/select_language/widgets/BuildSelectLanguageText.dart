part of 'SelectLanguageWidgetsImports.dart';

class BuildSelectLanguageText extends StatelessWidget {
  const BuildSelectLanguageText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: MyText(
        title: tr(context, "selectLang"),
        color: MyColors.black,
        size: 17,
        alien: TextAlign.center,
      ),
    );
  }
}
