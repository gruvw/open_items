import 'package:flutter/material.dart';
import 'package:open_items/widgets/components/modals/cancel_dialog.dart';
import 'package:open_items/widgets/utils/feedback/progress.dart';
import 'package:open_items/widgets/validation/core.dart';

class TextDialog extends StatelessWidget {
  final String title;
  final String? placeholder;
  final String? defaultText;
  final ValidationCallback<String>? validation;
  final VoidCallback? onCancel;
  final SubmitValidate? onSubmit;
  final String? submitText;
  final String? cancelText;

  const TextDialog({
    super.key,
    required this.title,
    this.placeholder,
    this.defaultText,
    this.validation,
    this.onCancel,
    this.onSubmit,
    this.submitText,
    this.cancelText,
  });

  @override
  Widget build(BuildContext context) {
    return CancelDialog(title: title, body: InfiniteProgressFeedback());
  }
}
