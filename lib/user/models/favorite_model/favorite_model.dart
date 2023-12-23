import 'package:hive/hive.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 6)
class FavoriteModel {
  @HiveField(0)
  String toolName;

  FavoriteModel({required this.toolName});
}
