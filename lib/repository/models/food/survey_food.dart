import 'package:nutrivita/repository/models/food/food_attribute.dart';
import 'package:nutrivita/repository/models/food/food_nutrient.dart';
import 'package:nutrivita/repository/models/food/food_portion.dart';
import 'package:nutrivita/repository/models/food/input_food.dart';
import 'package:nutrivita/repository/models/food/wweia_food_category.dart';
import 'package:json_annotation/json_annotation.dart';

part 'survey_food.g.dart';

@JsonSerializable()
class SurveyFood {
  String foodClass;
  String description;
  String foodCode;
  String startDate;
  String endDate;
  String publicationDate;
  int fdcId;
  String dataType;
  
  List<FoodNutrient> foodNutrients;
  List<FoodAttribute> foodAttributes;
  List<InputFood> inputFoods;
  List<FoodPortion> foodPortions;
  WweiaFoodCategory wweiaFoodCategory;

  SurveyFood({
    required this.foodClass,
    required this.description,
    required this.foodNutrients,
    required this.foodAttributes,
    required this.foodCode,
    required this.startDate,
    required this.endDate,
    required this.wweiaFoodCategory,
    required this.foodPortions,
    required this.publicationDate,
    required this.inputFoods,
    required this.fdcId,
    required this.dataType,
  });

  factory SurveyFood.fromJson(Map<String, dynamic> json) =>
      _$SurveyFoodFromJson(json);

  Map<String, dynamic> toJson() => _$SurveyFoodToJson(this);
}
