import 'package:flutter/material.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';

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
    // Zmienna nutrientId przechowuje ID pierwszego dopasowanego nutrient
    int? nutrientId;
    double? amount;
    String? nutrientName;
    String? unitName;

    // Iterujemy po liście foodNutrients, aby znaleźć nutrient o idSelected
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
            .surfaceContainerHighest
            .withOpacity(0.1), // Kolor zgodny z motywem
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
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          if (idSelected == nutrientId && amount != null && nutrientName != null)
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
                      SizedBox(width: 5,),
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
        ],
      ),
    );
  }
}
