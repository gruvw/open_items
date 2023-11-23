import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/state/application/collection.dart';
import 'package:open_items/widgets/collections/dialogs/edit_list_title.dart';
import 'package:open_items/widgets/utils/feedback/empty.dart';

class ListTitle extends ConsumerWidget {
  final String listId;

  const ListTitle({
    super.key,
    required this.listId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider(listId: listId));

    if (list == null) return const Empty();

    return InkWell(
      onTap: () => EditListTitleDialog.show(context, listId),
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
