import 'package:json_annotation/json_annotation.dart';

part 'nutrient.g.dart';

@JsonSerializable()
class Nutrient {
  int id;
  String number;
  String name;
  int rank;
  // UnitName unitName;

  Nutrient({
    required this.id,
    required this.number,
    required this.name,
    required this.rank,
    // required this.unitName,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) =>
      _$NutrientFromJson(json);

  Map<String, dynamic> toJson() => _$NutrientToJson(this);
}
