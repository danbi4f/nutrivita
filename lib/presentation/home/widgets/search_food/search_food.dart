import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/presentation/home/widgets/filtred_foods_widget/cubit/filtred_foods_cubit.dart';

class SearchFood extends StatefulWidget {
  const SearchFood({super.key});

  @override
  SearchFoodState createState() => SearchFoodState();
}

class SearchFoodState extends State<SearchFood> {
  String enteredQuery = '';
  Timer? _debounce;

  // Funkcja obsługująca opóźnienie
  void _onSearchChanged(String query) {
    // Anuluj poprzednie opóźnienie, jeśli istnieje
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // Uruchom opóźnienie
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      // Wywołaj zapytanie do Cubit dopiero po 500 ms od ostatniej zmiany
      context.read<FiltredFoodCubit>().filterFoods(query);
    });
  }

  @override
  void dispose() {
    // Anuluj timer przy zamykaniu widgetu
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltredFoodCubit, FiltredFoodState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Material(
                elevation: 20.0,
                borderRadius: BorderRadius.circular(30.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    suffixIcon: Icon(
                      Icons.mic,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                  ),
                  onChanged: (value) {
                    // Zaktualizuj lokalny stan zapytania
                    enteredQuery = value;

                    // Wywołaj funkcję z opóźnieniem
                    _onSearchChanged(enteredQuery);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
