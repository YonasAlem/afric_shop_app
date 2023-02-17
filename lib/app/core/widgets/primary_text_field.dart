import 'package:afric_shop_app/app/core/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    super.key,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.keyboardType,
    this.prefixIcon,
    required this.controller,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final IconData? prefixIcon;
  final bool readOnly;

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  bool? obscureText;

  @override
  void initState() {
    if (widget.obscureText != null) {
      obscureText = widget.obscureText;
      widget.controller.addListener(() => setState(() {}));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly,
      controller: widget.controller,
      obscureText: obscureText ?? false,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: context.color.onBackground.withOpacity(.5))
            : null,
        suffixIcon: widget.obscureText != null && widget.controller.text.isNotEmpty
            ? IconButton(
                onPressed: () => setState(() => obscureText = !obscureText!),
                icon: Icon(
                  obscureText! ? Icons.visibility_off : Icons.visibility,
                  color: obscureText!
                      ? context.color.primary.withOpacity(.3)
                      : context.color.primary.withOpacity(.7),
                ),
              )
            : null,
        isDense: true,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: context.color.onBackground.withOpacity(.5),
        ),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: context.color.onBackground.withOpacity(.5),
        ),
      ),
    );
  }
}
