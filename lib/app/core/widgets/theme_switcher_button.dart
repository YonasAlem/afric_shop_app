import 'package:afric_shop_app/app/core/extensions/theme_extension.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

import '../../themes/theme_repository.dart';

class ThemeSwitcherButton extends StatelessWidget {
  const ThemeSwitcherButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitcher(
      clipper: const ThemeSwitcherCircleClipper(),
      builder: (context) {
        return IconButton(
          onPressed: () async {
            var themeName = context.isDark ? 'light' : 'dark';
            var service = await ThemeRepository.instance;
            if (context.mounted) {
              service.saveToLocal(themeName);
              var theme = service.getThemeByName(themeName);
              ThemeSwitcher.of(context).changeTheme(
                theme: theme,
                isReversed: context.isDark,
              );
            }
          },
          icon: Icon(
            context.isDark ? Icons.nights_stay : Icons.wb_sunny,
            color: context.isDark ? Colors.grey.shade600 : Colors.orange,
          ),
        );
      },
    );
  }
}
