import 'package:flutter/material.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';

class FiltredFoodItem extends StatelessWidget {
  const FiltredFoodItem({
    super.key,
    required this.food,
  });

  final SurveyFood food;

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
