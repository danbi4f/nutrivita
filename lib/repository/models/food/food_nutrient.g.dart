// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_nutrient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodNutrient _$FoodNutrientFromJson(Map<String, dynamic> json) => FoodNutrient(
      id: (json['id'] as num).toInt(),
      nutrient: Nutrient.fromJson(json['nutrient'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$FoodNutrientToJson(FoodNutrient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nutrient': instance.nutrient,
      'amount': instance.amount,
    };
