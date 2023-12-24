part of 'select_country_widgets_imports.dart';

class BuildSelectCountryButtons extends StatelessWidget {
  const BuildSelectCountryButtons({Key? key, required this.data}) : super(key: key);
  final SelectCountryData data;
  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onTap: ()=>data.addCountry(context),
      title: tr(context, "save"),
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
      textColor: MyColors.white,
    );
  }
}
