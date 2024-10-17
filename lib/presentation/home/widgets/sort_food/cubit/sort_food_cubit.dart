import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrivita/repository/food_repository.dart';
import 'package:nutrivita/repository/models/category/category_item.dart';

part 'sort_food_state.dart';

class SortFoodCubit extends Cubit<SortFoodState> {
  SortFoodCubit({
    required this.foodRepository,
  }) : super(const SortFoodState());

  final FoodRepository foodRepository;

  Future<void> getCategoryNutrient() async {
    try {
      emit(state.copyWith(status: SortFoodStatus.loading));

      final categoryNutrient = await foodRepository.getCategoryNutrient();

      emit(state.copyWith(
        categoriesNutrient: categoryNutrient,
        status: SortFoodStatus.success,
      ));
    } catch (error) {
      print('Error fetching categoriesNutrient: $error');
      emit(state.copyWith(status: SortFoodStatus.error));
    }
  }

  Future<void> selectCategoryNutrient(int selectedCategory) async {
    emit(state.copyWith(
      idSelected: selectedCategory,
      status: SortFoodStatus.selected,
    ));
  }
}
