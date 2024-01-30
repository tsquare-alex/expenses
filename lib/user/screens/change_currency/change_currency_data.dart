part of 'change_currency_imports.dart';

class ChangeCurrencyData{

  GenericBloc<double> currencyCubit = GenericBloc(0.0);


  final TextEditingController valueController = TextEditingController();
  final TextEditingController amountController = TextEditingController();


  final GlobalKey<DropdownSearchState> fromCurrencyDropKey = GlobalKey();
  final GlobalKey<DropdownSearchState> toCurrencyDropKey = GlobalKey();


  //
  double result = 0.0;

  int? currencyId;
  DropdownModel? selectedCurrency;

  List<DropdownModel> currencies = [
    DropdownModel(id: 1, name: "الدولار الأمريكي"),
    DropdownModel(id: 2, name: "اليورو"),
    DropdownModel(id: 3, name: "الجنيه الإسترليني البريطاني"),
    DropdownModel(id: 4, name: "الدولار الكندي"),
    DropdownModel(id: 5, name: "الدولار الأسترالي"),
    DropdownModel(id: 6, name: "الين الياباني"),
    DropdownModel(id: 7, name: "الفرنك السويسري"),
    DropdownModel(id: 8, name: "الدولار النيوزيلندي"),
    DropdownModel(id: 9, name: "الكرونا السويدية"),
    DropdownModel(id: 10, name: "الكرون النرويجية"),
    DropdownModel(id: 11, name: "الكرون الدنماركية"),
    DropdownModel(id: 12, name: "الزلوتي البولندي"),
    DropdownModel(id: 13, name: "الفورنت الهنغاري"),
    DropdownModel(id: 14, name: "الكورونا التشيكية"),
    DropdownModel(id: 15, name: "الليرة التركية"),
    DropdownModel(id: 16, name: "الليف البلغاري"),
    DropdownModel(id: 17, name: "اليورو الروماني"),
    DropdownModel(id: 18, name: "الليتا الليتوانية"),
    DropdownModel(id: 19, name: "اللاتف اللاتفي"),
    DropdownModel(id: 20, name: "الكرون الإستوني"),
    DropdownModel(id: 21, name: "الدولار الهونغ كونغي"),
    DropdownModel(id: 22, name: "الدولار السنغافوري"),
    DropdownModel(id: 23, name: "الريال السعودي"),
    DropdownModel(id: 24, name: "الدرهم الإماراتي"),
    DropdownModel(id: 25, name: "الريال القطري"),
    DropdownModel(id: 26, name: "الدينار الكويتي"),
    DropdownModel(id: 27, name: "الريال العماني"),
    DropdownModel(id: 28, name: "الدينار البحريني"),
    DropdownModel(id: 29, name: "الريال اليمني"),
    DropdownModel(id: 30, name: "الدينار الأردني"),
    DropdownModel(id: 31, name: "الليرة اللبنانية"),
    DropdownModel(id: 32, name: "الدينار الليبي"),
    DropdownModel(id: 33, name: "الدينار التونسي"),
    DropdownModel(id: 34, name: "الدينار الجزائري"),
    DropdownModel(id: 35, name: "الدينار المغربي"),
    DropdownModel(id: 36, name: "الشلن الكيني"),
    DropdownModel(id: 37, name: "الشلن الأوغندي"),
    DropdownModel(id: 38, name: "الشلن التنزاني"),
    DropdownModel(id: 39, name: "الشلن الرواندي"),
    DropdownModel(id: 40, name: "الفرانك البوروندي"),
    DropdownModel(id: 41, name: "الفرانك السيفوازي"),
    DropdownModel(id: 42, name: "الفرانك الرواندي"),
    DropdownModel(id: 43, name: "الشلن الصومالي"),
    DropdownModel(id: 44, name: "الشلن الجنوب السوداني"),
    DropdownModel(id: 45, name: "الدولار الناميبي"),
    DropdownModel(id: 46, name: "الدولار الزمبابوي"),
    DropdownModel(id: 47, name: "الراند الجنوب أفريقي"),
    DropdownModel(id: 48, name: "اللوتي السوازيلندي"),
    DropdownModel(id: 49, name: "الكواشا الزامبي"),
    DropdownModel(id: 50, name: "الكواشا المالاوي"),
    DropdownModel(id: 51, name: "الدولار الهندي"),
    DropdownModel(id: 52, name: "الروبية الباكستانية"),
    DropdownModel(id: 53, name: "الروبية السريلانكية"),
    DropdownModel(id: 54, name: "الروبية النيبالية"),
    DropdownModel(id: 55, name: "الروبية البنغلاديشية"),
    DropdownModel(id: 56, name: "التاكا التايلاندي"),
    DropdownModel(id: 57, name: "البات التايلاندي"),
    DropdownModel(id: 58, name: "الكيب الكمبودي"),
    DropdownModel(id: 59, name: "الدونغ الفيتنامي"),
    DropdownModel(id: 60, name: "الريال الإيراني"),
    DropdownModel(id: 61, name: "الدينار العراقي"),
    DropdownModel(id: 62, name: "الريال اليمني"),
    DropdownModel(id: 63, name: "الدينار الجزائري"),
    DropdownModel(id: 64, name: "الدينار الليبي"),
    DropdownModel(id: 65, name: "الدولار البرمودي"),
    DropdownModel(id: 66, name: "الدولار الباهامي"),
    DropdownModel(id: 67, name: "الدولار الكايماني"),
    DropdownModel(id: 68, name: "الدولار الفيجي"),
    DropdownModel(id: 69, name: "الدولار الغياني"),
    DropdownModel(id: 70, name: "الدولار الجامايكي"),
    DropdownModel(id: 71, name: "الدولار الليبري"),
    DropdownModel(id: 72, name: "الدولار السوري"),
    DropdownModel(id: 73, name: "الجنيه المصري"),
    DropdownModel(id: 74, name: "الجنيه السوداني"),
    DropdownModel(id: 75, name: "الليرة السورية"),
    DropdownModel(id: 76, name: "الليرة اللبنانية"),
    DropdownModel(id: 77, name: "الليرة التركية"),
    DropdownModel(id: 78, name: "الليرة القبرصية"),
    DropdownModel(id: 79, name: "الفرنك الجزر القمر"),
    DropdownModel(id: 80, name: "الفرنك القمري"),
    DropdownModel(id: 81, name: "الفرنك الرواندي"),
    DropdownModel(id: 82, name: "الفرنك السيشلي"),
    DropdownModel(id: 83, name: "الفرنك البوروندي"),
    DropdownModel(id: 84, name: "الفرنك البروني"),
    DropdownModel(id: 85, name: "الفرنك الكونغولي"),
    DropdownModel(id: 86, name: "الفرنك الأفريقي الوسطي"),
    DropdownModel(id: 87, name: "الفرنك الغيني"),
    DropdownModel(id: 88, name: "الفرنك الكوموري"),
    DropdownModel(id: 89, name: "الفرنك الإفريقي الغربي"),
    DropdownModel(id: 90, name: "الشلن الإثيوبي"),
    DropdownModel(id: 91, name: "الشلن الإريتري"),
    DropdownModel(id: 92, name: "الشلن الصومالي"),
    DropdownModel(id: 93, name: "الشلن الجنوب السوداني"),
    DropdownModel(id: 94, name: "الدولار الزيمبابوي"),
    DropdownModel(id: 95, name: "الدولار الناميبي"),
    DropdownModel(id: 96, name: "الدولار البحريني"),
    DropdownModel(id: 97, name: "الدولار السوري"),
    DropdownModel(id: 98, name: "الدولار البرمودي"),
    DropdownModel(id: 99, name: "الدولار الباهامي"),
    DropdownModel(id: 100, name: "الدولار الكايماني"),
  ];


  Future<List<DropdownModel>> getCurrencies(BuildContext context) async {
    return currencies;
  }

  void setSelectCurrency(DropdownModel? model) {
    selectedCurrency = model;
    currencyId = model?.id;
  }

  changeCurrency() {
    double value = double.tryParse(valueController.text)!;
    double amount = double.tryParse(amountController.text)!;
    if (value != null && amount != null) {
      result = value * amount;
      currencyCubit.onUpdateData(result);
    }
  }

}