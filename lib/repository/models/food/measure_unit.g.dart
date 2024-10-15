// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'measure_unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeasureUnit _$MeasureUnitFromJson(Map<String, dynamic> json) => MeasureUnit(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      abbreviation: json['abbreviation'] as String,
    );

Map<String, dynamic> _$MeasureUnitToJson(MeasureUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'abbreviation': instance.abbreviation,
    };
