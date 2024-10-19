part of 'ranking_nutrient_cubit.dart';

enum RankingNutrientStatus { initial, success, error, loading, ranking }

extension RankingNutrientStatusX on RankingNutrientStatus {
  bool get isInitial => this == RankingNutrientStatus.initial;
  bool get isSuccess => this == RankingNutrientStatus.success;
  bool get isError => this == RankingNutrientStatus.error;
  bool get isLoading => this == RankingNutrientStatus.loading;
  bool get isSearching => this == RankingNutrientStatus.ranking;
}

class RankingNutrientState extends Equatable {
  const RankingNutrientState({
    this.status = RankingNutrientStatus.initial,
    Food? food,
    Food? rankingFood,
    this.idSelected = 0,
  })  : food = food ?? Food.empty,
        rankingFood = rankingFood ?? Food.empty;

  final Food food;
  final RankingNutrientStatus status;
  final Food rankingFood;
  final int idSelected;

  @override
  List<Object?> get props => [food, status, rankingFood];

  RankingNutrientState copyWith({
    Food? food,
    RankingNutrientStatus? status,
    Food? rankingFood,
    int? idSelected,
  }) {
    return RankingNutrientState(
      food: food ?? this.food,
      status: status ?? this.status,
      rankingFood: rankingFood ?? this.rankingFood,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}
