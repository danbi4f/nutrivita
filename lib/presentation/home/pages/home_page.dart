import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/presentation/home/pages/home_layout.dart';
import 'package:nutrivita/presentation/home/widgets/filtred_foods_widget/cubit/filtred_foods_cubit.dart';
import 'package:nutrivita/repository/food_repository.dart';
import 'package:nutrivita/repository/services/food_assets_service.dart';



class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      drawer: const Drawer(),
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                'https://cdn.prod.website-files.com/62d84e447b4f9e7263d31e94/6557420216a456cfaef685c0_6399a4d27711a5ad2c9bf5cd_ben-sweet-2LowviVHZ-E-unsplash-1-p-1600.jpg',
              ),
            ),
          )
        ],
      ),
      //backgroundColor: Colors.amber[200],
      body: RepositoryProvider(
        create: (context) => FoodRepository(assetsService: FoodAssetsService()),
        child: BlocProvider<FiltredFoodCubit>(
          create: (context) =>
              FiltredFoodCubit(foodRepository: context.read<FoodRepository>())
                ..getFoods(),
          child: const HomeLayout(),
        ),
      ),
    );
  }
}
