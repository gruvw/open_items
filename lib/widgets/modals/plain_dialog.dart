import 'package:flutter/material.dart';
import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/global/styles/text.dart';

VoidCallback modalOnPressed(VoidCallback? onPressed, BuildContext context) => () {
  onPressed?.call();
  Navigator.pop(context);
};

class PlainDialog extends StatelessWidget {
  static const _spacer = SizedBox(height: 10);
  static const _border = RoundedRectangleBorder(
    side: BorderSide(
      width: 2,
      color: ColorTheme.primary,
    ),
    borderRadius: BorderRadius.all(Radius.circular(4)),
  );
  static const _padding = EdgeInsets.all(8.0);

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
      shape: _border,
      child: Padding(
        padding: _padding,
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextsTheme.titleText,
              ),
              _spacer,
              body,
              _spacer,
              actions,
            ],
          ),
        ),
      ),
    );
  }
}
