part of 'currency_rate_imports.dart';

class CurrencyRate extends StatefulWidget {
  const CurrencyRate({Key? key}) : super(key: key);

  @override
  State<CurrencyRate> createState() => _CurrencyRateState();
}

class _CurrencyRateState extends State<CurrencyRate> {

  CurrencyRateData data = CurrencyRateData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all( 15.r),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  HeaderLogo(topPadding: 100.r,image: Res.currencyExchange,),
                  const BuildCurrencyRateText(),
                  BuildCurrencyRateInput(currencyRateData: data,),
                  BuildAutoEdit(data:data,),
                ],
              ),
              const BuildCurrencyRateButtons()
            ],
          ),
        ),
      ),
    );
  }
}
