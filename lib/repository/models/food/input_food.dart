import 'package:json_annotation/json_annotation.dart';

part 'input_food.g.dart';

@JsonSerializable()
class InputFood {
  int id;
  String unit;
  String portionDescription;
  String portionCode;
  String foodDescription;
  int sequenceNumber;
  String ingredientDescription;
  int ingredientWeight;
  int amount;
  int ingredientCode;

  InputFood({
    required this.id,
    required this.unit,
    required this.portionDescription,
    required this.portionCode,
    required this.foodDescription,
    required this.sequenceNumber,
    required this.ingredientDescription,
    required this.ingredientWeight,
    required this.amount,
    required this.ingredientCode,
  });

  factory InputFood.fromJson(Map<String, dynamic> json) =>
      _$InputFoodFromJson(json);

  Map<String, dynamic> toJson() => _$InputFoodToJson(this);
}
