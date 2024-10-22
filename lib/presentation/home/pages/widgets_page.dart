import 'package:flutter/material.dart';
import 'package:nutrivita/presentation/home/pages/favorite_page.dart';
import 'package:nutrivita/presentation/home/pages/home_layout.dart';
import 'package:nutrivita/presentation/home/widgets/my_app_bar/my_app_bar.dart';
import 'package:nutrivita/presentation/home/widgets/my_bottom_navigation_bar/my_bottom_navigation_bar.dart';


class WidgetsPage extends StatefulWidget {
  const WidgetsPage({super.key});

  @override
  State<WidgetsPage> createState() => _WidgetsPageState();
}

class _WidgetsPageState extends State<WidgetsPage> {

    int currentIndex = 0;

  // Lista ekranów dostępnych w BottomNavigationBar
  final screens = <Widget>[
    const HomeLayout(),
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