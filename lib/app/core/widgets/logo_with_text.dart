import 'package:afric_shop_app/app/core/constants/app_images.dart';
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
        Hero(
          tag: 'logo',
          child: Image.asset(
            context.isDark ? AppImages.logoWhite : AppImages.logoGreen,
            width: logoWidth ?? AppSizes.height100,
          ),
        ),
        SizedBox(width: AppSizes.width10),
        Hero(
          tag: 'text',
          child: Image.asset(
            context.isDark ? AppImages.africShopWhite : AppImages.africShopBlack,
            width: textWidth ?? AppSizes.height140,
          ),
        ),
      ],
    );
  }
}
