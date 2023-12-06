part of 'select_language_imports.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  SelectLanguageData data = SelectLanguageData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                HeaderLogo(topPadding: 100.r,image: Res.lang,),
                const BuildSelectLanguageText(),
                BuildSelectLanguageButtons(data: data),
              ],
            ),
            BuildLangNextButton()
          ],
        ),
      ),
    );
  }
}
