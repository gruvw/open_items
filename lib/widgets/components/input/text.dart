import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/global/styles/text.dart';

class TextInput extends HookWidget {
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
    final textController = controller ?? useTextEditingController();
    final isEmpty = useState(textController.text.isEmpty);

    return TextField(
      controller: textController,
      onChanged: (value) => isEmpty.value = value.isEmpty,
      decoration: InputDecoration(
        enabledBorder: _border,
        focusedBorder: _border,
        focusColor: ColorTheme.primary,
        hintText: placeholder,
        errorText: errorText,
        hintStyle: TextsTheme.normalText.apply(
          color: ColorTheme.secondaryText,
        ),
        suffixIcon: !isEmpty.value
            ? IconButton(
                onPressed: () {
                  textController.clear();
                  isEmpty.value = true;
                },
                color: ColorTheme.primary,
                icon: const Icon(Icons.clear),
              )
            : null,
      ),
    );
  }
}
