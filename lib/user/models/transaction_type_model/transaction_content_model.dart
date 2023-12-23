import 'package:hive/hive.dart';

part 'transaction_content_model.g.dart';

@HiveType(typeId:1)
class TransactionContentModel extends HiveObject{
  @HiveField(0)
  String? name;

  TransactionContentModel({this.name,});

}