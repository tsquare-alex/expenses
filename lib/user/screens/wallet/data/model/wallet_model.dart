import 'package:hive_flutter/adapters.dart';
part 'wallet_model.g.dart';

@HiveType(typeId: 8)
class WalletModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  double balance;
  @HiveField(2)
  String paymentMethod;

  WalletModel(
      {required this.name,
      required this.balance,
      required this.paymentMethod});
}
