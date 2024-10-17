import 'package:flutter/material.dart';
import 'package:nutrivita/presentation/home/widgets/filtred_foods_widget/filtred_foods_widget.dart';
import 'package:nutrivita/presentation/home/widgets/header_title/header_title.dart';
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
          SizedBox(height: 10),
          ContainerBody(
            children: [
              FiltredFoodsWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
