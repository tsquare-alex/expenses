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
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => AutoRouter.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: context.watch<AppThemeCubit>().isDarkMode
                ? MyColors.white
                : MyColors.black,
          ),
        ),
        backgroundColor: context.watch<AppThemeCubit>().isDarkMode
            ? AppDarkColors.backgroundColor
            :MyColors.white,

        centerTitle: true,
        title: MyText(
          title: tr(context, "currencyTransfer"),
          color:context.watch<AppThemeCubit>().isDarkMode
              ? MyColors.white
              :MyColors.black,
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
