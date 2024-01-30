part of 'select_currency_widgets_imports.dart';

class BuildSelectCurrencyText extends StatelessWidget {
  const BuildSelectCurrencyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: MyText(
        title: tr(context, "selectSubCurrency"),
        color: MyColors.black,
        size: 17,
        alien: TextAlign.center,
      ),
    );
  }
}
