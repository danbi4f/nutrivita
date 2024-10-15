// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_attribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodAttribute _$FoodAttributeFromJson(Map<String, dynamic> json) =>
    FoodAttribute(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      value: json['value'] as String,
      foodAttributeType: FoodAttributeType.fromJson(
          json['foodAttributeType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FoodAttributeToJson(FoodAttribute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
      'foodAttributeType': instance.foodAttributeType,
    };
