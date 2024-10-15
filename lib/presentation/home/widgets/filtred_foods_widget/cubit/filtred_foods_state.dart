part of 'filtred_foods_cubit.dart';

enum FiltredFoodStatus { initial, success, error, loading, searching }

extension FiltredFoodStatusX on FiltredFoodStatus {
  bool get isInitial => this == FiltredFoodStatus.initial;
  bool get isSuccess => this == FiltredFoodStatus.success;
  bool get isError => this == FiltredFoodStatus.error;
  bool get isLoading => this == FiltredFoodStatus.loading;
  bool get isSearching => this == FiltredFoodStatus.searching;
}

class FiltredFoodState extends Equatable {
  const FiltredFoodState({
    this.status = FiltredFoodStatus.initial,
    Food? food,
    Food? filtredFood,
  })  : food = food ?? Food.empty,
        filtredFood = filtredFood ?? Food.empty;

  final Food food;
  final FiltredFoodStatus status;
  final Food filtredFood;

  @override
  List<Object?> get props => [food, status, filtredFood];

  FiltredFoodState copyWith({
    Food? food,
    FiltredFoodStatus? status,
    Food? filtredFood,
  }) {
    return FiltredFoodState(
      food: food ?? this.food,
      status: status ?? this.status,
      filtredFood: filtredFood ?? this.filtredFood,
      
    );
  }
}
