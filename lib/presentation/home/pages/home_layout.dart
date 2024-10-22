import 'package:flutter/material.dart';
import 'package:nutrivita/presentation/home/widgets/favorite_foods_widget/favorite_foods_widget.dart';
import 'package:nutrivita/presentation/home/widgets/header_title/header_title.dart';
import 'package:nutrivita/presentation/home/widgets/ranking_nutrient_widget/ranking_nutrient_widget.dart';
import 'package:nutrivita/presentation/home/widgets/search_food/search_food.dart';
import 'package:nutrivita/presentation/home/widgets/sort_food/sort_food.dart';
import 'package:nutrivita/presentation/widgets/container_body.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          HeaderTitle(),
          SizedBox(height: 10),
          SearchFood(),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10),
            child: SortFood(),
          ),
          SizedBox(height: 20),
          ContainerBody(children: [
            RankingNutrientWidget(),
          ])
          // BlocBuilder<FiltredFoodCubit, FiltredFoodState>(
          //   builder: (context, state) {
          //     // Sprawdź, czy są jakiekolwiek wyniki w przefiltrowanej liście
          //     final isFiltered = state.filtredFood.surveyFoods.isNotEmpty;

          //     return ContainerBody(
          //       children: [
          //         // Jeśli lista filtrowana ma elementy, wyświetl FiltredFoodsWidget
          //         if (isFiltered)
          //           const FiltredFoodsWidget()
          //         // Jeśli lista filtrowana jest pusta, wyświetl AllFoodsWidget
          //         else
          //           const AllFoodsWidget(
          //             title:
          //                 'All Food', // Tutaj można podać pełną listę z cubit dla AllFoods
          //           ),
          //       ],
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
