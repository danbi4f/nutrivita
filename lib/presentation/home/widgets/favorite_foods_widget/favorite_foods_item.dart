import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';
import 'package:nutrivita/presentation/home/widgets/favorite_foods_widget/cubit/favorite_foods_cubit.dart';

class FavoriteFoodsItem extends StatelessWidget {
  const FavoriteFoodsItem({
    super.key,
    required this.food,
  });

  final SurveyFood food;

  @override
  Widget build(BuildContext context) {
    double? amount;
    String? nutrientName;
    String? unitName;

    if (food.foodNutrients.isNotEmpty) {
      amount = food.foodNutrients.first.amount;
      nutrientName = food.foodNutrients.first.nutrient.name;
      unitName = food.foodNutrients.first.nutrient.unitName;
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
                food.description,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
          if (amount != null && nutrientName != null)
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
          // Ikona do usuwania ulubionych
          Positioned(
            right: 20,
            top: 75,
            child: IconButton(
              onPressed: () {
                context
                    .read<FavoriteFoodsCubit>()
                    .removeFavoriteFood(food.fdcId);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
