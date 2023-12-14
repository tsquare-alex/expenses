import 'package:hive_flutter/adapters.dart';
part 'wallet_model.g.dart';

@HiveType(typeId: 0)
class WalletModel extends HiveObject {
  @HiveField(0)
  final String walletName;
  @HiveField(1)
  final String balance;
  @HiveField(2)
  final String paymentMethod;

  WalletModel(
      {required this.walletName,
      required this.balance,
      required this.paymentMethod});
}
