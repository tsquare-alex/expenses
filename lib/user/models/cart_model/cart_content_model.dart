import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';

part 'cart_content_model.g.dart';

@HiveType(typeId:152)
class CartContentModel extends HiveObject{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? image;


  PageRouteInfo? pageRouteInfo;

  CartContentModel({this.name,this.image,this.pageRouteInfo,});

}