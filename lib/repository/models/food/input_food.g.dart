// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InputFood _$InputFoodFromJson(Map<String, dynamic> json) => InputFood(
      id: (json['id'] as num).toInt(),
      unit: json['unit'] as String,
      portionDescription: json['portionDescription'] as String,
      portionCode: json['portionCode'] as String,
      foodDescription: json['foodDescription'] as String,
      sequenceNumber: (json['sequenceNumber'] as num).toInt(),
      ingredientDescription: json['ingredientDescription'] as String,
      ingredientWeight: (json['ingredientWeight'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      ingredientCode: (json['ingredientCode'] as num).toInt(),
    );

Map<String, dynamic> _$InputFoodToJson(InputFood instance) => <String, dynamic>{
      'id': instance.id,
      'unit': instance.unit,
      'portionDescription': instance.portionDescription,
      'portionCode': instance.portionCode,
      'foodDescription': instance.foodDescription,
      'sequenceNumber': instance.sequenceNumber,
      'ingredientDescription': instance.ingredientDescription,
      'ingredientWeight': instance.ingredientWeight,
      'amount': instance.amount,
      'ingredientCode': instance.ingredientCode,
    };
