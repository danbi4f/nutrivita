import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nutrivita/repository/food_repository.dart';
import 'package:nutrivita/repository/models/food/food.dart';

part 'all_foods_state.dart';

class AllFoodsCubit extends Cubit<AllFoodsState> {
  AllFoodsCubit({
    required this.foodRepository,
  }) : super(const AllFoodsState());

  final FoodRepository foodRepository;

  Future<void> getFoods() async {
    try {
      emit(state.copyWith(status: AllFoodsStatus.loading));

      final food = await foodRepository.getFoodJson();

      emit(state.copyWith(
        food: food,
        status: AllFoodsStatus.success,
      ));
    } catch (error) {
      print('Error fetching foods: $error');
      emit(state.copyWith(status: AllFoodsStatus.error));
    }
  }


}



