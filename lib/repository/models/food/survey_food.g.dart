// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SurveyFood _$SurveyFoodFromJson(Map<String, dynamic> json) => SurveyFood(
      foodClass: json['foodClass'] as String,
      description: json['description'] as String,
      foodNutrients: (json['foodNutrients'] as List<dynamic>)
          .map((e) => FoodNutrient.fromJson(e as Map<String, dynamic>))
          .toList(),
      foodAttributes: (json['foodAttributes'] as List<dynamic>)
          .map((e) => FoodAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      foodCode: json['foodCode'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      wweiaFoodCategory: WweiaFoodCategory.fromJson(
          json['wweiaFoodCategory'] as Map<String, dynamic>),
      foodPortions: (json['foodPortions'] as List<dynamic>)
          .map((e) => FoodPortion.fromJson(e as Map<String, dynamic>))
          .toList(),
      publicationDate: json['publicationDate'] as String,
      inputFoods: (json['inputFoods'] as List<dynamic>)
          .map((e) => InputFood.fromJson(e as Map<String, dynamic>))
          .toList(),
      fdcId: (json['fdcId'] as num).toInt(),
      dataType: json['dataType'] as String,
    );

Map<String, dynamic> _$SurveyFoodToJson(SurveyFood instance) =>
    <String, dynamic>{
      'foodClass': instance.foodClass,
      'description': instance.description,
      'foodCode': instance.foodCode,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'publicationDate': instance.publicationDate,
      'fdcId': instance.fdcId,
      'dataType': instance.dataType,
      'foodNutrients': instance.foodNutrients,
      'foodAttributes': instance.foodAttributes,
      'inputFoods': instance.inputFoods,
      'foodPortions': instance.foodPortions,
      'wweiaFoodCategory': instance.wweiaFoodCategory,
    };
