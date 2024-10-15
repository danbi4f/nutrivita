import 'package:flutter/material.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';

class AllFoodItem extends StatelessWidget {
  const AllFoodItem({
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
        color: Colors.grey.withOpacity(.1),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 25,
            left: 20,
            child: Container(
              width: MediaQuery.of(context).size.width * .5,
              child: Text(
                food.description,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
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
