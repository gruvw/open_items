import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/state/application/collection.dart';

class ListTitle extends ConsumerWidget {
  final String listId;

  const ListTitle({
    super.key,
    required this.listId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider(localId: listId));

    if (list == null) return const SizedBox();

    return Container(
      color: UIColors.primary,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Text(
            list.title,
            textAlign: TextAlign.center,
            style: UITexts.titleText.copyWith(color: UIColors.secondary),
          ),
        ],
      ),
    );
  }
}
