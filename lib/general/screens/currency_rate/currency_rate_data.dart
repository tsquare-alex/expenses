part of 'currency_rate_imports.dart';

class CurrencyRateData{
  final GlobalKey<FormState> formKey = GlobalKey();

  final GenericBloc<bool> editCubit = GenericBloc(false);


  final TextEditingController fromCurrencyController = TextEditingController();
  final TextEditingController valueController = TextEditingController();


  final GlobalKey<DropdownSearchState> currencyDropKey = GlobalKey();


  //
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
}