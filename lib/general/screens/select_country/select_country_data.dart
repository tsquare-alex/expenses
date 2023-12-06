part of 'select_country_imports.dart';

class SelectCountryData{
  final GlobalKey<DropdownSearchState> countryDropKey = GlobalKey();


  //
  int? countryId;
  CountryModel? selectedCountry;

  List<CountryModel> countries=[
    CountryModel(
        id:12,name:"مصر"
    ),
    CountryModel(
        id:11,name:"السعودية"
    ),
    CountryModel(
        id:10,name:"الامارات"
    ),
  ];

  Future<List<CountryModel>> getCountries(BuildContext context) async {
    return countries;
  }

  void setSelectCountry(CountryModel? model) {
    selectedCountry = model;
    countryId = model?.id;
  }

}