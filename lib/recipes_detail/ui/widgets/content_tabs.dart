import 'package:flutter/material.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';
import 'package:nutrichef/recipes/domain/adapters/recipe_adapter.dart';
import 'package:nutrichef/recipes_detail/ui/widgets/ingredients_tab.dart';
import 'package:nutrichef/recipes_detail/ui/widgets/instructions_tab.dart';

class ContentTabs extends StatelessWidget {
  final RecipeAdapter recipe;
  const ContentTabs({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: const TabBar(
              labelColor: AppTheme.textPrimary,
              unselectedLabelColor: AppTheme.textSecondary,
              indicatorColor: AppTheme.primaryColor,
              tabs: [
                Tab(text: 'Ingredientes'),
                Tab(text: 'Instrucciones'),
              ],
            ),
          ),
          SizedBox(
            height: 700,
            child: TabBarView(
              children: [
                IngredientsTab(ingredients: recipe.ingredients),
                InstructionsTab(instructions: recipe.instructions),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
