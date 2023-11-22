import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/widgets/components/modals/confirmation_dialog.dart';

final notImplementedDialog = ConfirmationDialog(
  title: "Not Implemented",
  confirmedText: "Ok",
  body: Text(
    "Sorry this functionality is not yet implemented.",
    style: UITexts.normalText,
  ),
);
