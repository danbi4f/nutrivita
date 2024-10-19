import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrivita/repository/food_repository.dart';
import 'package:nutrivita/repository/models/food/food.dart';

part 'ranking_nutrient_state.dart';

class RankingNutrientCubit extends Cubit<RankingNutrientState> {
  RankingNutrientCubit({
    required this.foodRepository,
  }) : super( const RankingNutrientState());

  final FoodRepository foodRepository;

  Future<void> getFoods() async {
    try {
      emit(state.copyWith(status: RankingNutrientStatus.loading));

      final food = await foodRepository.getFoodJson();

      emit(state.copyWith(
        food: food,
        status: RankingNutrientStatus.success,
      ));
    } catch (error) {
      print('Error fetching foods: $error');
      emit(state.copyWith(status: RankingNutrientStatus.error));
    }
  }

void rankingFoods(int nutrientId) {
  // Filtrujemy i sortujemy SurveyFoods według nutrient.id i amount
  final rankingSurveyFoods = state.food.surveyFoods.where((food) {
    // Sprawdzenie, czy dany SurveyFood zawiera nutrient o podanym id
    return food.foodNutrients.any((nutrient) => nutrient.nutrient.id == nutrientId);
  }).toList()
  // Sortowanie wyników od największej do najmniejszej wartości amount
  ..sort((a, b) {
    final aAmount = a.foodNutrients.firstWhere((nutrient) => nutrient.nutrient.id == nutrientId).amount;
    final bAmount = b.foodNutrients.firstWhere((nutrient) => nutrient.nutrient.id == nutrientId).amount;
    return bAmount.compareTo(aAmount);
  });

  // Emituj nowy stan z posortowaną listą
  emit(state.copyWith(
    rankingFood: Food(surveyFoods: rankingSurveyFoods),
    status: RankingNutrientStatus.ranking,
    idSelected: nutrientId,

  ));
}


}
