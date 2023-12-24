part of 'select_currency_imports.dart';

class SelectCurrencyData{
  final GlobalKey<DropdownSearchState> currencyDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> subCurrencyDropKey = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController valueController = TextEditingController();

  //
  int? currencyId;
  int? subCurrencyId;
  DropdownModel? selectedCurrency;
  DropdownModel? selectedSubCurrency;

  List<DropdownModel> currencies=[
    DropdownModel(
        id:0,name:"الجنيه المصري"
    ),
    DropdownModel(
        id:1,name:"الريال السعودي"
    ),
    DropdownModel(
        id:2,name:"الريال السعودي"
    ),
  ];
  List<DropdownModel> subCurrencies=[
    DropdownModel(
        id:0,name:"الجنيه المصري"
    ),
    DropdownModel(
        id:1,name:"الريال السعودي"
    ),
    DropdownModel(
        id:2,name:"الريال السعودي"
    ),
  ];

  Future<List<DropdownModel>> getCurrencies(BuildContext context) async {
    return currencies;
  }
  Future<List<DropdownModel>> getSubCurrencies(BuildContext context) async {
    return subCurrencies;
  }

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
      CurrencyModel model = CurrencyModel(mainCurrency: selectedCurrency?.name??"",
        subCurrency: selectedSubCurrency?.name??"",
        value: value,);
      if (currencyList.isEmpty) {
        currencyBox.add(model!);
      } else {
        var myBox = currencyBox.getAt(0);
        myBox?.mainCurrency =
        selectedCurrency != null ? "${selectedCurrency?.name}" : myBox
            .mainCurrency;
        myBox?.subCurrency =
        selectedSubCurrency != null ? "${selectedSubCurrency?.name}" : myBox
            .mainCurrency;
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