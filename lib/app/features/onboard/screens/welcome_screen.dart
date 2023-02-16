import 'package:afric_shop_app/app/core/constants/app_sizes.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../themes/theme_repository.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final theme = Theme.of(context).colorScheme;
    return ThemeSwitchingArea(
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
          systemNavigationBarColor: theme.surface,
        ),
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppSizes.height20),
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                isDark
                                    ? 'assets/images/logo_white.png'
                                    : 'assets/images/logo_green.png',
                                width: AppSizes.height100,
                              ),
                              SizedBox(width: AppSizes.width10),
                              Image.asset(
                                isDark
                                    ? 'assets/images/afric_shop_white.png'
                                    : 'assets/images/afric_shop_black.png',
                                width: AppSizes.height140,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: theme.primary.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(AppSizes.radius30),
                          ),
                        ),
                        Positioned(
                          top: AppSizes.height10,
                          right: AppSizes.width10,
                          child: ThemeSwitcher(
                            clipper: const ThemeSwitcherCircleClipper(),
                            builder: (context) {
                              return IconButton(
                                onPressed: () async {
                                  var themeName = isDark ? 'light' : 'dark';
                                  var service = await ThemeRepository.instance;
                                  if (context.mounted) {
                                    service.saveToLocal(themeName);
                                    var theme = service.getThemeByName(themeName);
                                    ThemeSwitcher.of(context).changeTheme(
                                      theme: theme,
                                      isReversed: isDark,
                                    );
                                  }
                                },
                                icon: Icon(
                                  isDark ? Icons.nights_stay : Icons.wb_sunny,
                                  color: isDark ? Colors.grey.shade600 : Colors.orange,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.height20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Column(
                      children: [
                        Text(
                          "Let's get you started",
                          style: TextStyle(
                            fontSize: AppSizes.font34,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                        SizedBox(height: AppSizes.width10),
                        Text(
                          "If you are a merchant, please activate supplier mode when you sign up.",
                          style: TextStyle(
                            fontSize: AppSizes.font15,
                            letterSpacing: 1.2,
                            color: Colors.grey,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: AppSizes.height50,
                                child: FilledButton.tonal(
                                  onPressed: () {},
                                  child: const Text('LOGIN'),
                                ),
                              ),
                            ),
                            SizedBox(width: AppSizes.width10),
                            Expanded(
                              child: SizedBox(
                                height: AppSizes.height50,
                                child: FilledButton(
                                  onPressed: () {},
                                  child: const Text('SIGN UP'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
