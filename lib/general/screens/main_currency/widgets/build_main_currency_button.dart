part of 'main_currency_widgets_imports.dart';

class BuildMainCurrencyButton extends StatelessWidget {
  const BuildMainCurrencyButton({Key? key, required this.data}) : super(key: key);
  final MainCurrencyData data;
  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onTap: (){
        data.addCurrency(context);
      },
      title: tr(context, "next"),
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
      textColor: MyColors.white,
    );  }
}
