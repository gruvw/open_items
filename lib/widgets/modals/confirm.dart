import 'package:flutter/material.dart';
import 'package:open_items/widgets/components/buttons/solid.dart';
import 'package:open_items/widgets/modals/plain_dialog.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final VoidCallback? onPressed;
  final String confirmedText;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.body,
    this.onPressed,
    this.confirmedText = "Confirm",
  });

  @override
  Widget build(BuildContext context) {
    return PlainDialog(
      title: title,
      body: body,
      actions: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SolidButtonPrimary(
            text: confirmedText,
            onPressed: modalOnPressed(onPressed, context),
          )
        ],
      ),
    );
  }
}