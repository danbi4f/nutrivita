// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_attribute_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodAttributeType _$FoodAttributeTypeFromJson(Map<String, dynamic> json) =>
    FoodAttributeType(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$FoodAttributeTypeToJson(FoodAttributeType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
    };
