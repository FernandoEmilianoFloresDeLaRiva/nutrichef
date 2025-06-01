import 'package:flutter/material.dart';
import 'package:nutrichef/core/config/domain/constants/app_constants.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';

class CookingTimeChip extends StatelessWidget {
  final int cookingTime;

  const CookingTimeChip({
    super.key,
    required this.cookingTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.accentColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        '$cookingTime ${AppConstants.minutes}',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }
}
