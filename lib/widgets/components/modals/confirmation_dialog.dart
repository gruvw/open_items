import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/widgets/components/buttons/solid.dart';
import 'package:open_items/widgets/components/modals/plain_dialog.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final ModalCallback? onPressed;
  final String confirmedText;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.body,
    this.onPressed,
    this.confirmedText = UIValues.confirmTextDefault,
  });

  @override
  Widget build(BuildContext context) {
    return PlainDialog(
      title: title,
      body: body,
      actions: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SolidButtonPrimary(
            onPressed: modalOnPressed(context, onPressed),
            child: Text(
              confirmedText,
              style: UITexts.normalText.apply(color: UIColors.secondary),
            ),
          )
        ],
      ),
    );
  }
}
