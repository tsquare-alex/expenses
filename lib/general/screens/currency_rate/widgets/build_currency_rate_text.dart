part of 'currency_rate_widgets_imports.dart';

class BuildCurrencyRateText extends StatelessWidget {
  const BuildCurrencyRateText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: MyText(
        title: tr(context, "editCurrencyRate"),
        color: MyColors.black,
        size: 17,
        alien: TextAlign.center,
      ),
    );
  }
}
