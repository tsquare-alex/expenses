part of 'main_currency_imports.dart';

class MainCurrencyData{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<DropdownSearchState> currencyDropKey = GlobalKey();

  TextEditingController mainCurrencyController = TextEditingController();


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

  int? currencyId;
  DropdownModel? selectedCurrency;

  void setSelectCurrency(DropdownModel? model) {
    selectedCurrency = model;
    currencyId = model?.id;
  }

  addCurrency(BuildContext context) {
    Box<CurrencyModel> currencyBox = Hive.box<CurrencyModel>('currencyBox');

    var currencyList = currencyBox.values.toList();
    if (formKey.currentState!.validate()) {

      // double value = double.parse(valueController.text);
      CurrencyModel model = CurrencyModel(mainCurrency: currencyCubit.state.data.code,mainCurrencyName: currencyCubit.state.data.name);
      if (currencyList.isEmpty) {
        currencyBox.add(model);
      } else {
        var myBox = currencyBox.getAt(0);
        myBox?.mainCurrency =
            currencyCubit.state.data.code;
        myBox?.mainCurrencyName =
            currencyCubit.state.data.name;
        // myBox?.value = valueController.text.isNotEmpty
        //     ? double.parse(valueController.text)
        //     : myBox.value;
        var key = currencyBox.keyAt(0);
        currencyBox.put(key, myBox!);
        print("ss${currencyList[0].mainCurrency}");
        print(currencyList[0].subCurrency);
        print(currencyList[0].value);
      }
      print("length ${currencyList.length}");
      AutoRouter.of(context).push(const SelectCurrencyRoute());
    }else{
      CustomToast.showSimpleToast(
        msg: "please complete data",
        color: Colors.red,
      );

    }

  }
}