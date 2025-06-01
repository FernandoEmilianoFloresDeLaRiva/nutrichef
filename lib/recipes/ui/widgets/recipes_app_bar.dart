import 'package:flutter/material.dart';
import 'package:nutrichef/core/config/domain/constants/app_constants.dart';
import 'package:nutrichef/core/config/ui/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:nutrichef/recipes/ui/notifiers/nutrichef_notifier.dart';

class RecipesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RecipesAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<NutriChefNotifier>(context);
    return AppBar(
      backgroundColor: AppTheme.primaryColor,
      elevation: 0,
      title: notifier.isSearching
          ? Row(
              children: [
                Expanded(
                  child: TextField(
                    autofocus: true,
                    decoration: const InputDecoration(
                      hintText: 'Buscar receta...',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    onChanged: notifier.updateSearchText,
                    onSubmitted: (_) => FocusScope.of(context).unfocus(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    notifier.searchRecipes();
                    FocusScope.of(context).unfocus();
                  },
                ),
              ],
            )
          : const Row(
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
        if (notifier.isSearching)
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: notifier.stopSearch,
          )
        else
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: notifier.startSearch,
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
