import 'package:json_annotation/json_annotation.dart';

part 'measure_unit.g.dart';

@JsonSerializable()
class MeasureUnit {
  int id;
  String name;
  String abbreviation;

  MeasureUnit({
    required this.id,
    required this.name,
    required this.abbreviation,
  });

  factory MeasureUnit.fromJson(Map<String, dynamic> json) =>
      _$MeasureUnitFromJson(json);

  Map<String, dynamic> toJson() => _$MeasureUnitToJson(this);
}
