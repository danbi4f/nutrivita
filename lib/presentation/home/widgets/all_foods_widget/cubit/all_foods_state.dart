part of 'all_foods_cubit.dart';

enum AllFoodsStatus { initial, success, error, loading, searching }

extension AllFoodsStatusX on AllFoodsStatus {
  bool get isInitial => this == AllFoodsStatus.initial;
  bool get isSuccess => this == AllFoodsStatus.success;
  bool get isError => this == AllFoodsStatus.error;
  bool get isLoading => this == AllFoodsStatus.loading;
  bool get isSearching => this == AllFoodsStatus.searching;
}

class AllFoodsState extends Equatable {
  const AllFoodsState({
    this.status = AllFoodsStatus.initial,
    Food? food,
    Food? filtredFood,
  })  : food = food ?? Food.empty;


  final Food food;
  final AllFoodsStatus status;


  @override
  List<Object?> get props => [food, status];

  AllFoodsState copyWith({
    Food? food,
    AllFoodsStatus? status,
    Food? filtredFood,
  }) {
    return AllFoodsState(
      food: food ?? this.food,
      status: status ?? this.status,

      
    );
  }
}
