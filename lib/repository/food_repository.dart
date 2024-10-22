import 'package:nutrivita/repository/models/category/category_item.dart';
import 'package:nutrivita/repository/models/food/food.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';
import 'package:nutrivita/repository/services/database_service.dart';
import 'package:nutrivita/repository/services/food_service.dart';
import 'package:sqflite/sqflite.dart';

class FoodRepository {
  FoodRepository({
    required this.foodService,
  });

  final FoodService foodService;

// ---------------------------------------------------------------------------------------------------
  Future<Food> getFoodJson() async => foodService.getFoodJson();

// ---------------------------------------------------------------------------------------------------
  Future<List<CategoryNutrient>> getCategoryNutrient() async =>
      foodService.getCategoryNutrient();

// ---------------------------------------------------------------------------------------------------
  Future<Database> getDatabase() async =>
      DatabaseService.instance.getDatabase();

// ---------------------------------------------------------------------------------------------------
  // Pobranie wszystkich ID zapisanych w bazie danych
  Future<List<int>> getAllSurveyFoodsDB() async =>
      DatabaseService.instance.getAllSurveyFoodIds();

// ---------------------------------------------------------------------------------------------------
  // Zapisanie ID do bazy danych
  Future<void> insertSurveyFoodDB(int fdcId) async =>
      DatabaseService.instance.insertSurveyFoodId(fdcId);

// ---------------------------------------------------------------------------------------------------
  // Pobranie pełnych danych SurveyFood na podstawie ID
  Future<SurveyFood> getSurveyFoodById(int id) async {
    final foodJson = await getFoodJson();
    // Zakładając, że foodJson zawiera dane i możesz znaleźć SurveyFood na podstawie id
    return foodJson.surveyFoods.firstWhere((food) => food.fdcId == id);
  }

// ---------------------------------------------------------------------------------------------------
  Future<void> removeSurveyFoodDB(int fdcId) async =>
      DatabaseService.instance.removeSurveyFoodId(fdcId);
      
// ---------------------------------------------------------------------------------------------------      
}

