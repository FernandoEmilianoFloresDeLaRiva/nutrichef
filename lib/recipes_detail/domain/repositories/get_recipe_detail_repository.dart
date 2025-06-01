
import 'package:nutrichef/recipes_detail/domain/adapters/recipe_detail_adapter.dart';

abstract class GetRecipeDetailRepository {
  Future<RecipeDetailAdapter> getRecipeDetail(int id);
}

