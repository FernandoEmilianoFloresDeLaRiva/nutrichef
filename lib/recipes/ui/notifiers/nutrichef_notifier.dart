import 'package:flutter/material.dart';
import 'package:nutrichef/core/config/domain/constants/app_constants.dart';
import 'package:nutrichef/recipes/data/api/get_random_recipes.dart';
import 'package:nutrichef/recipes/data/api/get_recipes.dart';
import 'package:nutrichef/recipes/domain/adapters/preview_receipe_adapter.dart';

class NutriChefNotifier extends ChangeNotifier {
  List<PreviewRecipeAdapter> _recipes = [];
  List<PreviewRecipeAdapter> get recipes => _recipes;
  List<PreviewRecipeAdapter> _randomRecipes = [];
  List<PreviewRecipeAdapter> get randomRecipes => _randomRecipes;
  String _selectedCategory = AppConstants.categories.first;
  String get selectedCategory => _selectedCategory;

  Future<void> getRecipes(String type) async {
    final recipes = await GetRecipes.get(type);
    _recipes = recipes;
    notifyListeners();
  }

  Future<void> getRandomRecipes() async {
    final recipes = await GetRandomRecipes.get();
    _randomRecipes = recipes;
    notifyListeners();
  }

  Future<void> fetchAll() async {
    await Future.wait([
      getRandomRecipes(),
      getRecipes(selectedCategory),
    ]);
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    getRecipes(category);
    notifyListeners();
  }
}
