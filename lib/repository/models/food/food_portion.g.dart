// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_portion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodPortion _$FoodPortionFromJson(Map<String, dynamic> json) => FoodPortion(
      id: (json['id'] as num).toInt(),
      measureUnit:
          MeasureUnit.fromJson(json['measureUnit'] as Map<String, dynamic>),
      modifier: json['modifier'] as String,
      gramWeight: (json['gramWeight'] as num).toDouble(),
      sequenceNumber: (json['sequenceNumber'] as num).toInt(),
      portionDescription: json['portionDescription'] as String,
    );

Map<String, dynamic> _$FoodPortionToJson(FoodPortion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'measureUnit': instance.measureUnit,
      'modifier': instance.modifier,
      'gramWeight': instance.gramWeight,
      'sequenceNumber': instance.sequenceNumber,
      'portionDescription': instance.portionDescription,
    };
