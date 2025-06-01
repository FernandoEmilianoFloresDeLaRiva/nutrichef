import 'package:flutter/material.dart';
import 'package:nutrichef/recipes/domain/adapters/recipe_adapter.dart';
import 'package:nutrichef/recipes_detail/ui/widgets/content_tabs.dart';
import 'package:nutrichef/recipes_detail/ui/widgets/recipe_header.dart';
import 'package:nutrichef/recipes_detail/ui/widgets/recipes_detail_app_bar.dart';

class RecipeDetailPage extends StatelessWidget {
  final RecipeAdapter recipe;

  const RecipeDetailPage({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          RecipesDetailAppBar(recipe: recipe),
          SliverToBoxAdapter(
            child: Column(
              children: [
                RecipeHeader(recipe: recipe),
                ContentTabs(recipe: recipe),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
