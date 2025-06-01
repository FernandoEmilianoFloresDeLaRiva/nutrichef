import 'package:flutter/material.dart';
import 'package:nutrichef/common/ui/widgets/custom_app_bar.dart';
import 'package:nutrichef/common/ui/widgets/section_title.dart';
import 'package:nutrichef/core/config/domain/constants/app_constants.dart';
import 'package:nutrichef/recipes/ui/notifiers/nutrichef_notifier.dart';
import 'package:nutrichef/recipes/ui/widgets/category_selector.dart';
import 'package:nutrichef/recipes/ui/widgets/feature_recipe_card.dart';
import 'package:nutrichef/recipes/ui/widgets/recipe_list.dart';
import 'package:provider/provider.dart';

class NutriChefScreen extends StatelessWidget {
  const NutriChefScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NutriChefNotifier(),
      child: const NutriChefBody(),
    );
  }
}

class NutriChefBody extends StatelessWidget {
  const NutriChefBody({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<NutriChefNotifier>(context, listen: false);

    return Scaffold(
      appBar: const CustomAppBar(),
      body: FutureBuilder(
        future: notifier.fetchAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ocurrió un error: \\${snapshot.error}'));
          } else {
            return Consumer<NutriChefNotifier>(
                builder: (context, notifier, _) => SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        // Category selector
                        CategorySelector(
                          categories: AppConstants.categories,
                          selectedCategory: notifier.selectedCategory,
                          onCategoryChanged: notifier.setSelectedCategory,
                        ),
                        const SizedBox(height: 16),
                        // Featured recipes
                        if (notifier.randomRecipes.isNotEmpty) ...[
                          const SectionTitle(title: AppConstants.randomRecipes),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 220,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemCount: notifier.randomRecipes.length,
                              separatorBuilder: (_, __) =>
                                  const SizedBox(width: 16),
                              itemBuilder: (context, index) {
                                return FeaturedRecipeCard(
                                    recipe: notifier.randomRecipes[index]);
                              },
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                        const SectionTitle(title: AppConstants.recipes),
                        const SizedBox(height: 16),
                        RecipeList(recipes: notifier.recipes),
                      ],
                    )));
          }
        },
      ),
    );
  }
}
