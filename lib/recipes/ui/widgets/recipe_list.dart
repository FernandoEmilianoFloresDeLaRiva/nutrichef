import 'package:flutter/material.dart';
import 'package:nutrichef/recipes/domain/adapters/recipe_adapter.dart';
import 'package:nutrichef/recipes/ui/widgets/empty_list.dart';
import 'package:nutrichef/recipes/ui/widgets/recipe_list_item.dart';

class RecipeList extends StatelessWidget {
  final List<RecipeAdapter> recipes;

  const RecipeList({
    super.key,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    if (recipes.isEmpty) {
      return const EmptyList();
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recipes.length,
      itemBuilder: (context, index) {
        return RecipeListItem(recipe: recipes[index]);
      },
    );
  }
}
