

import 'package:hive/hive.dart';

part 'country_model.g.dart';

@HiveType(typeId:44)
class CountryModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  CountryModel({this.id, this.name});

}

