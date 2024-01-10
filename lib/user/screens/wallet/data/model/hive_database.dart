import 'package:hive/hive.dart';

class HiveDB {
  static const String walletCategoryBoxName = 'database_box';

  static Future<void> saveWalletCategories(List<String> walletCategory) async {
    final box = await Hive.openBox(walletCategoryBoxName);
    await box.put('categories', walletCategory);
  }

  static Future<List<String>> getWalletCategories() async {
    final box = await Hive.openBox(walletCategoryBoxName);
    return box.get('categories', defaultValue: []);
  }
}
