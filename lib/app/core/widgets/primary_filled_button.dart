import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';

class PrimaryFilledButton extends StatelessWidget {
  const PrimaryFilledButton({
    super.key,
    required String text,
    VoidCallback? onPressed,
    double? height,
    double? width,
  })  : _text = text,
        _onPressed = onPressed,
        _height = height,
        _width = width;

  final String _text;
  final VoidCallback? _onPressed;
  final double? _height;
  final double? _width;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'filled',
      child: SizedBox(
        height: _height ?? AppSizes.height50,
        width: _width,
        child: FilledButton(
          onPressed: _onPressed,
          child: Text(_text),
        ),
      ),
    );
  }
}
