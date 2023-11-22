import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/state/application/collection.dart';
import 'package:open_items/widgets/components/modals/text_dialog.dart';
import 'package:open_items/widgets/utils/feedback/empty.dart';
import 'package:open_items/widgets/validation/core.dart';
import 'package:open_items/widgets/validation/list.dart';

class ListTitle extends ConsumerWidget {
  final String listId;

  const ListTitle({
    super.key,
    required this.listId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider(localId: listId));

    if (list == null) return const Empyt();

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => TextDialog(
            title: "Edit List Title",
            submitText: "Edit",
            capitalization: TextCapitalization.sentences,
            placeholder: UIPlaceholders.listTitle,
            initialValue: list.title,
            validation: validListTitle,
            onSubmit: alwaysValid(
                (newTitle) => list.copyWith(title: newTitle).save()),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        color: UIColors.primary,
        padding: const EdgeInsets.symmetric(
          vertical: CollectionLayout.titleVerticalPadding,
          horizontal: CollectionLayout.titleHorizontalPadding,
        ),
        child: Column(
          children: [
            Text(
              list.title,
              textAlign: TextAlign.center,
              style: UITexts.titleText.copyWith(color: UIColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
