import 'package:expenses/user/models/transaction_type_model/transaction_type_model.dart';
import 'package:flutter/material.dart';


class TransactionModel {
  int? id;
  String? name;
  String? image;
  List<TransactionTypeModel>? content;

  bool? isSelected;

  TransactionModel({this.id, this.name,this.image,this.content,this.isSelected=false});


}

