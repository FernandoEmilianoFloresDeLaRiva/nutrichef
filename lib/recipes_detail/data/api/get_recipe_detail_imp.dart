import 'package:nutrichef/core/config/data/network/get_without_auth.dart';
import 'package:nutrichef/recipes_detail/domain/adapters/recipe_detail_adapter.dart';
import 'package:nutrichef/recipes_detail/domain/repositories/get_recipe_detail_repository.dart';

class GetRecipeDetailRepositoryImpl implements GetRecipeDetailRepository {
  final GetWithoutAuth getWithoutAuth;

  GetRecipeDetailRepositoryImpl({required this.getWithoutAuth});

  @override
  Future<RecipeDetailAdapter> getRecipeDetail(int id) async {
    try {
      final response = await getWithoutAuth.get(
        '$id/information',
      );
      return RecipeDetailAdapter.fromJson(response);
    } catch (e) {
      throw Exception(e);
    }
  }
}
