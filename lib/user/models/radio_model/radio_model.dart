import 'package:hive/hive.dart';

part 'radio_model.g.dart';

@HiveType(typeId:191)
class RadioModel{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? image;

  bool active;


  RadioModel({
    required this.id,
    required this.title,
    this.active=false,
    this.image,
  });


}