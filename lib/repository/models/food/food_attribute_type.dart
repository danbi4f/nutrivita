import 'package:json_annotation/json_annotation.dart';

part 'food_attribute_type.g.dart';

@JsonSerializable()
class FoodAttributeType {
  int id;
  String name;
  String description;

  FoodAttributeType({
    required this.id,
    required this.name,
    required this.description,
  });
  
  factory FoodAttributeType.fromJson(Map<String, dynamic> json) =>
      _$FoodAttributeTypeFromJson(json);

  Map<String, dynamic> toJson() => _$FoodAttributeTypeToJson(this);
}
