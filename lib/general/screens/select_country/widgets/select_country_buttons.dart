part of 'select_country_widgets_imports.dart';

class BuildSelectCountryButtons extends StatelessWidget {
  const BuildSelectCountryButtons({Key? key}) : super(key: key);

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
          onTap: ()=>AutoRouter.of(context).push(const SelectCurrencyRoute()),
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
