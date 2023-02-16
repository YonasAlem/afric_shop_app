import 'package:afric_shop_app/app/core/constants/app_sizes.dart';
import 'package:afric_shop_app/app/features/onboard/screens/welcome_screen.dart';
import 'package:afric_shop_app/app/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppSizes.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      child: const WelcomeScreen(),
      builder: (_, home) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Afric Shop',
          theme: AppThemes.lightMode(),
          darkTheme: AppThemes.darkMode(),
          home: home,
        );
      },
    );
  }
}
