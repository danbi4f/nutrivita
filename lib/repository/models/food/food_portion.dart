import 'package:nutrivita/repository/models/food/measure_unit.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_portion.g.dart';

@JsonSerializable()
class FoodPortion {
  int id;
  MeasureUnit measureUnit;
  String modifier;
  double gramWeight;
  int sequenceNumber;
  String portionDescription;

  FoodPortion({
    required this.id,
    required this.measureUnit,
    required this.modifier,
    required this.gramWeight,
    required this.sequenceNumber,
    required this.portionDescription,
  });

  factory FoodPortion.fromJson(Map<String, dynamic> json) =>
      _$FoodPortionFromJson(json);

  Map<String, dynamic> toJson() => _$FoodPortionToJson(this);
}
