import 'package:flutter/material.dart';
import 'package:nutrivita/presentation/widgets/other/all_foods_widget/all_food_item.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';

class AllFoodsSuccessWidget extends StatelessWidget {
  const AllFoodsSuccessWidget({
    super.key,
    required this.food,
    required this.title,
  });

  final List<SurveyFood> food;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
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
                child: AllFoodItem(food: food[index]),
              ),
              itemCount: food.length),
        )
      ],
    );
  }
}
