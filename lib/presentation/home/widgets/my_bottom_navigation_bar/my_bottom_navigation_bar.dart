import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap; // Callback do aktualizacji indeksu

  @override
  Widget build(BuildContext context) {
    // Pobieramy ColorScheme z aktualnego kontekstu motywu
    final colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      backgroundColor: colorScheme.surface, // Używamy koloru tła z motywu
      selectedItemColor: colorScheme.primary, // Kolor zaznaczonego elementu
      unselectedItemColor:
          colorScheme.onSurfaceVariant, // Kolor niezaznaczonych elementów
      selectedFontSize: 18,
      currentIndex: currentIndex, // Używamy aktualnego indeksu
      onTap: onTap, // Przekazujemy akcję na kliknięcie
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.search,
          ),
          label: 'Szukaj',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.star,
          ),
          label: 'Ulubione',
        ),
      ],
    );
  }
}
