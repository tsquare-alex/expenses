import 'package:expenses/user/models/transaction_type_model/transaction_content_model.dart';
import 'package:hive/hive.dart';

part 'transaction_type_model.g.dart';

@HiveType(typeId:0)
class TransactionTypeModel extends HiveObject{
  @HiveField(0)
  String? name;
  @HiveField(1)
  List<TransactionContentModel>? content;

  bool? isSelected;
  TransactionTypeModel({ this.name,this.content,this.isSelected=false});
}