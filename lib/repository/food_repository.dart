import 'package:nutrivita/repository/models/food/food.dart';
import 'package:nutrivita/repository/services/food_assets_service.dart';

class FoodRepository {
  FoodRepository({
    required this.assetsService,
  });

  FoodAssetsService assetsService;

  Future<Food> getFoodJson() async => assetsService.getFoodJson();
}
