import 'package:flutter/material.dart';
import 'package:nutrivita/presentation/home/widgets/filtred_foods_widget/filtred_food_item.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';

class FiltredFoodsSuccessWidget extends StatelessWidget {
  const FiltredFoodsSuccessWidget({
    super.key,
    required this.food,
  });

  final List<SurveyFood> food;

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
                child: FiltredFoodItem(food: food[index]),
              ),
              itemCount: food.length),
        )
      ],
    );
  }
}
