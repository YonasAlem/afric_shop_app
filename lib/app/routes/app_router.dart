import 'package:afric_shop_app/app/features/auth/screens/email_login_screen.dart';
import 'package:afric_shop_app/app/features/auth/screens/email_sign_up_screen.dart';
import 'package:afric_shop_app/app/features/auth/screens/phone_auth_screen.dart';
import 'package:afric_shop_app/app/features/onboard/screens/welcome_screen.dart';
import 'package:afric_shop_app/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcome:
        return PageTransition(
          child: const WelcomeScreen(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case AppRoutes.emailSignup:
        return PageTransition(
          child: const EmailSignUpScreen(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case AppRoutes.emailLogin:
        return PageTransition(
          child: const EmailLoginScreen(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      case AppRoutes.phoneAuth:
        return PageTransition(
          child: const PhoneAuthScreen(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
      default:
        return PageTransition(
          child: const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 500),
          reverseDuration: const Duration(milliseconds: 500),
        );
    }
  }
}
