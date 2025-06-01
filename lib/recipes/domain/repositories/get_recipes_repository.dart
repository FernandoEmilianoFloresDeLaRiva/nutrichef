import 'package:nutrichef/recipes/domain/adapters/preview_receipe_adapter.dart';

abstract class GetRecipesRepository {
  Future<List<PreviewRecipeAdapter>> getRecipes(
      String limit, String type, {String? query});
  Future<List<PreviewRecipeAdapter>> getRandomRecipes(String limit);
}
