part of 'sort_food_cubit.dart';

enum SortFoodStatus { initial, success, error, loading, selected }

extension SortFoodStatusX on SortFoodStatus {
  bool get isInitial => this == SortFoodStatus.initial;
  bool get isSuccess => this == SortFoodStatus.success;
  bool get isError => this == SortFoodStatus.error;
  bool get isLoading => this == SortFoodStatus.loading;
  bool get isSelected => this == SortFoodStatus.selected;
}

class SortFoodState extends Equatable {
  const SortFoodState({
    this.status = SortFoodStatus.initial,
    List<CategoryNutrient>? categoriesNutrient,
    this.idSelected = 0,
  }) : categoriesNutrient = categoriesNutrient ?? const [];

  final List<CategoryNutrient> categoriesNutrient;
  final SortFoodStatus status;
  final int idSelected;

  @override
  List<Object> get props => [categoriesNutrient, status, idSelected];

    SortFoodState copyWith({
    List<CategoryNutrient>? categoriesNutrient,
    SortFoodStatus? status,
    int? idSelected,
  }) {
    return SortFoodState(
      categoriesNutrient: categoriesNutrient ?? this.categoriesNutrient,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}
