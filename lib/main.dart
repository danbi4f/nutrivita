import 'package:flutter/material.dart';
import 'package:nutrivita/presentation/home/pages/home_page.dart';

final kColorSchemeLight = ColorScheme.fromSeed(
  seedColor: Colors.green,
  brightness: Brightness.light, // Jasny motyw
);

final kColorSchemeDark = ColorScheme.fromSeed(
  seedColor: Colors.green,
  brightness: Brightness.dark, // Ciemny motyw
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: kColorSchemeLight,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorSchemeLight.surface,
          foregroundColor: kColorSchemeLight.onSurface,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSchemeLight.primary,
            foregroundColor: kColorSchemeLight.onPrimary,
          ),
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: kColorSchemeDark,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorSchemeDark.surface,
          foregroundColor: kColorSchemeDark.onSurface,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSchemeDark.primary,
            foregroundColor: kColorSchemeDark.onPrimary,
          ),
        ),
      ),
      themeMode: ThemeMode
          .system, // Automatycznie dostosowuje się do systemowego motywu
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}
