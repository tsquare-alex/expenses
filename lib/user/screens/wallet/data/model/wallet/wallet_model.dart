import 'package:expenses/user/screens/wallet/data/model/wallet_category/category_model.dart';
import 'package:hive_flutter/adapters.dart';

part 'wallet_model.g.dart';

@HiveType(typeId: 13)
class WalletModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  double balance;
  @HiveField(2)
  String openDate;
  @HiveField(3)
  String closedDate;
  @HiveField(4)
  String encomeSource;
  @HiveField(5)
  String valueCategory;
  @HiveField(6)
  bool? currancyChange;
  @HiveField(7)
  bool? walletRepate;
  @HiveField(8)
  bool? notification;
  @HiveField(9)
  bool? isClosed;
  @HiveField(10)
  bool? isHide;
  @HiveField(11)
  String category;
  @HiveField(12)
  bool? checkedValue;
  @HiveField(13)
  String? paymentMethod;
  @HiveField(14)
  CategoryModel? model;
  @HiveField(15)
  bool? isFavorite;
  @HiveField(16)
  String addNote;
  @HiveField(17)
  String? iconPath;
  @HiveField(18)
  String currency;
  @HiveField(19)
  double currencyValue;
  @HiveField(20)
  double? totalBalance;
  @HiveField(21)
  double? remainTotalBalance;
  @HiveField(22)
  double? remainBalance;
  @HiveField(23)
  String? repeatWallet;

  WalletModel({
    required this.name,
    required this.balance,
    required this.openDate,
    required this.closedDate,
    required this.encomeSource,
    required this.valueCategory,
    this.currancyChange,
    this.walletRepate,
    this.notification,
    required this.category,
    this.isClosed = false,
    this.isHide = false,
    this.checkedValue = false,
    this.paymentMethod,
    this.model,
    this.isFavorite = false,
    required this.addNote,
    this.iconPath,
    required this.currency,
    required this.currencyValue,
    this.totalBalance,
    this.remainBalance = 0.0,
    this.remainTotalBalance = 0.0,
    this.repeatWallet,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'balance': balance,
      'openDate': openDate,
      'closedDate': closedDate,
      'encomeSource': encomeSource,
      'valueCategory': valueCategory,
      'currancyChange': currancyChange,
      'walletRepate': walletRepate,
      'notification': notification,
      'isClosed': isClosed,
      'isHide': isHide,
      'category': category,
      'checkedValue': checkedValue,
      'paymentMethod': paymentMethod,
      'model': model?.toJson(),
      'isFavorite': isFavorite,
      'addNote': addNote,
      'iconPath': iconPath,
      'currency': currency,
      'currencyValue': currencyValue,
      'totalBalance': totalBalance,
      'remainBalance': remainBalance,
      'remainTotalBalance': remainTotalBalance,
    };
  }

  factory WalletModel.fromJson(Map<String, dynamic> json) {
    return WalletModel(
      name: json['name'],
      balance: json['balance'],
      openDate: json['openDate'],
      closedDate: json['closedDate'],
      encomeSource: json['encomeSource'],
      valueCategory: json['valueCategory'],
      currancyChange: json['currancyChange'],
      walletRepate: json['walletRepate'],
      notification: json['notification'],
      isClosed: json['isClosed'],
      isHide: json['isHide'],
      category: json['category'],
      checkedValue: json['checkedValue'],
      paymentMethod: json['paymentMethod'],
      model:
          json['model'] != null ? CategoryModel.fromJson(json['model']) : null,
      isFavorite: json['isFavorite'],
      addNote: json['addNote'],
      iconPath: json['iconPath'],
      currency: json['currency'],
      currencyValue: json['currencyValue'],
      totalBalance: json['totalBalance'],
      remainBalance: json['remainBalance'],
      remainTotalBalance: json['remainTotalBalance'],
    );
  }
}
