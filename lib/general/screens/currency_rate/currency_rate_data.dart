part of 'currency_rate_imports.dart';

class CurrencyRateData{
  final GlobalKey<FormState> formKey = GlobalKey();

  final GenericBloc<bool> editCubit = GenericBloc(false);


  final TextEditingController fromCurrencyController = TextEditingController();
  final TextEditingController valueController = TextEditingController();


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