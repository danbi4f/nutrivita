import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/presentation/home/widgets/favorite_foods_widget/cubit/favorite_foods_cubit.dart';
import 'package:nutrivita/presentation/home/widgets/favorite_foods_widget/favorite_foods_item.dart';
import 'package:nutrivita/repository/models/food/survey_food.dart';

class FavoriteFoodsSuccessWidget extends StatelessWidget {
  const FavoriteFoodsSuccessWidget({
    super.key,
    required this.food,
  });

  final List<SurveyFood> food;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
            ),
            itemCount: food.length + 1,
            itemBuilder: (context, index) {
              // Wskaźnik ładowania na końcu listy
              if (index == food.length) {
                return BlocBuilder<FavoriteFoodsCubit, FavoriteFoodsState>(
                  builder: (context, state) {
                    if (state.status == FavoriteFoodsStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                );
              }
              
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: FavoriteFoodsItem(
                  food: food[index], // Usunięto idSelected
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
