import 'package:flutter/material.dart';
import 'package:nutrichef/recipes_detail/ui/notifiers/recipe_detail_notifier.dart';
import 'package:nutrichef/recipes_detail/ui/widgets/content_tabs.dart';
import 'package:nutrichef/recipes_detail/ui/widgets/recipe_header.dart';
import 'package:nutrichef/recipes_detail/ui/widgets/recipes_detail_app_bar.dart';
import 'package:provider/provider.dart';

class RecipeDetailPage extends StatelessWidget {
  final int recipeId;
  const RecipeDetailPage({
    super.key,
    required this.recipeId,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipeDetailNotifier()..getRecipeDetail(recipeId),
      child: const RecipeDetailBody(),
    );
  }
}

class RecipeDetailBody extends StatelessWidget {
  const RecipeDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    final recipeNotifier =
        Provider.of<RecipeDetailNotifier>(context, listen: true);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          RecipesDetailAppBar(recipe: recipeNotifier.recipeDetail),
          SliverToBoxAdapter(
            child: Column(
              children: [
                RecipeHeader(recipe: recipeNotifier.recipeDetail),
                ContentTabs(recipe: recipeNotifier.recipeDetail),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
