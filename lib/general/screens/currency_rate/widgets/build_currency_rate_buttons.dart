part of 'currency_rate_widgets_imports.dart';

class BuildCurrencyRateButtons extends StatelessWidget {
  const BuildCurrencyRateButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DefaultButton(
          onTap: (){},
          title: tr(context, "save"),
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
          textColor: MyColors.white,
          width: 100,
        ),
        DefaultButton(
          onTap: ()=>AutoRouter.of(context).push(const LoginRoute()),
          title: tr(context, "skip"),
          fontWeight: FontWeight.bold,
          fontSize: 14.sp,
          textColor: MyColors.white,
          width: 100,
        ),
      ],
    );
  }
}
