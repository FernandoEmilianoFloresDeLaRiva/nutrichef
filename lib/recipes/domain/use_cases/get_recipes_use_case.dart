import 'package:nutrichef/recipes/domain/adapters/preview_receipe_adapter.dart';
import 'package:nutrichef/recipes/domain/repositories/get_recipes_repository.dart';

class GetRecipesUseCase {
  final GetRecipesRepository getRecipesRepository;
  GetRecipesUseCase({required this.getRecipesRepository});

  Future<List<PreviewRecipeAdapter>> getRecipes(String type) async {
    return getRecipesRepository.getRecipes("10", type);
  }

  Future<List<PreviewRecipeAdapter>> getRecipesByName(
      String type, String name) async {
    return getRecipesRepository.getRecipes("10", type, query: name);
  }
}
