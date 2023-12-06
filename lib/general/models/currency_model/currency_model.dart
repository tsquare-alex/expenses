import 'package:json_annotation/json_annotation.dart'; 

part 'currency_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CurrencyModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  CurrencyModel({this.id, this.name});

   factory CurrencyModel.fromJson(Map<String, dynamic> json) => _$CurrencyModelFromJson(json);

   Map<String, dynamic> toJson() => _$CurrencyModelToJson(this);
}

