import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Pobierz bieżący kolor nawigacji w zależności od motywu (jasny/ciemny)
    final colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary, // Kolor wybranej ikony
      unselectedItemColor:
          colorScheme.onSurface.withOpacity(0.7), // Kolor nieaktywnej ikony
      items: const [
        BottomNavigationBarItem(
          label: 'Search', // Etykieta nie może być pusta
          icon: Icon(Icons.search), // Ikona dla wyszukiwania
        ),
        BottomNavigationBarItem(
          label: 'Favorites', // Dodana etykieta dla innego elementu
          icon: Icon(Icons.favorite), // Ikona dla ulubionych
        ),
      ],
    );
  }
}
