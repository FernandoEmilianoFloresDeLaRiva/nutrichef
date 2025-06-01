import 'package:nutrichef/core/config/data/network/get_without_auth.dart';
import 'package:nutrichef/recipes/domain/adapters/preview_receipe_adapter.dart';

class GetRecipes {
  static Future<List<PreviewRecipeAdapter>> get(String type) async {
    try {
      final response = await GetWithoutAuth.get("complexSearch", params: {
        "number": "10",
        "addRecipeInformation": "true",
        "type": type
      });
      final List<dynamic> results = response['results'];
      final recipes =
          results.map((e) => PreviewRecipeAdapter.fromJson(e)).toList();
      return recipes;
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
