import 'package:flutter/material.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';
import 'package:nutrichef/recipes/domain/adapters/recipe_adapter.dart';
import 'package:nutrichef/recipes_detail/ui/widgets/recipe_tags.dart';

class RecipeHeader extends StatelessWidget {
  final RecipeAdapter recipe;
  const RecipeHeader({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipe.name,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          RecipeTagsWidget(tags: recipe.tags),
        ],
      ),
    );
  }
}
