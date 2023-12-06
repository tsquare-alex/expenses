import 'package:json_annotation/json_annotation.dart'; 

part 'country_model.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class CountryModel {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;

  CountryModel({this.id, this.name});

   factory CountryModel.fromJson(Map<String, dynamic> json) => _$CountryModelFromJson(json);

   Map<String, dynamic> toJson() => _$CountryModelToJson(this);
}

