import 'package:flutter/material.dart';
import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/global/styles/text.dart';

VoidCallback modalOnPressed(VoidCallback? onPressed, BuildContext context) {
  return () {
    onPressed?.call();
    Navigator.pop(context);
  };
}

class PlainDialog extends StatelessWidget {
  static const _maxWidth = 800.0;
  static const _spacer = SizedBox(height: 14);
  static const _borderWidth = 3.0;
  static const _borderRadius = 6.0;
  static const _padding = 16.0;
  static const _outerMargin = 25.0;

  final String title;
  final Widget body;
  final Widget actions;

  const PlainDialog({
    super.key,
    required this.title,
    required this.body,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: _borderWidth,
          color: UIColors.primary,
        ),
        borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: _outerMargin),
      child: Container(
        constraints: const BoxConstraints(maxWidth: _maxWidth),
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      UITexts.titleText.copyWith(fontWeight: FontWeight.w600),
                ),
                _spacer,
                body,
                _spacer,
                actions,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
