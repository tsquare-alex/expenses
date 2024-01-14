import 'package:expenses/res.dart';
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
  String? addNote;

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
    this.addNote,
  });
}
