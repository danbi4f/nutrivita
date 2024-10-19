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

    // Iterujemy po liście foodNutrients, aby znaleźć nutrient o idSelected
    for (var element in food.foodNutrients) {
      if (element.nutrient.id == idSelected) {
        nutrientId = element.nutrient.id;
        amount = element.amount;
        nutrientName = element.nutrient.name;
        break; // Znaleziono, więc przerywamy pętlę
      }
    }

    return Container(
      height: 100,
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
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          if (idSelected == nutrientId && amount != null && nutrientName != null)
            Positioned(
              top: 50,
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
                  Text(
                    'Amount: $amount',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
