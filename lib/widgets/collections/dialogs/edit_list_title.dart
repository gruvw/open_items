import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/state/application/collection.dart';
import 'package:open_items/widgets/components/modals/text_dialog.dart';
import 'package:open_items/widgets/utils/feedback/empty.dart';
import 'package:open_items/widgets/validation/core.dart';
import 'package:open_items/widgets/validation/list.dart';

class EditListTitleDialog extends ConsumerWidget {
  final String listId;

  const EditListTitleDialog({
    super.key,
    required this.listId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider(listId: listId));

    if (list == null) return const Empty();

    return TextDialog(
      title: "Edit List Title",
      submitText: "Edit",
      capitalization: TextCapitalization.sentences,
      placeholder: UIPlaceholders.listTitle,
      initialValue: list.title,
      validation: validListTitle,
      onSubmit:
          alwaysValid((newTitle) => list.copyWith(title: newTitle).save()),
    );
  }
}
