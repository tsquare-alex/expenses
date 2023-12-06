part of 'select_currency_widgets_imports.dart';

class BuildSelectCurrencyNextButton extends StatelessWidget {
  const BuildSelectCurrencyNextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onTap: ()=>AutoRouter.of(context).push(const CurrencyRateRoute()),
      title: tr(context, "next"),
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
      textColor: MyColors.white,
      width: 100,
    );
  }
}
