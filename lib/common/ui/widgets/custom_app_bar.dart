import 'package:flutter/material.dart';
import 'package:nutrichef/core/config/domain/constants/app_constants.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppTheme.primaryColor,
      elevation: 0,
      title: const Row(
        children: [
          Icon(Icons.restaurant_menu, color: Colors.white),
          SizedBox(width: 8),
          Text(
            AppConstants.appName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search, color: Colors.white),
          onPressed: () {
            // TODO: Implement search
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Search soon')),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.account_circle, color: Colors.white),
          onPressed: () {
            // TODO: Implement profile
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Profile soon')),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
