part of 'favorite_foods_cubit.dart';

enum FavoriteFoodsStatus { initial, success, error, loading, searching }

extension FavoriteFoodsStatusX on FavoriteFoodsStatus {
  bool get isInitial => this == FavoriteFoodsStatus.initial;
  bool get isSuccess => this == FavoriteFoodsStatus.success;
  bool get isError => this == FavoriteFoodsStatus.error;
  bool get isLoading => this == FavoriteFoodsStatus.loading;
  bool get isSearching => this == FavoriteFoodsStatus.searching;
}

class FavoriteFoodsState extends Equatable {
  const FavoriteFoodsState({
    this.status = FavoriteFoodsStatus.initial,
    this.surveyFoodIds = const [],
    this.surveyFood = const [],
  });

  final List<int> surveyFoodIds; 
  final FavoriteFoodsStatus status;
  final List<SurveyFood> surveyFood;

  @override
  List<Object?> get props => [surveyFoodIds, status];

  FavoriteFoodsState copyWith({
    List<int>? surveyFoodIds,
    FavoriteFoodsStatus? status,
    List<SurveyFood>? surveyFood,
  }) {
    return FavoriteFoodsState(
      surveyFoodIds: surveyFoodIds ?? this.surveyFoodIds,
      status: status ?? this.status,
      surveyFood: surveyFood ?? this.surveyFood,
    );
  }
}
