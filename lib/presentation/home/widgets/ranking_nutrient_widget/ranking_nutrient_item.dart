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

  void _toggleFavorite(BuildContext context) async {
    final cubit = context.read<FavoriteFoodsCubit>();
    final isFavorite = cubit.state.surveyFoodIds.contains(food.fdcId);


    if (isFavorite) {
      await cubit.removeFavoriteFood(food.fdcId);
    } else {
      await cubit.addFavoriteFood(food.fdcId);
    }
  }

  @override
  Widget build(BuildContext context) {
    int? nutrientId;
    double? amount;
    String? nutrientName;
    String? unitName;

    for (var element in food.foodNutrients) {
      if (element.nutrient.id == idSelected) {
        nutrientId = element.nutrient.id;
        amount = element.amount;
        nutrientName = element.nutrient.name;
        unitName = element.nutrient.unitName;
        break;
      }
    }

    return BlocListener<FavoriteFoodsCubit, FavoriteFoodsState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Operacja zakończona sukcesem!')),
          );
        } else if (state.status.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Wystąpił błąd.')),
          );
        }
      },
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
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
                    color: Theme.of(context).colorScheme.onSurface,
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
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '$unitName',
                          style: TextStyle(
                            fontSize: 12,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            Positioned(
              right: 20,
              top: 75,
              child: BlocBuilder<FavoriteFoodsCubit, FavoriteFoodsState>(
                buildWhen: (previous, current) =>
                    previous.surveyFoodIds != current.surveyFoodIds,
                builder: (context, state) {
                  final isFavorite = state.surveyFoodIds.contains(food.fdcId);
                  return IconButton(
                    onPressed: () {
                      _toggleFavorite(context);
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
      ),
    );
  }
}
