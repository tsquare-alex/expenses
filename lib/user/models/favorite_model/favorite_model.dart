import 'package:hive/hive.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 6)
class FavoriteModel {
  @HiveField(0)
  String toolName;

  @HiveField(1)
  int iconCode; // You can change the type as per the IconData

  FavoriteModel({required this.toolName, required this.iconCode});
}
