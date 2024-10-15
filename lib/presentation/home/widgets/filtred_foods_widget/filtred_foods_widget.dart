import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/presentation/home/widgets/filtred_foods_widget/cubit/filtred_foods_cubit.dart';
import 'package:nutrivita/presentation/home/widgets/filtred_foods_widget/filtred_foods_success_widget.dart';

class FiltredFoodsWidget extends StatelessWidget {
  const FiltredFoodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltredFoodCubit, FiltredFoodState>(
      builder: (context, state) {
        if (state.status.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status.isError) {
          return const Center(
              child: Text('An error occurred while loading data'));
        } else if (state.filtredFood.surveyFoods.isEmpty) {
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
          return FiltredFoodsSuccessWidget(
            food: state.filtredFood.surveyFoods,
          );
        }
      },
    );
  }
}
