import 'dart:typed_data';

import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:expenses/user/models/dropdown_model/dropdown_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_content_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet_model.dart';
import 'package:hive/hive.dart';

part 'add_transaction_model.g.dart';

@HiveType(typeId:2)
class AddTransactionModel extends HiveObject{
  @HiveField(0)
  String? transactionName;
  @HiveField(1)
  TransactionTypeModel? transactionType;
  @HiveField(2)
  TransactionContentModel? transactionContent;
  @HiveField(3)
  WalletModel? incomeSource;
  @HiveField(4)
  String? unit;
  @HiveField(5)
  String? amount;
  @HiveField(6)
  String? total;
  @HiveField(7)
  DatabaseModel? commitmentParty;
  @HiveField(8)
  String? priority;
  @HiveField(9)
  String? transactionDate;
  @HiveField(10)
  String? time;
  @HiveField(11)
  DropdownModel? cashTransactionType;
  @HiveField(12)
  String? endDate;
  @HiveField(13)
  DropdownModel? repeated;
  @HiveField(14)
  bool? notify;
  @HiveField(15)
  DatabaseModel? shoppingParty;
  @HiveField(16)
  String? brandName;
  @HiveField(17)
  Uint8List? image;
  @HiveField(18)
  String? startDate;
  @HiveField(19)
  String? targetValue;
  @HiveField(20)
  DatabaseModel? transferTo;
  @HiveField(21)
  DropdownModel? targetType;





  AddTransactionModel({this.transactionName,this.transactionType,this.image,this.shoppingParty,this.commitmentParty,this.unit,this.total,this.amount,this.time,this.brandName,this.endDate,this.incomeSource,this.notify,this.priority,this.repeated,this.startDate,this.targetValue,this.transactionContent,this.transactionDate,this.transferTo,this.targetType,this.cashTransactionType});

}