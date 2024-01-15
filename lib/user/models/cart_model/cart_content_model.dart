import 'package:hive/hive.dart';

part 'cart_content_model.g.dart';

@HiveType(typeId:152)
class CartContentModel extends HiveObject{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? image;

  CartContentModel({this.name,this.image,});

}