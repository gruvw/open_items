import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/texts.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/state/application/collection.dart';
import 'package:open_items/widgets/components/modals/text_dialog.dart';
import 'package:open_items/widgets/utils/feedback/empty.dart';
import 'package:open_items/widgets/validation/core.dart';
import 'package:open_items/widgets/validation/list.dart';

class EditListTitleDialog extends ConsumerWidget {
  static void show(BuildContext context, String listLocalId) {
    showDialog(
      barrierDismissible: false,
      barrierColor: UIColors.dimmed,
      context: context,
      builder: (_) => EditListTitleDialog(listLocalId: listLocalId),
    );
  }

  final String listLocalId;

  const EditListTitleDialog({
    super.key,
    required this.listLocalId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider(listLocalId: listLocalId));

    if (list == null) return const Empty();

    return TextDialog(
      title: DialogTexts.editTitleTitle,
      submitText: Texts.editButton,
      capitalization: TextCapitalization.sentences,
      placeholder: UIPlaceholders.listTitle,
      initialValue: list.title,
      validation: validListTitle,
      onSubmit: alwaysValid((newTitle) => list.copyWith(title: newTitle).save()),
    );
  }
}
