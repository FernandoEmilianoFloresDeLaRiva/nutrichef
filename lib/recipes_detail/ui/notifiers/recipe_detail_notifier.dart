import 'package:flutter/material.dart';
import 'package:nutrichef/common/domain/adapters/tags_adapter.dart';
import 'package:nutrichef/recipes_detail/application/dependencies/get_recipe_detail_dependencies.dart';
import 'package:nutrichef/recipes_detail/domain/adapters/recipe_detail_adapter.dart';
import 'package:nutrichef/recipes_detail/domain/use_cases/get_recipe_detail_use_case.dart';

class RecipeDetailNotifier extends ChangeNotifier {
  RecipeDetailAdapter _recipeDetail = RecipeDetailAdapter(
    id: 0,
    title: '',
    image: '',
    readyInMinutes: 0,
    tags: TagsAdapter(tags: []),
    ingredients: [],
    instructions: [],
  );
  RecipeDetailAdapter get recipeDetail => _recipeDetail;

  final GetRecipeDetailUseCase getRecipeDetailUseCase =
      GetRecipeDetailDependencies.getRecipeDetailUseCase();

  Future<void> getRecipeDetail(int id) async {
    try {
      final recipeDetail = await getRecipeDetailUseCase.call(id);
      _recipeDetail = recipeDetail;
      notifyListeners();
    } catch (e) {
      throw Exception(e);
    }
  }
}
