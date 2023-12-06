part of 'select_country_widgets_imports.dart';

class BuildSelectCountryText extends StatelessWidget {
  const BuildSelectCountryText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: MyText(
        title: tr(context, "selectCountry"),
        color: MyColors.black,
        size: 17,
        alien: TextAlign.center,
      ),
    );
  }
}
