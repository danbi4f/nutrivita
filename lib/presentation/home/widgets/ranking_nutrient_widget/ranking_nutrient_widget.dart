import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/presentation/home/widgets/ranking_nutrient_widget/cubit/ranking_nutrient_cubit.dart';
import 'package:nutrivita/presentation/home/widgets/ranking_nutrient_widget/ranking_nutrient_success_widget.dart';

class RankingNutrientWidget extends StatelessWidget {
  const RankingNutrientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RankingNutrientCubit, RankingNutrientState>(
      builder: (context, state) {
        if (state.status.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status.isError) {
          return const Center(
              child: Text('An error occurred while loading data'));
        } else if (state.rankingFood.surveyFoods.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(
                'Nothing here! \nStart searching...',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return RankingNutrientSuccessWidget(
            food: state.rankingFood.surveyFoods,
            idSelected: state.idSelected,
          );
        }
      },
    );
  }
}
