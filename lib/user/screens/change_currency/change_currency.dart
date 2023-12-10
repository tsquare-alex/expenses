part of 'change_currency_imports.dart';

class ChangeCurrency extends StatefulWidget {
  const ChangeCurrency({Key? key}) : super(key: key);

  @override
  State<ChangeCurrency> createState() => _ChangeCurrencyState();
}

class _ChangeCurrencyState extends State<ChangeCurrency> {

  ChangeCurrencyData data = ChangeCurrencyData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () => AutoRouter.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios,color: MyColors.white,),
        ),
        centerTitle: true,
        title: MyText(
          title: "Change Currency",
          color: MyColors.white,
          size: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildChangeCurrencyInputs(changeCurrencyData: data,),
              BuildChangeCurrencyButton(data: data,),
              BuildChangeCurrencyResult(data: data,),

            ],
          ),
        ),
      ),
    );
  }
}
