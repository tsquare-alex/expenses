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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                HeaderLogo(topPadding: 100.r,image: Res.country,),
                const BuildSelectCountryText(),
                BuildSelectCountryInput(selectCountryData: data,),
              ],
            ),
            const BuildSelectCountryButtons()
          ],
        ),
      ),
    );
  }
}
