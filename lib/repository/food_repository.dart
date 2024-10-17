import 'package:nutrivita/repository/models/category/category_item.dart';
import 'package:nutrivita/repository/models/food/food.dart';
import 'package:nutrivita/repository/services/food_service.dart';

class FoodRepository {
  FoodRepository({
    required this.foodService,
  });

  FoodService foodService;

  Future<Food> getFoodJson() async => foodService.getFoodJson();

  Future<List<CategoryNutrient>> getCategoryNutrient() async =>
      foodService.getCategoryNutrient();
}
