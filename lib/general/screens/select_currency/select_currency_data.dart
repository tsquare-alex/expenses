part of 'select_currency_imports.dart';

class SelectCurrencyData{
  final GlobalKey<DropdownSearchState> currencyDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> subCurrencyDropKey = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  TextEditingController mainCurrencyController = TextEditingController();
  TextEditingController subCurrencyController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  
  GenericBloc<Currency> currencyCubit = GenericBloc(
    Currency(
      code: 'EGP',
      name: 'Egyptian Pound',
      symbol: '£',  // You might need to replace this with the correct symbol
      flag: '🇪🇬',
      number: 818,  // The ISO 4217 code for EGP is 818
      decimalDigits: 2,
      namePlural: 'Egyptian Pounds',
      symbolOnLeft: true,
      decimalSeparator: '.',
      thousandsSeparator: ',',
      spaceBetweenAmountAndSymbol: false,
    ));
  GenericBloc<Currency> subCurrencyCubit = GenericBloc( Currency(
    code: 'SAR',
    name: 'Saudi Arabia Riyal',
    symbol: '﷼',  // Use the Unicode character for Saudi Riyal
    flag: '🇸🇦',
    number: 682,
    decimalDigits: 2,
    namePlural: 'Saudi Riyals',
    symbolOnLeft: true,
    decimalSeparator: '.',
    thousandsSeparator: ',',
    spaceBetweenAmountAndSymbol: false,
  ));
  //
  int? currencyId;
  int? subCurrencyId;
  DropdownModel? selectedCurrency;
  DropdownModel? selectedSubCurrency;


  void setSelectCurrency(DropdownModel? model) {
    selectedCurrency = model;
    currencyId = model?.id;
  }
  void setSelectSubCurrency(DropdownModel? model) {
    selectedSubCurrency = model;
    subCurrencyId = model?.id;
  }

  addCurrency(BuildContext context) {
    Box<CurrencyModel> currencyBox = Hive.box<CurrencyModel>('currencyBox');

    var currencyList = currencyBox.values.toList();
    if (formKey.currentState!.validate()) {

      double value = double.parse(valueController.text);
      CurrencyModel model = CurrencyModel(mainCurrency: currencyCubit.state.data.code??"",
        subCurrency: subCurrencyCubit.state.data.code??"",
        value: value,);
      if (currencyList.isEmpty) {
        currencyBox.add(model);
      } else {
        var myBox = currencyBox.getAt(0);
        myBox?.mainCurrency =
            currencyCubit.state.data.code;
        myBox?.subCurrency =
            subCurrencyCubit.state.data.code;
        myBox?.value = valueController.text.isNotEmpty
            ? double.parse(valueController.text)
            : myBox.value;
        var key = currencyBox.keyAt(0);
        currencyBox.put(key, myBox!);
        print(currencyList[0].mainCurrency);
        print(currencyList[0].subCurrency);
        print(currencyList[0].value);
      }
      print(currencyList.length);
      AutoRouter.of(context).push(const LoginRoute());
    }else{
      CustomToast.showSimpleToast(
        msg: "please complete data",
        color: Colors.red,
      );

    }

  }

}