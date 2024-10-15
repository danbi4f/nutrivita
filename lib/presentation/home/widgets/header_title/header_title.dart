import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Dodano padding
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer, // Tło kontenera zgodne z motywem
        borderRadius: BorderRadius.circular(15), // Zaokrąglone rogi
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Cień
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 9), // Położenie cienia
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "Welcome! \nIt's time to build healthy habits! 🍏",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Theme.of(context).colorScheme.onPrimaryContainer, // Kolor tekstu zgodny z motywem
              shadows: const [
                Shadow(
                  blurRadius: 2.0,
                  offset: Offset(1.0, 1.0),
                ),
              ], // Cień dla tekstu
            ),
          ),
        ],
      ),
    );
  }
}
