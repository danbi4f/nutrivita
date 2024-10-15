import 'package:nutrivita/repository/models/food/food_attribute_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_attribute.g.dart';

@JsonSerializable()
class FoodAttribute {
  int id;
  String? name;
  String value;
  FoodAttributeType foodAttributeType;

  FoodAttribute({
    required this.id,
    this.name,
    required this.value,
    required this.foodAttributeType,
  });

  factory FoodAttribute.fromJson(Map<String, dynamic> json) =>
      _$FoodAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$FoodAttributeToJson(this);
}
