import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/state/application/collection.dart';
import 'package:open_items/widgets/components/modals/text_dialog.dart';
import 'package:open_items/widgets/utils/feedback/empty.dart';
import 'package:open_items/widgets/validation/core.dart';
import 'package:open_items/widgets/validation/item.dart';

class EditItemTextDialog extends ConsumerWidget {
  static void show(BuildContext context, String itemId) {
    showDialog(
      barrierDismissible: false,
      barrierColor: UIColors.dimmed,
      context: context,
      builder: (_) => EditItemTextDialog(itemId: itemId),
    );
  }

  final String itemId;

  const EditItemTextDialog({
    super.key,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider(itemId: itemId));

    if (item == null) return const Empty();

    return TextDialog(
      title: "Edit Item Text",
      submitText: "Edit",
      wrap: true,
      capitalization: TextCapitalization.sentences,
      placeholder: UIPlaceholders.itemText,
      initialValue: item.text,
      validation: validItemText,
      onSubmit: alwaysValid((newText) => item.copyWith(text: newText).save()),
    );
  }
}
