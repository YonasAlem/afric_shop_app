import 'package:afric_shop_app/app/core/constants/app_sizes.dart';
import 'package:afric_shop_app/app/core/extensions/theme_extension.dart';
import 'package:afric_shop_app/app/features/auth/screens/email_sign_up_screen.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart'
    show ThemeSwitchingArea;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

import '../../../core/widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeSwitchingArea(
      child: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: context.isDark ? Brightness.light : Brightness.dark,
          systemNavigationBarColor: context.color.surface,
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
                        const Center(
                          child: LogoWithText(),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: context.color.primary.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(AppSizes.radius30),
                          ),
                        ),
                        Positioned(
                          top: AppSizes.height10,
                          right: AppSizes.width10,
                          child: const ThemeSwitcherButton(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: AppSizes.height20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: Column(
                      children: [
                        const HeadlineText(text: "Let's get you started"),
                        const SubtitleText(
                          text:
                              "If you are a merchant, please activate supplier mode when you sign up.",
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: PrimaryTonalButton(
                                onPressed: () {},
                                text: 'LOGIN',
                              ),
                            ),
                            SizedBox(width: AppSizes.width10),
                            Expanded(
                              child: PrimaryFilledButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const EmailSignUpScreen(),
                                    ),
                                  );
                                },
                                text: 'SIGN UP',
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
