part of 'main_currency_widgets_imports.dart';

class BuildMainCurrencyText extends StatelessWidget {
  const BuildMainCurrencyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: MyText(
        title: tr(context, "selectMainCurrency"),
        color: MyColors.black,
        size: 17,
        alien: TextAlign.center,
      ),
    );
  }
}
