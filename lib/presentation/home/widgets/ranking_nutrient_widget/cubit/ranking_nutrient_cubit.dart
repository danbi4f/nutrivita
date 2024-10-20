import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrivita/repository/food_repository.dart';
import 'package:nutrivita/repository/models/food/food.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';

part 'ranking_nutrient_state.dart';

class RankingNutrientCubit extends Cubit<RankingNutrientState> {
  RankingNutrientCubit({
    required this.foodRepository,
  }) : super(const RankingNutrientState());

  final FoodRepository foodRepository;

  final int _itemsPerPage = 20; // Liczba elementów na stronę
  List<SurveyFood> _allRankedFoods = []; // Pełna lista posortowanych elementów

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
      return food.foodNutrients
          .any((nutrient) => nutrient.nutrient.id == nutrientId);
    }).toList()
      // Sortowanie wyników od największej do najmniejszej wartości amount
      ..sort((a, b) {
        final aAmount = a.foodNutrients
            .firstWhere((nutrient) => nutrient.nutrient.id == nutrientId)
            .amount;
        final bAmount = b.foodNutrients
            .firstWhere((nutrient) => nutrient.nutrient.id == nutrientId)
            .amount;
        return bAmount.compareTo(aAmount);
      });

    // Zapisz pełną listę posortowanych wyników
    _allRankedFoods = rankingSurveyFoods;

    // Emituj nowy stan z posortowaną listą
    emit(state.copyWith(
      rankingFood: Food(surveyFoods: _getPaginatedData(page: 1)),
      status: RankingNutrientStatus.ranking,
      idSelected: nutrientId,
      currentPage: 1,
      hasMorePages: _allRankedFoods.length > _itemsPerPage,
    ));
  }

// --------------------------------------------------------------------------

  // Funkcja do paginacji - zwraca określoną stronę wyników
  List<SurveyFood> _getPaginatedData({required int page}) {
    final startIndex = (page - 1) * _itemsPerPage;
    final endIndex = startIndex + _itemsPerPage;

    return _allRankedFoods.sublist(
      startIndex,
      endIndex > _allRankedFoods.length ? _allRankedFoods.length : endIndex,
    );
  }

  // Funkcja do ładowania kolejnej strony
  Future<void> loadMoreFoods() async {
    if (state.hasMorePages) {
      emit(state.copyWith(
          status: RankingNutrientStatus.loading)); // Ustaw status na loading
      final nextPage = state.currentPage + 1;
      final newFoods = _getPaginatedData(page: nextPage);

      // Sprawdź, czy są jeszcze dostępne strony
      final hasMore = _allRankedFoods.length > nextPage * _itemsPerPage;

      // Emitujemy nowy stan z dołączonymi elementami
      emit(state.copyWith(
        rankingFood:
            Food(surveyFoods: [...state.rankingFood.surveyFoods, ...newFoods]),
        currentPage: nextPage,
        hasMorePages: hasMore,
        status: hasMore
            ? RankingNutrientStatus.success
            : RankingNutrientStatus.error, // Ustaw status na success lub error
      ));
    }
  }

  // Funkcja do czyszczenia rankingu
  void clearRanking() {
    emit(state.copyWith(
      rankingFood: Food(surveyFoods: []), // Poprawa: użycie właściwego typu `Food`
      idSelected: null, // Resetowanie wyboru
      status: RankingNutrientStatus.success, // Ustawienie neutralnego statusu po wyczyszczeniu
    ));
  }
}
