import 'package:nutrichef/common/domain/adapters/tags_adapter.dart';

class RecipeDetailAdapter {
  final int id;
  final String title;
  final String image;
  final int readyInMinutes;
  final TagsAdapter tags;
  final List<String> ingredients;
  final List<String> instructions;

  const RecipeDetailAdapter({
    required this.id,
    required this.title,
    required this.image,
    required this.readyInMinutes,
    required this.tags,
    required this.ingredients,
    required this.instructions,
  });

  factory RecipeDetailAdapter.fromJson(Map<String, dynamic> json) {
    final List<String> ingredients = [];
    for (var ingredient in json['extendedIngredients']) {
      ingredients.add(ingredient['original']);
    }
    final List<String> instructions = [];
    for (var instruction in json['analyzedInstructions'][0]['steps']) {
      instructions.add(instruction['step']);
    }
    return RecipeDetailAdapter(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      readyInMinutes: json['readyInMinutes'],
      tags: TagsAdapter.fromJson(json),
      ingredients: ingredients,
      instructions: instructions,
    );
  }
}
