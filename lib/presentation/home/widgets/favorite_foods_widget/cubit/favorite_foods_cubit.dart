import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart'; // Import do użycia compute
import 'package:nutrivita/repository/food_repository.dart';
import 'package:nutrivita/repository/models/food/food.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';

part 'favorite_foods_state.dart';

class FavoriteFoodsCubit extends Cubit<FavoriteFoodsState> {
  FavoriteFoodsCubit({required this.foodRepository}) : super(const FavoriteFoodsState());

  final FoodRepository foodRepository;

  Future<void> addFavoriteFood(int foodId) async {
    try {
      emit(state.copyWith(status: FavoriteFoodsStatus.loading));
      await foodRepository.insertSurveyFoodDB(foodId);
      await loadFavoriteFoods(); // Załaduj ulubione po dodaniu
    } catch (e) {
      emit(state.copyWith(status: FavoriteFoodsStatus.error));
    }
  }

  Future<void> removeFavoriteFood(int foodId) async {
    try {
      emit(state.copyWith(status: FavoriteFoodsStatus.loading));
      await foodRepository.removeSurveyFoodDB(foodId);
      await loadFavoriteFoods(); // Załaduj ulubione po usunięciu
    } catch (e) {
      emit(state.copyWith(status: FavoriteFoodsStatus.error));
    }
  }

  Future<void> loadFavoriteFoods() async {
    try {
      emit(state.copyWith(status: FavoriteFoodsStatus.loading));
      
      final List<int> favoriteFoodIds = await foodRepository.getAllSurveyFoodsDB();
      final Food foodData = await foodRepository.getFoodJson();

      // Użycie compute do przetwarzania ulubionych produktów
      final List<SurveyFood> favoriteFoods = await compute(_filterFavoriteFoods, 
          {'favoriteFoodIds': favoriteFoodIds, 'surveyFoods': foodData.surveyFoods});

      emit(state.copyWith(
        surveyFoodIds: favoriteFoodIds,
        surveyFood: favoriteFoods,
        status: FavoriteFoodsStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: FavoriteFoodsStatus.error));
    }
  }

  // Funkcja do przetwarzania ulubionych produktów w izolatorem
  static List<SurveyFood> _filterFavoriteFoods(Map<String, dynamic> args) {
    final List<int> favoriteFoodIds = args['favoriteFoodIds'] as List<int>;
    final List<SurveyFood> surveyFoods = args['surveyFoods'] as List<SurveyFood>;

    // Filtrowanie ulubionych produktów
    return surveyFoods.where((food) => favoriteFoodIds.contains(food.fdcId)).toList();
  }
}
