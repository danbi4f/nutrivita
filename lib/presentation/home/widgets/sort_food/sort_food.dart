import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/presentation/home/widgets/ranking_nutrient_widget/cubit/ranking_nutrient_cubit.dart';
import 'package:nutrivita/presentation/home/widgets/sort_food/cubit/sort_food_cubit.dart';
import 'package:nutrivita/repository/models/category/category_item.dart';

class SortFood extends StatefulWidget {
  const SortFood({super.key});

  @override
  _SortFoodState createState() => _SortFoodState();
}

class _SortFoodState extends State<SortFood> {
  CategoryNutrient? selectedCategory; // Ustawienie jako nullable

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortFoodCubit, SortFoodState>(
      builder: (context, state) {
        List<CategoryNutrient> categories = state.categoriesNutrient;

        // Sprawdzenie czy lista kategorii nie jest pusta, aby zapobiec błędom
        if (categories.isEmpty) {
          return const CircularProgressIndicator(); // lub inny widget oczekiwania
        }

        return Row(
          children: [
            Expanded(
              child: Material(
                color: Theme.of(context).colorScheme.primary,
                elevation: 40,
                borderRadius: BorderRadius.circular(30.0),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    DropdownButtonFormField<CategoryNutrient>(
                      menuMaxHeight: 400,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      value: selectedCategory, // Może być null
                      items: [
                        for (final category in categories)
                          DropdownMenuItem<CategoryNutrient>(
                            value: category, // Ustawienie wartości
                            child: Row(
                              children: [
                                Text(
                                  category.name,
                                ), // Wyświetlana nazwa kategorii
                              ],
                            ),
                          ),
                      ],
                      onChanged: (CategoryNutrient? newValue) {
                        setState(() {
                          selectedCategory = newValue;

                          if (newValue != null) {
                            // Wywołanie sortowania po wybraniu wartości w DropdownButton
                            context
                                .read<RankingNutrientCubit>()
                                .rankingFoods(newValue.id);
                          } else {
                            // Resetowanie wartości
                            context.read<RankingNutrientCubit>().clearRanking();
                          }
                        });
                      },
                      hint: Text(
                        "Select a category",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    ),
                    if (selectedCategory != null)
                      Positioned(
                        right: 40,
                        child: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                          onPressed: () {
                            setState(() {
                              selectedCategory = null;
                            });
                            context.read<RankingNutrientCubit>().clearRanking();
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
