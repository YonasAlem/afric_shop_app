import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class HeadlineText extends StatelessWidget {
  const HeadlineText({
    super.key,
    required String text,
    double? fontSize,
  })  : _text = text,
        _fontSize = fontSize;

  final String _text;
  final double? _fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        fontSize: _fontSize ?? AppSizes.font34,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
    );
  }
}
