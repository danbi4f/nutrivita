import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/presentation/home/widgets/ranking_nutrient_widget/ranking_nutrient_item.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';
import 'package:nutrivita/presentation/home/widgets/ranking_nutrient_widget/cubit/ranking_nutrient_cubit.dart';

class RankingNutrientSuccessWidget extends StatelessWidget {
  const RankingNutrientSuccessWidget({
    super.key,
    required this.food,
    required this.idSelected,
  });

  final List<SurveyFood> food;
  final int idSelected;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // Zmiana na SingleChildScrollView
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListView.builder(
            shrinkWrap: true, // Ustawienie shrinkWrap na true
            physics: const NeverScrollableScrollPhysics(), // Wyłączenie przewijania w ListView
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
            ),
            itemCount: food.length + 1, // Dodatkowe miejsce dla wskaźnika ładowania
            itemBuilder: (context, index) {
              // Wskaźnik ładowania na końcu listy
              if (index == food.length) {
                return BlocBuilder<RankingNutrientCubit, RankingNutrientState>(
                  builder: (context, state) {
                    if (state.status == RankingNutrientStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                );
              }
          
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: RankingNutrientItem(
                  food: food[index],
                  idSelected: idSelected,
                ),
              );
            },
          ),
          ElevatedButton(onPressed: () {
            context.read<RankingNutrientCubit>().loadMoreFoods();
          }, child: const Text('Load more'))
        ],
      ),
    );
  }
}
