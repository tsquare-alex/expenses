part of 'select_country_imports.dart';

class SelectCountryData {
  final GlobalKey<DropdownSearchState> countryDropKey = GlobalKey();

  //
  int? countryId;
  CountryModel? selectedCountry;

  List<CountryModel> countries = [
    CountryModel(id: 12, name: "مصر"),
    CountryModel(id: 11, name: "السعودية"),
    CountryModel(id: 10, name: "الولايات المتحدة"),
  ];

  Future<List<CountryModel>> getCountries(BuildContext context) async {
    return countries;
  }

  void setSelectCountry(CountryModel? model) {
    selectedCountry = model;
    countryId = model?.id;
  }

  addCountry(BuildContext context) {
    Box<CountryModel> countryBox = Hive.box<CountryModel>('countryBox');
    
    var country = countryBox.values.toList();
    if (selectedCountry==null) {
      CustomToast.showSimpleToast(
        msg: "please select the country",
        color: Colors.red,
      );
    } else {
      if(country.isEmpty){
        countryBox.add(selectedCountry!);
      }else{
        var myBox = countryBox.getAt(0);
        myBox?.name=selectedCountry?.name;
        var key = countryBox.keyAt(0);
        countryBox.put(key, myBox!);
        print(country[0].name);
      }
      print(country.length);
      AutoRouter.of(context).push(const SelectCurrencyRoute());
    }
  }
}
