import 'package:flutter/material.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';
import 'package:nutrichef/recipes_detail/ui/widgets/ingredient_item.dart';

class IngredientsTab extends StatelessWidget {
  final List<String> ingredients;

  const IngredientsTab({
    super.key,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.backgroundColor,
      child: ListView.builder(
        padding: const EdgeInsets.all(20),
        physics: const ClampingScrollPhysics(),
        itemCount: ingredients.length,
        itemBuilder: (context, index) {
          return IngredientItem(
            ingredient: ingredients[index],
            index: index,
          );
        },
      ),
    );
  }
}
