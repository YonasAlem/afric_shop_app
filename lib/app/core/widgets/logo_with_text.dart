import 'package:afric_shop_app/app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key, this.logoWidth, this.textWidth});

  final double? logoWidth;
  final double? textWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          context.isDark
              ? 'assets/images/logo_white.png'
              : 'assets/images/logo_green.png',
          width: logoWidth ?? AppSizes.height100,
        ),
        SizedBox(width: AppSizes.width10),
        Image.asset(
          context.isDark
              ? 'assets/images/afric_shop_white.png'
              : 'assets/images/afric_shop_black.png',
          width: textWidth ?? AppSizes.height140,
        ),
      ],
    );
  }
}
