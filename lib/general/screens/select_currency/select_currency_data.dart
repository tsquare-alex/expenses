part of 'select_currency_imports.dart';

class SelectCurrencyData{
  final GlobalKey<DropdownSearchState> currencyDropKey = GlobalKey();


  //
  int? currencyId;
  CurrencyModel? selectedCurrency;

  List<CurrencyModel> currencies=[
    CurrencyModel(
        id:12,name:"الجنيه المصري"
    ),
    CurrencyModel(
        id:11,name:"الريال السعودي"
    ),
  ];

  Future<List<CurrencyModel>> getCurrencies(BuildContext context) async {
    return currencies;
  }

  void setSelectCurrency(CurrencyModel? model) {
    selectedCurrency = model;
    currencyId = model?.id;
  }

}