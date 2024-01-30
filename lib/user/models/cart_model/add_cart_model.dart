import 'dart:typed_data';

import 'package:expenses/user/models/cart_model/cart_content_model.dart';
import 'package:expenses/user/models/cart_model/cart_type_model.dart';
import 'package:expenses/user/models/radio_model/radio_model.dart';
import 'package:hive/hive.dart';

part 'add_cart_model.g.dart';

@HiveType(typeId: 167)
class AddCartModel extends HiveObject{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? address;
  @HiveField(2)
  String? dateCreated;
  @HiveField(3)
  String? date;
  @HiveField(4)
  String? time;
  @HiveField(5)
  double? number;
  @HiveField(6)
  double? amount;
  @HiveField(7)
  String? brand;
  @HiveField(8)
  String? type;
  @HiveField(9)
  double? estimatedValue;
  @HiveField(10)
  double? total;
  @HiveField(11)
  Uint8List? image;
  @HiveField(12)
  String? description;
  @HiveField(13)
  CartTypeModel? typeModel;
  @HiveField(14)
  CartContentModel? contentModel;
  @HiveField(15)
  RadioModel? cartType;
  @HiveField(16)
  bool? isCompleted;

  AddCartModel({
    this.name,
    this.address,
    this.type,
    this.image,
    this.description,
    this.total,
    this.time,
    this.amount,
    this.number,
    this.brand,
    this.date,
    this.dateCreated,
    this.estimatedValue,
    this.typeModel,
    this.contentModel,
    this.cartType,
    this.isCompleted=false,
  });
}
