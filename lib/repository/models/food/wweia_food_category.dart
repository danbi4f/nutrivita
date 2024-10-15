import 'package:json_annotation/json_annotation.dart';

part 'wweia_food_category.g.dart';

@JsonSerializable()
class WweiaFoodCategory {
  int wweiaFoodCategoryCode;
  String wweiaFoodCategoryDescription;

  WweiaFoodCategory({
    required this.wweiaFoodCategoryCode,
    required this.wweiaFoodCategoryDescription,
  });

  factory WweiaFoodCategory.fromJson(Map<String, dynamic> json) =>
      _$WweiaFoodCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$WweiaFoodCategoryToJson(this);
}
