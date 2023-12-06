part of 'select_currency_widgets_imports.dart';

class BuildSelectCurrencyInput extends StatelessWidget {
  const BuildSelectCurrencyInput({Key? key, required this.currencyData}) : super(key: key);
  final SelectCurrencyData currencyData;
  @override
  Widget build(BuildContext context) {
    return DropdownTextField<CurrencyModel>(
      dropKey: currencyData.currencyDropKey,
      label: "العملة",
      selectedItem: currencyData.selectedCurrency,
      margin: const EdgeInsets.symmetric(vertical: 5),
      validate: (value) {
        if(value==null){
          print("Please fill this field");
        }
      },
      onChange: currencyData.setSelectCurrency,
      finData: (data) => currencyData.getCurrencies(context),
      useName: true,
      buttonsColor: MyColors.yellow,
      searchHint: "بحث",
    );
  }
}
