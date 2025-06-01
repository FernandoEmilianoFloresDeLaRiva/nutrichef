import 'package:flutter/material.dart';
import 'package:nutrichef/common/ui/widgets/recipe_tag.dart';

class RecipeTagsWidget extends StatelessWidget {
  final List<String> tags;

  const RecipeTagsWidget({
    super.key,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: tags.map((tag) => RecipeTag(label: tag)).toList(),
    );
  }
}
