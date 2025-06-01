import 'package:flutter/material.dart';
import 'package:nutrichef/common/ui/overlyays/gradient_overlay.dart';
import 'package:nutrichef/core/config/domain/constants/app_constants.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';
import 'package:nutrichef/recipes/domain/adapters/preview_receipe_adapter.dart';
import 'package:nutrichef/recipes/ui/widgets/recipe_image.dart';

class FeaturedRecipeCard extends StatelessWidget {
  final PreviewRecipeAdapter recipe;

  const FeaturedRecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetail(context),
      child: Container(
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Stack(
            children: [
              // Background image
              RecipeImage(
                imageUrl: recipe.image,
                width: 300,
                height: 220,
              ),

              // Gradient overlay
              const GradientOverlay(),

              // Recipe information
              Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      recipe.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),

              // Time badge
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.accentColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${recipe.readyInMinutes} ${AppConstants.minutes}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToDetail(BuildContext context) {}
}
