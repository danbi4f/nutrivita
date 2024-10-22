import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/presentation/home/pages/favorite_page.dart';
import 'package:nutrivita/presentation/home/pages/home_layout.dart';
import 'package:nutrivita/presentation/home/pages/widgets_page.dart';
import 'package:nutrivita/presentation/home/widgets/favorite_foods_widget/cubit/favorite_foods_cubit.dart';
import 'package:nutrivita/presentation/home/widgets/filtred_foods_widget/cubit/filtred_foods_cubit.dart';
import 'package:nutrivita/presentation/home/widgets/my_app_bar/my_app_bar.dart';
import 'package:nutrivita/presentation/home/widgets/my_bottom_navigation_bar/my_bottom_navigation_bar.dart';
import 'package:nutrivita/presentation/home/widgets/ranking_nutrient_widget/cubit/ranking_nutrient_cubit.dart';
import 'package:nutrivita/presentation/home/widgets/sort_food/cubit/sort_food_cubit.dart';
import 'package:nutrivita/repository/food_repository.dart';
import 'package:nutrivita/repository/services/food_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RepositoryProvider(
        create: (context) => FoodRepository(
          foodService: FoodService(),
        )..getDatabase(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<FiltredFoodCubit>(
              create: (context) => FiltredFoodCubit(
                  foodRepository: context.read<FoodRepository>())
                ..getFoods(),
            ),
            BlocProvider<SortFoodCubit>(
                create: (context) => SortFoodCubit(
                    foodRepository: context.read<FoodRepository>())
                  ..getCategoryNutrient()),
            BlocProvider<RankingNutrientCubit>(
              create: (context) => RankingNutrientCubit(
                foodRepository: context.read<FoodRepository>(),
              )..getFoods(),
            ),
            BlocProvider<FavoriteFoodsCubit>(
              create: (context) => FavoriteFoodsCubit(
                foodRepository: context.read<FoodRepository>(),
              ),
            ),
          ],
          child: const WidgetsPage(),
        ),
      ),
    );
  }
}
