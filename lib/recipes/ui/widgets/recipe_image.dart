import 'package:flutter/material.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';

class RecipeImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double borderRadius;

  const RecipeImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: Colors.grey[300],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: _buildImageContent(),
      ),
    );
  }

  Widget _buildImageContent() {
    if (imageUrl.isNotEmpty) {
      return Image.network(
        imageUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: AppTheme.primaryColor.withOpacity(0.1),
            child: Icon(
              Icons.restaurant,
              size: (height != null && height!.isFinite) ? height! * 0.4 : 40,
              color: AppTheme.primaryColor.withOpacity(0.6),
            ),
          );
        },
      );
    } else {
      return Container(
        color: AppTheme.primaryColor.withOpacity(0.1),
        child: Icon(
          Icons.restaurant,
          size: (height != null && height!.isFinite) ? height! * 0.4 : 40,
          color: AppTheme.primaryColor.withOpacity(0.6),
        ),
      );
    }
  }
}
