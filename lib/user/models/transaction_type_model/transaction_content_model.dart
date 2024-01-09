import 'package:hive/hive.dart';

part 'transaction_content_model.g.dart';

@HiveType(typeId:1)
class TransactionContentModel extends HiveObject{
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? image;
  @HiveField(2)
  bool? selected;

  TransactionContentModel({this.name,this.image,this.selected=false});

}