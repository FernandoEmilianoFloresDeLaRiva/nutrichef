import 'package:flutter/material.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';

class RecipeTags extends StatelessWidget {
  final List<String> tags;
  final int? maxTags;

  const RecipeTags({
    super.key,
    required this.tags,
    this.maxTags,
  });

  @override
  Widget build(BuildContext context) {
    final displayTags = maxTags != null ? tags.take(maxTags!).toList() : tags;

    return Wrap(
      spacing: 8,
      runSpacing: 4,
      children: displayTags.map((tag) {
        return RecipeTag(label: tag);
      }).toList(),
    );
  }
}

class RecipeTag extends StatelessWidget {
  final String label;

  const RecipeTag({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppTheme.accentColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
