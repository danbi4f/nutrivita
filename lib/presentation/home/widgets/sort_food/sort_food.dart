import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrivita/presentation/home/widgets/ranking_nutrient_widget/cubit/ranking_nutrient_cubit.dart';
import 'package:nutrivita/presentation/home/widgets/sort_food/cubit/sort_food_cubit.dart';
import 'package:nutrivita/repository/models/category/category_item.dart';

class SortFood extends StatelessWidget {
  const SortFood({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortFoodCubit, SortFoodState>(
      builder: (context, state) {
        List<CategoryNutrient> categories = state.categoriesNutrient;

        // Sprawdzenie czy lista kategorii nie jest pusta, aby zapobiec błędom
        if (categories.isEmpty) {
          return const CircularProgressIndicator(); // lub inny widget oczekiwania
        }

        // Wartość początkowa dla DropdownButtonFormField
        CategoryNutrient selectedCategory = categories[0];

        return Row(
          children: [
            Expanded(
              child: Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(30.0),
                child: DropdownButtonFormField<CategoryNutrient>(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                  value: selectedCategory, // Dodanie wartości początkowej
                  items: [
                    for (final category in categories)
                      DropdownMenuItem<CategoryNutrient>(
                        value: category, // Ustawienie wartości
                        child: Row(
                          children: [
                            Text(category.name), // Wyświetlana nazwa kategorii
                            Text(category.number), 
                          ],
                        ),
                      ),
                  ],
                  onChanged: (CategoryNutrient? newValue) {
                    // Aktualizacja wybranej wartości
                    if (newValue != null) {
                      selectedCategory = newValue;

                      // Wywołanie sortowania po wybraniu wartości w DropdownButton
                      context
                          .read<RankingNutrientCubit>()
                          .rankingFoods(selectedCategory.id);
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
