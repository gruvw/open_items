import 'package:flutter/material.dart';
import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/global/styles/text.dart';

class TextInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? placeholder;

  const TextInput({
    super.key,
    this.placeholder,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorTheme.primary,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
          color: ColorTheme.primary,
          width: 2,
            )
          ),
        focusColor: ColorTheme.primary,
        hintText: placeholder,
        hintStyle: TextsTheme.normalText.apply(color: ColorTheme.secondaryText,),
      ),
    );
  }
}
