import 'package:nutrichef/core/config/data/network/get_without_auth.dart';
import 'package:nutrichef/recipes/domain/adapters/preview_receipe_adapter.dart';

class GetRecipes {
  static Future<List<PreviewRecipeAdapter>> get(String type,
      {String? query}) async {
    try {
      final params = {
        "number": "10",
        "addRecipeInformation": "true",
        "type": type
      };
      if (query != null && query.trim().isNotEmpty) {
        params["query"] = query;
      }
      final response =
          await GetWithoutAuth.get("complexSearch", params: params);
      final List<dynamic> results = response['results'];
      final recipes =
          results.map((e) => PreviewRecipeAdapter.fromJson(e)).toList();
      return recipes;
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
