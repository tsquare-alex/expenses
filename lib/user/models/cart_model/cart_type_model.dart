import 'package:expenses/user/models/cart_model/cart_content_model.dart';
import 'package:hive/hive.dart';

part 'cart_type_model.g.dart';

@HiveType(typeId:158)
class CartTypeModel extends HiveObject{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? image;
  @HiveField(2)
  List<CartContentModel>? content;


  CartTypeModel({ this.name,this.image,this.content});
}