import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/widgets/components/buttons/outlined.dart';
import 'package:open_items/widgets/components/buttons/plain.dart';
import 'package:open_items/widgets/components/buttons/solid.dart';
import 'package:open_items/widgets/components/modals/plain_dialog.dart';

class CancelDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final bool danger;
  final ModalCallback? onCancel;
  final ModalCallback? onConfirm;
  final String confirmedText;
  final String cancelText;
  final bool confirmEnabled;

  const CancelDialog({
    super.key,
    required this.title,
    required this.body,
    this.danger = false,
    bool? confirmEnabled,
    this.onCancel,
    this.onConfirm,
    String? confirmedText,
    String? cancelText,
  })  : confirmedText = confirmedText ?? UIValues.confirmTextDefault,
        cancelText = cancelText ?? UIValues.cancelTextDefault,
        confirmEnabled = confirmEnabled ?? true;

  @override
  Widget build(BuildContext context) {
    return PlainDialog(
      title: title,
      body: body,
      actions: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OutlinedButtonPrimary(
            onPressed: modalOnPressed(context, onCancel),
            child: Text(cancelText, style: UITexts.normalText),
          ),
          if (danger)
            PlainButton(
              onPressed: modalOnPressed(context, onConfirm),
              foregroundColor: UIColors.background,
              backgroundColor: UIColors.danger,
              borderColor: UIColors.danger,
              child: Text(
                confirmedText,
                style: UITexts.normalText.apply(color: UIColors.secondary),
              ),
            )
          else
            SolidButtonPrimary(
              onPressed: modalOnPressed(context, onConfirm),
              enabled: confirmEnabled,
              child: Text(
                confirmedText,
                style: UITexts.normalText.apply(color: UIColors.secondary),
              ),
            ),
        ],
      ),
    );
  }
}
