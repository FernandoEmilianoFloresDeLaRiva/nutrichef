import 'package:nutrichef/recipes/domain/adapters/preview_receipe_adapter.dart';
import 'package:nutrichef/recipes/domain/repositories/get_recipes_repository.dart';

class GetRandomRecipesUseCase {
  final GetRecipesRepository getRecipesRepository;
  GetRandomRecipesUseCase({required this.getRecipesRepository});

  Future<List<PreviewRecipeAdapter>> call(String limit) async {
    return getRecipesRepository.getRandomRecipes(limit);
  }
}
