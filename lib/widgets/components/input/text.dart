import 'package:flutter/material.dart';
import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/global/styles/text.dart';

class TextInput extends StatelessWidget {
  static const _border = OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorTheme.primary,
      width: 2,
    ),
  );

  final TextEditingController? controller;
  final String? placeholder;
  final String? errorText;

  const TextInput({
    super.key,
    this.placeholder,
    this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: _border,
        focusedBorder: _border,
        focusColor: ColorTheme.primary,
        hintText: placeholder,
        errorText: errorText,
        hintStyle: TextsTheme.normalText.apply(
          color: ColorTheme.secondaryText,
        ),
      ),
    );
  }
}
