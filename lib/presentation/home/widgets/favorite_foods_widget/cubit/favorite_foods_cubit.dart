import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrivita/repository/food_repository.dart';
import 'package:nutrivita/repository/models/food/food.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';

part 'favorite_foods_state.dart';

class FavoriteFoodsCubit extends Cubit<FavoriteFoodsState> {
  FavoriteFoodsCubit({
    required this.foodRepository,
  }) : super(const FavoriteFoodsState());

  final FoodRepository foodRepository;

  // Dodawanie ID do bazy danych
  Future<void> addFavoriteFood(int foodId) async {
    try {
      await foodRepository.insertSurveyFoodDB(foodId);
      await loadFavoriteFoods(); // Załaduj ulubione po dodaniu
    } catch (e) {
      emit(state.copyWith(status: FavoriteFoodsStatus.error));
    }
  }

  // Usuwanie ID z bazy danych
  Future<void> removeFavoriteFood(int foodId) async {
    try {
      await foodRepository.removeSurveyFoodDB(foodId);
      await loadFavoriteFoods(); // Załaduj ulubione po usunięciu
    } catch (e) {
      emit(state.copyWith(status: FavoriteFoodsStatus.error));
    }
  }

  // Załadowanie ulubionych produktów
  Future<void> loadFavoriteFoods() async {
    try {
      emit(state.copyWith(status: FavoriteFoodsStatus.loading));

      // Pobranie ID ulubionych produktów z bazy danych
      final List<int> favoriteFoodIds =
          await foodRepository.getAllSurveyFoodsDB();

      // Pobranie całego obiektu Food z JSON
      final Food foodData = await foodRepository.getFoodJson();

      // Filtrowanie produktów na podstawie zapisanych ID
      final List<SurveyFood> favoriteFoods = foodData.surveyFoods
          .where((food) => favoriteFoodIds.contains(food.fdcId))
          .toList();

      emit(state.copyWith(
        surveyFoodIds: favoriteFoodIds,
        surveyFood: favoriteFoods,
        status: FavoriteFoodsStatus.success,
      ));
    } catch (e) {
      emit(state.copyWith(status: FavoriteFoodsStatus.error));
    }
  }
}
