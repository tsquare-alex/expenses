part of 'select_currency_widgets_imports.dart';

class BuildSelectCurrencyNextButton extends StatelessWidget {
  const BuildSelectCurrencyNextButton({Key? key, required this.data}) : super(key: key);
  final SelectCurrencyData data;
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
    );
  }
}
