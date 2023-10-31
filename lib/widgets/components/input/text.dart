import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_icons.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/utils/lang.dart';

class TextInput extends HookWidget {
  final TextEditingController? controller;
  final String? label;
  final String? placeholder;
  final String? errorText;
  final bool? obscureText;
  final bool autoFocus;
  final void Function(String value)? onChanged;

  const TextInput({
    super.key,
    this.label,
    this.placeholder,
    this.controller,
    this.errorText,
    this.obscureText,
    this.onChanged,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final textController = controller ?? useTextEditingController();
    final focus = useFocusNode();
    useListenable(focus);

    // Used to display (or not) the clear button
    useListenable(textController);
    final isEmpty = textController.text.isEmpty;

    // Used to display (or not) the obscure button
    final obscured = useState(obscureText);
    final shouldObscure = obscured.value ?? false;
    final hasError = errorText != null && !(focus.hasFocus && isEmpty);

    // Widgets

    final clearButton = IconButton(
      onPressed: () {
        textController.clear();
        onChanged?.call(textController.text);
      },
      color: UIColors.primary,
      icon: const Icon(UIIcons.clear),
    );

    final visibilityButton = IconButton(
      onPressed: () {
        obscured.value = obscured.value.map((v) => !v);
      },
      color: UIColors.primary,
      icon: Icon(shouldObscure ? UIIcons.hidden : UIIcons.visible),
    );

    return TextField(
      focusNode: focus,
      autofocus: autoFocus,
      controller: textController,
      obscureText: shouldObscure,
      enableSuggestions: !shouldObscure,
      autocorrect: !shouldObscure,
      style: UITexts.normalText,
      cursorColor: UIColors.primary,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: TextInputLayout.contentVerticalPadding,
          horizontal: TextInputLayout.contentHorizontalPadding,
        ),
        errorMaxLines: TextInputLayout.errorMaxLines,
        hintText: placeholder,
        labelText: label,
        errorText: hasError ? errorText : null,
        enabledBorder: _border,
        focusedBorder: _border,
        errorBorder: _errorBorder,
        focusedErrorBorder: _errorBorder,
        focusColor: UIColors.primary,
        labelStyle: UITexts.normalText.apply(
          color: UIColors.hintText,
        ),
        floatingLabelStyle: UITexts.normalText.apply(
          color: hasError ? UIColors.danger : UIColors.primary,
        ),
        errorStyle: UITexts.subText.apply(
          color: UIColors.danger,
        ),
        hintStyle: UITexts.normalText.apply(
          color: UIColors.hintText,
        ),
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isEmpty) clearButton,
            if (obscureText != null) visibilityButton,
          ],
        ),
      ),
    );
  }
}

// Styles

const _border = OutlineInputBorder(
  borderSide: BorderSide(
    color: UIColors.primary,
    width: TextInputLayout.borderWidth,
  ),
);

const _errorBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: UIColors.danger,
    width: TextInputLayout.borderWidth,
  ),
);
