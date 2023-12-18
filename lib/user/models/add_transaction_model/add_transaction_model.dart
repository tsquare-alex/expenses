import 'dart:typed_data';

import 'package:expenses/user/models/dropdown_model/dropdown_model.dart';
import 'package:hive/hive.dart';

part 'add_transaction_model.g.dart';

@HiveType(typeId:2)
class AddTransactionModel extends HiveObject{
  @HiveField(0)
  String? transactionName;
  @HiveField(1)
  String? transactionType;
  @HiveField(2)
  String? transactionContent;
  @HiveField(3)
  DropdownModel? incomeSource;
  @HiveField(4)
  String? unit;
  @HiveField(5)
  double? amount;
  @HiveField(6)
  double? total;
  @HiveField(7)
  DropdownModel? commitmentParty;
  @HiveField(8)
  String? priority;
  @HiveField(9)
  String? transactionDate;
  @HiveField(10)
  String? time;
  @HiveField(11)
  String? startDate;
  @HiveField(12)
  String? endDate;
  @HiveField(13)
  String? repeated;
  @HiveField(14)
  bool? notify;
  @HiveField(15)
  DropdownModel? shoppingParty;
  @HiveField(16)
  String? brandName;
  @HiveField(17)
  Uint8List? image;
  @HiveField(18)
  String? startValue;
  @HiveField(19)
  String? targetValue;
  @HiveField(20)
  DropdownModel? transferTo;




  AddTransactionModel({this.transactionName,this.transactionType,this.image,this.shoppingParty,this.commitmentParty,this.unit,this.total,this.amount,this.time,this.brandName,this.endDate,this.incomeSource,this.notify,this.priority,this.repeated,this.startDate,this.startValue,this.targetValue,this.transactionContent,this.transactionDate,this.transferTo,});

}