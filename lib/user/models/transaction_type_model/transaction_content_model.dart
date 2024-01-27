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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      "selected":selected,
    };
  }

  factory TransactionContentModel.fromJson(Map<String, dynamic> json) {
    return TransactionContentModel(
      name: json['name'],
      image: json['image'],
      selected: json['selected'],
    );
  }

}