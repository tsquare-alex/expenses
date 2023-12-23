
import 'package:hive/hive.dart';

part 'currency_model.g.dart';
@HiveType(typeId: 67)

class CurrencyModel {
  @HiveField(0)
  String mainCurrency;

  @HiveField(1)
  String subCurrency;

  @HiveField(2)
  double value;

  CurrencyModel({required this.mainCurrency,
    required this.subCurrency,
    required this.value,});


}

