part of 'select_country_widgets_imports.dart';

class BuildSelectCountryButtons extends StatelessWidget {
  const BuildSelectCountryButtons({Key? key, required this.data, required this.fromSetting}) : super(key: key);
  final SelectCountryData data;
  final bool fromSetting;
  @override
  Widget build(BuildContext context) {
    return DefaultButton(
      onTap: ()=>data.addCountry(context,fromSetting),
      title: tr(context, "save"),
      fontWeight: FontWeight.bold,
      fontSize: 14.sp,
      textColor: MyColors.white,
    );
  }
}
