import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';
import 'package:nutrivita/presentation/home/widgets/favorite_foods_widget/cubit/favorite_foods_cubit.dart';

class RankingNutrientItem extends StatelessWidget {
  const RankingNutrientItem({
    super.key,
    required this.food,
    required this.idSelected,
  });

  final SurveyFood food;
  final int idSelected;

  @override
  Widget build(BuildContext context) {
    int? nutrientId;
    double? amount;
    String? nutrientName;
    String? unitName;

    // Iteracja po liście foodNutrients, aby znaleźć nutrient
    for (var element in food.foodNutrients) {
      if (element.nutrient.id == idSelected) {
        nutrientId = element.nutrient.id;
        amount = element.amount;
        nutrientName = element.nutrient.name;
        unitName = element.nutrient.unitName;
        break; // Znaleziono, więc przerywamy pętlę
      }
    }

    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context)
            .colorScheme
            .surfaceContainerHighest, // Kolor zgodny z motywem
      ),
      child: Stack(
        children: [
          Positioned(
            top: 25,
            left: 20,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Text(
                food.description,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface, // Kolor tekstu zgodny z motywem
                ),
              ),
            ),
          ),
          if (idSelected == nutrientId &&
              amount != null &&
              nutrientName != null)
            Positioned(
              top: 80,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nutrient: $nutrientName',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Amount: $amount',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '$unitName',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          // Ikona ulubionych
          Positioned(
            right: 20,
            top: 75,
            child: BlocBuilder<FavoriteFoodsCubit, FavoriteFoodsState>(
              builder: (context, state) {
                final isFavorite = state.surveyFoodIds.contains(food.fdcId);
                final isLoading = state.loadingItemId ==
                    food.fdcId; // Sprawdzenie, czy dany element jest w stanie ładowania

                // Sprawdzenie, czy status to loading
                if (isLoading) {
                  return const SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  );
                }

                return IconButton(
                  onPressed: () {
                    if (!isLoading) {
                      // Sprawdzanie czy przycisk nie jest w stanie ładowania
                      if (isFavorite) {
                        context
                            .read<FavoriteFoodsCubit>()
                            .removeFavoriteFood(food.fdcId);
                      } else {
                        context
                            .read<FavoriteFoodsCubit>()
                            .addFavoriteFood(food.fdcId);
                      }
                    }
                  }, 
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite
                        ? Colors.red
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
