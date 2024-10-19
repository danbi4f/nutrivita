import 'package:flutter/material.dart';
import 'package:nutrivita/presentation/home/widgets/ranking_nutrient_widget/ranking_nutrient_item.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height:
              ((100 * food.length) + MediaQuery.of(context).size.width) + 24,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
              ),
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RankingNutrientItem(
                      food: food[index],
                      idSelected: idSelected,
                    ),
                  ),
              itemCount: food.length),
        )
      ],
    );
  }
}
