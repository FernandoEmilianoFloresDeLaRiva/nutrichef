class RecipeAdapter {
  final int id;
  final String name;
  final String imageUrl;
  final int cookingTime;
  final List<String> tags;
  final String category;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;

  const RecipeAdapter({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.cookingTime,
    required this.tags,
    required this.category,
    this.description = '',
    this.ingredients = const [],
    this.instructions = const [],
  });
}
