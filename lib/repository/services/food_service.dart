import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:nutrivita/repository/models/category/category_item.dart';
import 'package:nutrivita/repository/models/food/food.dart';

class FoodService {
  FoodService();

  final String pathFromAssets =
      'assets/FoodData_Central_survey_food_json_2022-10-28.json';

  Future<Map<String, dynamic>> _loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }

  Future<Food> getFoodJson() async {
    final data = await _loadJsonFromAssets(pathFromAssets);
    return Food.fromJson(data);
  }

  Future<List<CategoryNutrient>> getCategoryNutrient() async {
    final data = await _loadJsonFromAssets(pathFromAssets);
    return List<CategoryNutrient>.from(
      data['SurveyFoods'][0]['foodNutrients'].map(
        (json) => CategoryNutrient.fromJson(
          json['nutrient'],
        ),
      ),
    );
  }
}
