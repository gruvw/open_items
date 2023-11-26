import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/texts.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/state/application/collection.dart';
import 'package:open_items/widgets/components/modals/text_dialog.dart';
import 'package:open_items/widgets/utils/feedback/empty.dart';
import 'package:open_items/widgets/validation/core.dart';
import 'package:open_items/widgets/validation/item.dart';

class EditItemTextDialog extends ConsumerWidget {
  static void show(BuildContext context, String itemLocalId) {
    showDialog(
      barrierDismissible: false,
      barrierColor: UIColors.dimmed,
      context: context,
      builder: (_) => EditItemTextDialog(itemLocalId: itemLocalId),
    );
  }

  final String itemLocalId;

  const EditItemTextDialog({
    super.key,
    required this.itemLocalId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider(itemLocalId: itemLocalId));

    if (item == null) return const Empty();

    return TextDialog(
      title: DialogTexts.editTextTitle,
      submitText: Texts.editButton,
      wrap: true,
      capitalization: TextCapitalization.sentences,
      placeholder: UIPlaceholders.itemText,
      initialValue: item.text,
      validation: validItemText,
      onSubmit: alwaysValid((newText) => item.copyWith(text: newText).save()),
    );
  }
}
