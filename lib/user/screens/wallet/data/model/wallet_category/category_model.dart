import 'package:hive_flutter/adapters.dart';

part 'category_model.g.dart';

@HiveType(typeId: 133)
class CategoryModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? imagePath;

  CategoryModel({this.imagePath, this.name});
}
