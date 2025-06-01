import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';
import 'package:nutrichef/core/router/domain/constants/router_constants.dart';
import 'package:nutrichef/recipes/domain/adapters/recipe_adapter.dart';
import 'package:nutrichef/recipes_detail/ui/widgets/recipe_image_header.dart';

class RecipesDetailAppBar extends StatelessWidget {
  final RecipeAdapter recipe;
  const RecipesDetailAppBar({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: AppTheme.primaryColor,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => context.go(RouterConstants.home),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: RecipeImageHeader(
          imageUrl: recipe.imageUrl,
          cookingTime: recipe.cookingTime,
        ),
      ),
    );
  }
}
