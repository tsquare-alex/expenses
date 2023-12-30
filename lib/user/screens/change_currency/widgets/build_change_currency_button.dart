part of 'change_currency_widgets_imports.dart';

class BuildChangeCurrencyButton extends StatelessWidget {
  const BuildChangeCurrencyButton({Key? key, required this.data}) : super(key: key);
  final ChangeCurrencyData data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.r),
      child: DefaultButton(
        onTap: ()=>data.changeCurrency(),
        title: tr(context, "currencyTransfer"),
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
      ),
    );
  }
}
