import 'package:nutrivita/repository/models/food/nutrient.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_nutrient.g.dart';

@JsonSerializable()
class FoodNutrient {
  // FoodType type;
  int id;
  Nutrient nutrient;
  double amount;

  FoodNutrient({
    // required this.type,
    required this.id,
    required this.nutrient,
    required this.amount,
  });

  factory FoodNutrient.fromJson(Map<String, dynamic> json) =>
      _$FoodNutrientFromJson(json);

  Map<String, dynamic> toJson() => _$FoodNutrientToJson(this);
}
