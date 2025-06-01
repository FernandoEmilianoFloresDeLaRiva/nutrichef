import 'package:flutter/material.dart';
import 'package:nutrichef/recipes/ui/widgets/category_chip.dart';

class CategorySelector extends StatelessWidget {
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: categories.map((category) {
            final isSelected = category == selectedCategory;
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: CategoryChip(
                label: category,
                isSelected: isSelected,
                onTap: () => onCategoryChanged(category),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
