part of 'change_currency_imports.dart';

class ChangeCurrencyData{

  GenericBloc<double> currencyCubit = GenericBloc(0.0);


  final TextEditingController valueController = TextEditingController();
  final TextEditingController amountController = TextEditingController();


  final GlobalKey<DropdownSearchState> fromCurrencyDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> toCurrencyDropKey = GlobalKey();


  //
  double result = 0.0;

  int? currencyId;
  DropdownModel? selectedCurrency;

  List<DropdownModel> currencies=[
    DropdownModel(
        id:12,name:"الجنيه المصري"
    ),
    DropdownModel(
        id:11,name:"الريال السعودي"
    ),
  ];

  Future<List<DropdownModel>> getCurrencies(BuildContext context) async {
    return currencies;
  }

  void setSelectCurrency(DropdownModel? model) {
    selectedCurrency = model;
    currencyId = model?.id;
  }

  changeCurrency() {
    double value = double.tryParse(valueController.text)!;
    double amount = double.tryParse(amountController.text)!;
    if (value != null && amount != null) {
      result = value * amount;
      currencyCubit.onUpdateData(result);
    }
  }

}