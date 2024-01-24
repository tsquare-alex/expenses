
import 'package:hive/hive.dart';

part 'currency_model.g.dart';
@HiveType(typeId: 67)

class CurrencyModel {
  @HiveField(0)
  String? mainCurrency;

  @HiveField(1)
  String? subCurrency;

  @HiveField(2)
  String? mainCurrencyName;

  @HiveField(3)
  String? subCurrencyName;

  @HiveField(4)
  double? value;

  CurrencyModel({ this.mainCurrency,
    this.subCurrency,
    this.value,
    this.mainCurrencyName,
    this.subCurrencyName
  });


}

