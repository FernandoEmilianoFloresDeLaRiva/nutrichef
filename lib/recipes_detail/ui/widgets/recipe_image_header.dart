import 'package:flutter/material.dart';
import 'package:nutrichef/common/ui/widgets/cooking_time_chip.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';

class RecipeImageHeader extends StatelessWidget {
  final String imageUrl;
  final int cookingTime;

  const RecipeImageHeader({
    super.key,
    required this.imageUrl,
    required this.cookingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Imagen de fondo
        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: AppTheme.backgroundColor,
              child: const Icon(
                Icons.restaurant,
                size: 80,
                color: AppTheme.textSecondary,
              ),
            );
          },
        ),
        // Overlay gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.3),
              ],
            ),
          ),
        ),
        // Tiempo de cocción
        Positioned(
          bottom: 20,
          right: 20,
          child: CookingTimeChip(cookingTime: cookingTime),
        ),
      ],
    );
  }
}
