import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';
import 'package:nutrivita/presentation/home/widgets/favorite_foods_widget/cubit/favorite_foods_cubit.dart';

class RankingNutrientItem extends StatefulWidget {
  const RankingNutrientItem({
    super.key,
    required this.food,
    required this.idSelected,
  });

  final SurveyFood food;
  final int idSelected;

  @override
  State<RankingNutrientItem> createState() => _RankingNutrientItemState();
}

class _RankingNutrientItemState extends State<RankingNutrientItem> {
  bool _isLoading = false; // Lokalny stan ładowania

  void _toggleFavorite(BuildContext context) async {
    setState(() {
      _isLoading =
          true; // Ustawienie stanu ładowania na true przed rozpoczęciem akcji
    });

    // Symulacja opóźnienia
    await Future.delayed(
        const Duration(seconds: 1)); // Zmienna czas opóźnienia na 1 sek.

    final isFavorite = context
        .read<FavoriteFoodsCubit>()
        .state
        .surveyFoodIds
        .contains(widget.food.fdcId);

    if (isFavorite) {
      await context
          .read<FavoriteFoodsCubit>()
          .removeFavoriteFood(widget.food.fdcId);
    } else {
      await context
          .read<FavoriteFoodsCubit>()
          .addFavoriteFood(widget.food.fdcId);
    }

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      _isLoading =
          false; // Powrót stanu ładowania na false po zakończeniu akcji
    });
  }

  @override
  Widget build(BuildContext context) {
    int? nutrientId;
    double? amount;
    String? nutrientName;
    String? unitName;

    for (var element in widget.food.foodNutrients) {
      if (element.nutrient.id == widget.idSelected) {
        nutrientId = element.nutrient.id;
        amount = element.amount;
        nutrientName = element.nutrient.name;
        unitName = element.nutrient.unitName;
        break;
      }
    }

    return Container(
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
                widget.food.description,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
          if (widget.idSelected == nutrientId &&
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
          Positioned(
            right: 20,
            top: 75,
            child: BlocBuilder<FavoriteFoodsCubit, FavoriteFoodsState>(
              buildWhen: (previous, current) =>
                  previous.surveyFoodIds != current.surveyFoodIds,
              builder: (context, state) {
                final isFavorite =
                    state.surveyFoodIds.contains(widget.food.fdcId);

                return _isLoading
                    ? CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.onSurface,
                      )
                    : IconButton(
                        onPressed: () => _toggleFavorite(context),
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
