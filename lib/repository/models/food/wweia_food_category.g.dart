// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wweia_food_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WweiaFoodCategory _$WweiaFoodCategoryFromJson(Map<String, dynamic> json) =>
    WweiaFoodCategory(
      wweiaFoodCategoryCode: (json['wweiaFoodCategoryCode'] as num).toInt(),
      wweiaFoodCategoryDescription:
          json['wweiaFoodCategoryDescription'] as String,
    );

Map<String, dynamic> _$WweiaFoodCategoryToJson(WweiaFoodCategory instance) =>
    <String, dynamic>{
      'wweiaFoodCategoryCode': instance.wweiaFoodCategoryCode,
      'wweiaFoodCategoryDescription': instance.wweiaFoodCategoryDescription,
    };
