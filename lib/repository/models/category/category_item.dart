import 'package:json_annotation/json_annotation.dart';

part 'category_item.g.dart';

@JsonSerializable()
class CategoryNutrient {
  String name;
  String number;
  int id;

  CategoryNutrient({
    required this.name,
    required this.number,
    required this.id,
  });

    factory CategoryNutrient.fromJson(Map<String, dynamic> json) => _$CategoryNutrientFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryNutrientToJson(this);
}
