import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/presentation/home/pages/home_page.dart';
import 'package:nutrivita/presentation/home/widgets/favorite_foods_widget/cubit/favorite_foods_cubit.dart';
import 'package:nutrivita/presentation/home/widgets/filtred_foods_widget/cubit/filtred_foods_cubit.dart';
import 'package:nutrivita/presentation/home/widgets/ranking_nutrient_widget/cubit/ranking_nutrient_cubit.dart';
import 'package:nutrivita/presentation/home/widgets/sort_food/cubit/sort_food_cubit.dart';
import 'package:nutrivita/repository/food_repository.dart';
import 'package:nutrivita/repository/services/food_service.dart';

class AppBaseDataPage extends StatelessWidget {
  const AppBaseDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => FoodRepository(
          foodService: FoodService(),
        )..getDatabase(),
        child: MultiBlocProvider(
          providers: [
// _________________________________________________________________________________________________________

            BlocProvider<FiltredFoodCubit>(
              create: (context) => FiltredFoodCubit(
                  foodRepository: context.read<FoodRepository>())
                ..getFoods(),
            ),
// _________________________________________________________________________________________________________

            BlocProvider<SortFoodCubit>(
                create: (context) => SortFoodCubit(
                    foodRepository: context.read<FoodRepository>())
                  ..getCategoryNutrient()),
// _________________________________________________________________________________________________________

            BlocProvider<RankingNutrientCubit>(
              create: (context) => RankingNutrientCubit(
                  foodRepository: context.read<FoodRepository>())
                ..getFoods(),
            ),
// _________________________________________________________________________________________________________

            BlocProvider<FavoriteFoodsCubit>(
              create: (context) => FavoriteFoodsCubit(
                  foodRepository: context.read<FoodRepository>()),
            ),
          ],
// _________________________________________________________________________________________________________

          child: const HomePage(),
        ),
      ),
    );
  }
}
