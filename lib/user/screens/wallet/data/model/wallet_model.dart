import 'package:hive_flutter/adapters.dart';
part 'wallet_model.g.dart';

@HiveType(typeId: 13)
class WalletModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  double balance;
  @HiveField(2)
  int date;
  @HiveField(3)
  int time;
  @HiveField(4)
  String paymentMethod;
  @HiveField(5)
  String category;
  @HiveField(6)
  String encomeSource;
  @HiveField(7)
  String valueCategory;
  @HiveField(8)
  String? repeatWallet;
  @HiveField(9)
  String? walletPeriod;
  @HiveField(10)
  bool? isHide;
  @HiveField(11)
  bool? isClosed;

  WalletModel({
    required this.name,
    required this.balance,
    required this.date,
    required this.time,
    required this.paymentMethod,
    required this.category,
    required this.encomeSource,
    required this.valueCategory,
    this.repeatWallet,
    this.isClosed = false,
    this.isHide = false,
    this.walletPeriod,
  });
}
