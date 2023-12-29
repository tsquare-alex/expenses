import 'package:expenses/user/models/dropdown_model/dropdown_model.dart';
import 'package:hive/hive.dart';

part 'bag_model.g.dart';

@HiveType(typeId:44)
class BagModel {
  @HiveField(0)
  String? type;
  @HiveField(1)
  DropdownModel? priority;
  @HiveField(2)
  double? amount;
  @HiveField(3)
  DropdownModel? unit;
  @HiveField(4)
  bool? completed;

  BagModel({this.type, this.priority,this.amount,this.unit,this.completed});

}

