part of 'select_country_widgets_imports.dart';

class BuildSelectCountryInput extends StatelessWidget {
  const BuildSelectCountryInput({Key? key, required this.selectCountryData}) : super(key: key);
  final SelectCountryData selectCountryData;
  @override
  Widget build(BuildContext context) {
    return  DropdownTextField<CountryModel>(
      dropKey: selectCountryData.countryDropKey,
      label: "البلد",
      selectedItem: selectCountryData.selectedCountry,
      margin: const EdgeInsets.symmetric(vertical: 5),
      validate: (value) {
        if(value==null){
          print("Please fill this field");
        }
      },
      onChange: selectCountryData.setSelectCountry,
      finData: (data) => selectCountryData.getCountries(context),
      useName: true,
      buttonsColor: MyColors.primary,
      searchHint: "بحث",
    );
  }
}
