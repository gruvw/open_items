import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/global/texts.dart';
import 'package:open_items/widgets/components/modals/cancel_dialog.dart';
import 'package:open_items/widgets/components/modals/plain_dialog.dart';

class DeletionDialog extends StatelessWidget {
  final String title;
  final String content;
  final String? target;
  final ModalCallback? onDelete;

  const DeletionDialog({
    super.key,
    this.onDelete,
    this.target,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return CancelDialog(
      title: title,
      confirmedText: Texts.deleteButton,
      danger: true,
      body: Column(
        children: [
          Text(content, style: UITexts.normal),
          if (target != null)
            Text(
              target!,
              textAlign: TextAlign.center,
              style: UITexts.normalBold,
            )
        ],
      ),
      onConfirm: onDelete,
    );
  }
}
