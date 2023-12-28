part of 'select_currency_imports.dart';

class SelectCurrency extends StatefulWidget {
  const SelectCurrency({Key? key}) : super(key: key);

  @override
  State<SelectCurrency> createState() => _SelectCurrencyState();
}

class _SelectCurrencyState extends State<SelectCurrency> {

  SelectCurrencyData data = SelectCurrencyData();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  HeaderLogo(topPadding: 100.r,image: Res.currency,color: MyColors.primary,),
                  const BuildSelectCurrencyText(),
                  BuildSelectCurrencyInput(currencyData: data,),
                ],
              ),
              BuildSelectCurrencyNextButton(data: data,)
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    data.mainCurrencyController.dispose();
    data.subCurrencyController.dispose();
    data.valueController.dispose();
    super.dispose();
  }
}
