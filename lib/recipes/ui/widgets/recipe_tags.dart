import 'package:flutter/material.dart';
import 'package:nutrichef/common/domain/adapters/tags_adapter.dart';
import 'package:nutrichef/common/ui/widgets/recipe_tag.dart';

class RecipeTags extends StatelessWidget {
  final TagsAdapter tags;
  final int? maxTags;

  const RecipeTags({
    super.key,
    required this.tags,
    this.maxTags,
  });

  @override
  Widget build(BuildContext context) {
    final displayTags = maxTags != null ? tags.tags.take(maxTags!).toList() : tags.tags;

    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: displayTags.map((tag) {
        return RecipeTag(label: tag);
      }).toList(),
    );
  }
}
