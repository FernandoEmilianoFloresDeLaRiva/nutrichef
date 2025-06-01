import 'package:nutrichef/recipes_detail/domain/adapters/recipe_detail_adapter.dart';
import 'package:nutrichef/recipes_detail/domain/repositories/get_recipe_detail_repository.dart';

class GetRecipeDetailUseCase {
  final GetRecipeDetailRepository getRecipeDetailRepository;

  GetRecipeDetailUseCase({required this.getRecipeDetailRepository});

  Future<RecipeDetailAdapter> call(int id) async {
    return await getRecipeDetailRepository.getRecipeDetail(id);
  }
}
