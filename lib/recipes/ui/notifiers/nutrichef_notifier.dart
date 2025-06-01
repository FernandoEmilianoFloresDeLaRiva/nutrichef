import 'package:flutter/material.dart';
import 'package:nutrichef/core/config/domain/constants/app_constants.dart';
import 'package:nutrichef/recipes/application/dependencies/get_random_recipes_dependencies.dart';
import 'package:nutrichef/recipes/application/dependencies/get_recipes_dependencies.dart';
import 'package:nutrichef/recipes/domain/adapters/preview_receipe_adapter.dart';
import 'package:nutrichef/recipes/domain/use_cases/get_random_recipes_use_case.dart';
import 'package:nutrichef/recipes/domain/use_cases/get_recipes_use_case.dart';

class NutriChefNotifier extends ChangeNotifier {
  List<PreviewRecipeAdapter> _recipes = [];
  List<PreviewRecipeAdapter> get recipes => _recipes;
  List<PreviewRecipeAdapter> _randomRecipes = [];
  List<PreviewRecipeAdapter> get randomRecipes => _randomRecipes;
  String _selectedCategory = AppConstants.categories.first;
  String get selectedCategory => _selectedCategory;
  bool _isSearching = false;
  bool get isSearching => _isSearching;
  String _searchText = '';
  String get searchText => _searchText;

  final GetRecipesUseCase getRecipesUseCase =
      GetRecipesDependencies.getRecipesUseCase();
  final GetRandomRecipesUseCase getRandomRecipesUseCase =
      GetRandomRecipesDependencies.getRandomRecipesUseCase();

  Future<void> getRecipes(String type) async {
    final recipes = await getRecipesUseCase.getRecipes(type);
    _recipes = recipes;
    notifyListeners();
  }

  Future<void> getRandomRecipes() async {
    final recipes = await getRandomRecipesUseCase.call("10");
    _randomRecipes = recipes;
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    getRecipes(category);
    notifyListeners();
  }

  void startSearch() {
    _isSearching = true;
    notifyListeners();
  }

  void stopSearch() {
    _isSearching = false;
    _searchText = '';
    notifyListeners();
  }

  void updateSearchText(String text) {
    _searchText = text;
    notifyListeners();
  }

  Future<void> fetchAll() async {
    await Future.wait([
      getRandomRecipes(),
      getRecipes(selectedCategory),
    ]);
  }

  Future<void> searchRecipes() async {
    if (_searchText.trim().isEmpty) {
      return;
    }
    final recipes = await getRecipesUseCase.getRecipesByName(
        _selectedCategory, _searchText);
    _recipes = recipes;
    notifyListeners();
  }
}
