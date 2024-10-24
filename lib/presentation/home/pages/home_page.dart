import 'package:flutter/material.dart';
import 'package:nutrivita/presentation/home/pages/favorite_page.dart';
import 'package:nutrivita/presentation/home/pages/ranking_nutrient_layout.dart';
import 'package:nutrivita/presentation/home/widgets/my_app_bar/my_app_bar.dart';
import 'package:nutrivita/presentation/home/widgets/my_bottom_navigation_bar/my_bottom_navigation_bar.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<HomePage> {

    int currentIndex = 0;

  // Lista ekranów dostępnych w BottomNavigationBar
  final screens = <Widget>[
    const RankingNutrientLayout(),
    const FavoritePage(),
  ];

  // Funkcja aktualizująca indeks
  void updateIndex(int newIndex) {
    setState(() {
      currentIndex = newIndex;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: const MyAppBar(),
      drawer: const Drawer(),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: updateIndex, // Przekazujemy funkcję aktualizacji indeksu
      ),
      body: IndexedStack(
            index: currentIndex,
            children: screens,
          ),);
  }
}