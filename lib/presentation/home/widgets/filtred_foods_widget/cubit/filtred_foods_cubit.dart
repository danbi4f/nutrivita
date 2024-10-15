import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrivita/repository/food_repository.dart';
import 'package:nutrivita/repository/models/food/food.dart';
part 'filtred_foods_state.dart';

class FiltredFoodCubit extends Cubit<FiltredFoodState> {
  FiltredFoodCubit({
    required this.foodRepository,
  }) : super( const FiltredFoodState());

  final FoodRepository foodRepository;

  Future<void> getFoods() async {
    try {
      emit(state.copyWith(status: FiltredFoodStatus.loading));

      final food = await foodRepository.getFoodJson();

      emit(state.copyWith(
        food: food,
        status: FiltredFoodStatus.success,
      ));
    } catch (error) {
      print('Error fetching foods: $error');
      emit(state.copyWith(status: FiltredFoodStatus.error));
    }
  }

void filterFoods(String query) {
  if (query.isEmpty) {
    // Jeśli zapytanie jest puste, wyczyść przefiltrowane wyniki.
    emit(state.copyWith(
      filtredFood: const Food(surveyFoods: []), // pusta lista
      status: FiltredFoodStatus.success,  // lub inny odpowiedni status
    ));
    return;
  }

  final filteredSurveyFoods = state.food.surveyFoods.where((food) {
    return food.description.toLowerCase().contains(query.toLowerCase());
  }).toList();

  final filteredFood = Food(surveyFoods: filteredSurveyFoods);

  // Emituj nowy stan z przefiltrowanymi danymi
  emit(state.copyWith(
    filtredFood: filteredFood,
    status: FiltredFoodStatus.searching,
  ));
}

}