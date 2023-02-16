import 'package:afric_shop_app/app/core/constants/app_sizes.dart';
import 'package:afric_shop_app/app/features/onboard/screens/welcome_screen.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/themes/theme_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeRepo = await ThemeRepository.instance;
  runApp(
    MainApp(initTheme: themeRepo.initial),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required ThemeData initTheme}) : _initTheme = initTheme;

  final ThemeData _initTheme;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: _initTheme,
      builder: (_, theme) {
        return ScreenUtilInit(
          designSize: AppSizes.designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          child: const WelcomeScreen(),
          builder: (_, home) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Afric Shop',
              theme: theme,
              home: home,
            );
          },
        );
      },
    );
  }
}
