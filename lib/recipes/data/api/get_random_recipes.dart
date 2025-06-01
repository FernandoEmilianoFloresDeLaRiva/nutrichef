import 'package:nutrichef/core/config/data/network/get_without_auth.dart';
import 'package:nutrichef/recipes/domain/adapters/preview_receipe_adapter.dart';

class GetRandomRecipes {
  static Future<List<PreviewRecipeAdapter>> get() async {
    try {
      final response = await GetWithoutAuth.get("random", params: {
        "number": "10",
      });
      final List<dynamic> results = response['recipes'];
      return results.map((e) => PreviewRecipeAdapter.fromJson(e)).toList();
    } catch (e) {
      throw Exception("Error fetching data: $e");
    }
  }
}
