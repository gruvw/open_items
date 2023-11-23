import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/widgets/components/modals/confirmation_dialog.dart';

class NotImplementedDialog extends StatelessWidget {
  static void show(BuildContext context) {
    showDialog(
      barrierColor: UIColors.dimmed,
      context: context,
      builder: (_) => const NotImplementedDialog(),
    );
  }

  const NotImplementedDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ConfirmationDialog(
      title: "Not Implemented",
      confirmedText: "Ok",
      body: Text(
        "Sorry this functionality is not yet implemented.",
        style: UITexts.normalText,
      ),
    );
  }
}
