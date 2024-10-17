// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryNutrient _$CategoryNutrientFromJson(Map<String, dynamic> json) =>
    CategoryNutrient(
      name: json['name'] as String,
      number: json['number'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$CategoryNutrientToJson(CategoryNutrient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'number': instance.number,
      'id': instance.id,
    };
