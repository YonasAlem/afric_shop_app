import 'package:afric_shop_app/app/core/constants/app_sizes.dart';
import 'package:afric_shop_app/app/core/local/storage_preference.dart';
import 'package:afric_shop_app/app/features/auth/controller/auth_controller.dart';
import 'package:afric_shop_app/app/features/home/screens/customer_home_screen.dart';
import 'package:afric_shop_app/app/features/home/screens/supplier_home_screen.dart';
import 'package:afric_shop_app/app/routes/app_router.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/features/auth/screens/customer_info_screen.dart';
import 'app/features/auth/screens/email_verify_screen.dart';
import 'app/features/auth/screens/supplier_info_screen.dart';
import 'app/features/onboard/screens/welcome_screen.dart';
import 'app/themes/theme_repository.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StoragePreference.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final themeRepo = await ThemeRepository.instance;
  runApp(
    ProviderScope(
      child: MainApp(initTheme: themeRepo.initial),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key, required ThemeData initTheme}) : _initTheme = initTheme;

  final ThemeData _initTheme;

  Widget? getStartUpScreen(WidgetRef ref) {
    return ref.watch(getCurrenAuthStateProvider).when(
          data: (state) {
            if (state == AuthState.customerHome) return const CustomerHomeScreen();
            if (state == AuthState.supplierHome) return const SupplierHomeScreen();
            if (state == AuthState.customerInfoPending) return const CustomerInfoScreen();
            if (state == AuthState.supplierInfoPending) return const SupplierInfoScreen();
            if (state == AuthState.verificationPending) return const EmailVerifyScreen();
            return const WelcomeScreen();
          },
          error: (error, stack) => Text(error.toString()),
          loading: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ThemeProvider(
      initTheme: _initTheme,
      builder: (_, theme) {
        return ScreenUtilInit(
          designSize: AppSizes.designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          child: getStartUpScreen(ref),
          builder: (_, home) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Afric Shop',
              theme: theme,
              home: home,
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          },
        );
      },
    );
  }
}
