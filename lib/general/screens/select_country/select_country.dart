part of 'select_country_imports.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({Key? key}) : super(key: key);

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {

  SelectCountryData data = SelectCountryData();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(15.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderLogo(topPadding: 100.r,image: Res.country,color: MyColors.primary,),
              const BuildSelectCountryText(),
              BuildSelectCountryInput(selectCountryData: data,),
              BuildSelectCountryButtons(data: data,),
            ],
          ),
        ),
      ),
    );
  }
}
