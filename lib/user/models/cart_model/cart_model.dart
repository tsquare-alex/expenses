import 'package:auto_route/auto_route.dart';
import 'package:expenses/user/models/cart_model/cart_type_model.dart';

class CartModel{
  String? name;
  String? image;
  List<CartTypeModel>? content;
  PageRouteInfo? page;

  CartModel({this.name,this.image,this.content,this.page});
}