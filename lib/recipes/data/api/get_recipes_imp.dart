import 'package:nutrichef/core/config/data/network/get_without_auth.dart';
import 'package:nutrichef/recipes/domain/adapters/preview_receipe_adapter.dart';
import 'package:nutrichef/recipes/domain/repositories/get_recipes_repository.dart';

class GetRecipesImp implements GetRecipesRepository {
  final GetWithoutAuth getWithoutAuth;
  GetRecipesImp({required this.getWithoutAuth});

  @override
  Future<List<PreviewRecipeAdapter>> getRandomRecipes(String limit) async {
    try {
      final response = await getWithoutAuth.get("random", params: {
        "number": limit,
      });
      final List<dynamic> results = response['recipes'];
      return results.map((e) => PreviewRecipeAdapter.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }

  @override
  Future<List<PreviewRecipeAdapter>> getRecipes(String limit, String type,
      {String? query}) async {
    try {
      final params = {
        "number": limit,
        "addRecipeInformation": "true",
        "type": type
      };
      if (query != null && query.trim().isNotEmpty) {
        params["query"] = query;
      }
      final response =
          await getWithoutAuth.get("complexSearch", params: params);
      final List<dynamic> results = response['results'];
      final recipes =
          results.map((e) => PreviewRecipeAdapter.fromJson(e)).toList();
      return recipes;
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
