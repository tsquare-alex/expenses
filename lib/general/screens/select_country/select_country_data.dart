part of 'select_country_imports.dart';

class SelectCountryData {
  final GlobalKey<DropdownSearchState> countryDropKey = GlobalKey();
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController countryController = TextEditingController();

  GenericBloc<Country> countryCubit = GenericBloc(Country(
    phoneCode: '+1',
    countryCode: 'US',
    e164Sc: 123,
    geographic: true,
    level: 1,
    name: 'United States',
    example: '1XXXXXXXXXX',
    displayName: 'United States',
    displayNameNoCountryCode: 'United States',
    e164Key: 'E164_KEY_VALUE',
  ));
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
    if (!formKey.currentState!.validate()) {
      CustomToast.showSimpleToast(
        msg: "please select the country",
        color: Colors.red,
      );
    } else {
      CountryModel model = CountryModel(
        id: 0,
        name: countryCubit?.state.data.name,
      );
      if(country.isEmpty){
        countryBox.add(model);
      }else{
        var myBox = countryBox.getAt(0);
        myBox?.name=model.name;
        var key = countryBox.keyAt(0);
        countryBox.put(key, myBox!);
        print(country[0].name);
      }
      print(country.length);
      AutoRouter.of(context).push(const SelectCurrencyRoute());
    }
  }
}
