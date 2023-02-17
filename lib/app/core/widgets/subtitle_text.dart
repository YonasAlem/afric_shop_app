import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class SubtitleText extends StatelessWidget {
  const SubtitleText({
    super.key,
    required String text,
    double? fontSize,
    Color? color,
  })  : _text = text,
        _fontSize = fontSize,
        _color = color;

  final String _text;
  final double? _fontSize;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
        color: _color ?? Theme.of(context).textTheme.labelMedium!.color!.withOpacity(.4),
        fontSize: _fontSize ?? AppSizes.font15,
        letterSpacing: 1.2,
      ),
    );
  }
}
