import 'dart:typed_data';

import 'package:expenses/user/models/database_model/database_model.dart';
import 'package:expenses/user/models/dropdown_model/dropdown_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_content_model.dart';
import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart';
import 'package:expenses/user/screens/budget/data/model/budget_model.dart';
import 'package:expenses/user/screens/wallet/data/model/wallet/wallet_model.dart';
import 'package:hive/hive.dart';

part 'add_transaction_model.g.dart';

@HiveType(typeId: 2)
class AddTransactionModel extends HiveObject {
  @HiveField(0)
  String? transactionName;
  @HiveField(1)
  TransactionTypeModel? transactionType;
  @HiveField(2)
  TransactionContentModel? transactionContent;
  @HiveField(3)
  WalletModel? incomeSource;
  @HiveField(4)
  DropdownModel? unit;
  @HiveField(5)
  String? amount;
  @HiveField(6)
  String? total;
  @HiveField(7)
  DatabaseModel? database;
  @HiveField(8)
  DropdownModel? priority;
  @HiveField(9)
  String? transactionDate;
  @HiveField(10)
  String? time;
  @HiveField(11)
  TransactionTypeModel? cashTransactionType;
  @HiveField(12)
  String? endDate;
  @HiveField(13)
  DropdownModel? repeated;
  @HiveField(14)
  bool? notify;
  @HiveField(15)
  String? brandName;
  @HiveField(16)
  Uint8List? image;
  @HiveField(17)
  String? startDate;
  @HiveField(18)
  String? targetValue;
  @HiveField(19)
  TransactionTypeModel? targetType;
  @HiveField(20)
  BudgetModel? budget;
  @HiveField(21)
  double? requiredValue;
  @HiveField(22)
  double? initialValue;
  @HiveField(23)
  bool? completedNotify;
  @HiveField(24)
  bool? putReminderInWallet;
  @HiveField(25)
  DropdownModel? ratio;
  @HiveField(26)
  String? description;
  @HiveField(27)
  double? initialStaticValue;
  @HiveField(28)
  String? id;

  AddTransactionModel({this.id,this.transactionName,this.transactionType,this.image,this.database,this.unit,this.total,this.amount,this.time,this.brandName,this.endDate,this.incomeSource,this.notify,this.priority,this.repeated,this.startDate,this.targetValue,this.transactionContent,this.transactionDate,this.targetType,this.cashTransactionType,this.budget,this.initialValue,this.requiredValue,this.completedNotify,this.putReminderInWallet,this.ratio,this.description,this.initialStaticValue});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'transactionName': transactionName,
      'transactionType': transactionType?.toJson(),
      'transactionContent': transactionContent?.toJson(),
      'incomeSource': incomeSource?.toJson(),
      'unit': unit?.toJson(),
      'amount': amount,
      'total': total,
      'database': database,
      'priority': priority?.toJson(),
      'transactionDate': transactionDate,
      'time': time,
      'cashTransactionType': cashTransactionType?.toJson(),
      'endDate': endDate,
      'repeated': repeated?.toJson(),
      'notify': notify,
      'brandName': brandName,
      'image': image,
      'startDate': startDate,
      'targetType': targetType?.toJson(),
      'budget': budget?.toJson(),
      'requiredValue': requiredValue,
      'initialValue': initialValue,
      'initialStaticValue': initialStaticValue,
      'completedNotify': completedNotify,
      'putReminderInWallet': putReminderInWallet,
      'ratio': ratio?.toJson(),
      'description': description,
    };
  }
  factory AddTransactionModel.fromJson(Map<String, dynamic> json) {
    return AddTransactionModel(
      id: json['id'],
      transactionName: json['transactionName'],
      transactionType: TransactionTypeModel.fromJson(json['transactionType']),
      transactionContent: TransactionContentModel.fromJson(json['transactionContent']),
      incomeSource: WalletModel.fromJson(json['incomeSource']),
      unit: DropdownModel.fromJson(json['unit']),
      amount: json['amount'],
      total: json['total'],
      database: DatabaseModel.fromJson(json['database']),
      priority: DropdownModel.fromJson(json['priority']),
      transactionDate: json['transactionDate'],
      time: json['time'],
      cashTransactionType: TransactionTypeModel.fromJson(json['cashTransactionType']),
      endDate: json['endDate'],
      repeated: DropdownModel.fromJson(json['repeated']),
      notify: json['notify'],
      brandName: json['brandName'],
      image: Uint8List.fromList(json['image'] ?? []),
      startDate: json['startDate'],
      targetValue: json['targetValue'],
      targetType: TransactionTypeModel.fromJson(json['targetType']),
      budget: BudgetModel.fromJson(json['budget']),
      requiredValue: json['requiredValue'],
      initialValue: json['initialValue'],
      initialStaticValue: json['initialStaticValue'],
      completedNotify: json['completedNotify'],
      putReminderInWallet: json['putReminderInWallet'],
      ratio: DropdownModel.fromJson(json['ratio']),
      description: json['description'],
    );
  }
}