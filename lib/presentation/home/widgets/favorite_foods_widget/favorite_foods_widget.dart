import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/presentation/home/widgets/favorite_foods_widget/cubit/favorite_foods_cubit.dart';
import 'package:nutrivita/presentation/home/widgets/favorite_foods_widget/favorite_foods_success_widget.dart';

class FavoriteFoodsWidget extends StatelessWidget {
  const FavoriteFoodsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Załaduj ulubione produkty po otwarciu widgetu
    context.read<FavoriteFoodsCubit>().loadFavoriteFoods();

    return BlocBuilder<FavoriteFoodsCubit, FavoriteFoodsState>(
      builder: (context, state) {
        if (state.status.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status.isError) {
          return const Center(
            child: Text('An error occurred while loading data'),
          );
        } else if (state.surveyFood.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(
                'No favorite foods added yet.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          return FavoriteFoodsSuccessWidget(
            food: state.surveyFood, // Usunięto idSelected
          );
        }
      },
    );
  }
}
