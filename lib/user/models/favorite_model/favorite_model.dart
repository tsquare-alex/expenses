import 'package:hive/hive.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 6)
class FavoriteModel  extends HiveObject{
  @HiveField(0)
  String toolName;

  @HiveField(1)
  String imagePath;

  FavoriteModel({required this.toolName, required this.imagePath});
}
