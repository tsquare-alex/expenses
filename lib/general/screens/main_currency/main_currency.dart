part of 'main_currency_imports.dart';

class MainCurrency extends StatefulWidget {
  const MainCurrency({Key? key}) : super(key: key);

  @override
  State<MainCurrency> createState() => _MainCurrencyState();
}

class _MainCurrencyState extends State<MainCurrency> {

  MainCurrencyData data = MainCurrencyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  const BuildMainCurrencyText(),
                  BuildMainCurrencyInput(mainCurrencyData: data,),
                ],
              ),
              BuildMainCurrencyButton(data: data,)
            ],
          ),
        ),
      ),
    );
  }
}
