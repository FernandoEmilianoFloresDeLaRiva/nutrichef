import 'package:flutter/material.dart';
import 'package:nutrichef/common/ui/widgets/custom_app_bar.dart';
import 'package:nutrichef/common/ui/widgets/section_title.dart';
import 'package:nutrichef/core/config/data/stub/recipes_stub.dart';
import 'package:nutrichef/core/config/domain/constants/app_constants.dart';
import 'package:nutrichef/recipes/ui/widgets/category_selector.dart';
import 'package:nutrichef/recipes/ui/widgets/feature_recipe_card.dart';
import 'package:nutrichef/recipes/ui/widgets/recipe_list.dart';

class NutriChefScreen extends StatefulWidget {
  const NutriChefScreen({super.key});

  @override
  State<NutriChefScreen> createState() => _NutriChefScreenState();
}

class _NutriChefScreenState extends State<NutriChefScreen> {
  String _selectedCategory = AppConstants.categories.first;

  void _onCategoryChanged(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final categoryRecipes = StubData.getRecipeByCategory(_selectedCategory);
    final featuredRecipes = StubData.getFeaturedRecipes(_selectedCategory);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category selector
            CategorySelector(
              categories: AppConstants.categories,
              selectedCategory: _selectedCategory,
              onCategoryChanged: _onCategoryChanged,
            ),

            const SizedBox(height: 16),

            // Featured recipes
            if (featuredRecipes.isNotEmpty) ...[
              const SectionTitle(title: AppConstants.popularRecipes),
              const SizedBox(height: 16),
              SizedBox(
                height: 220,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: featuredRecipes.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return FeaturedRecipeCard(recipe: featuredRecipes[index]);
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],

            const SectionTitle(title: AppConstants.recipes),
            const SizedBox(height: 16),
            RecipeList(recipes: categoryRecipes),
          ],
        ),
      ),
    );
  }
}
