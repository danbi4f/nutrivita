import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/presentation/home/pages/home_layout.dart';
import 'package:nutrivita/presentation/home/widgets/all_foods_widget/cubit/all_foods_cubit.dart';
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
      appBar: const MyAppBar(),
      drawer: const Drawer(),
      bottomNavigationBar: const MyBottomNavigationBar(),

      //backgroundColor: Colors.amber[200],
      body: RepositoryProvider(
        create: (context) => FoodRepository(foodService: FoodService()),
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
            BlocProvider<AllFoodsCubit>(
              create: (context) => AllFoodsCubit(
                foodRepository: context.read<FoodRepository>(),
              )..getFoods(),
            ),
            BlocProvider<RankingNutrientCubit>(
              create: (context) => RankingNutrientCubit(
                foodRepository: context.read<FoodRepository>(),
              )..getFoods(),
            ),
          ],
          child: const HomeLayout(),
        ),
      ),
    );
  }
}
