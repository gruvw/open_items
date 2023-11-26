import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/texts.dart';
import 'package:open_items/models/objects/item.dart';
import 'package:open_items/models/objects/list.dart';
import 'package:open_items/state/application/collection.dart';
import 'package:open_items/widgets/components/modals/collection_type_dialog.dart';
import 'package:open_items/widgets/utils/feedback/empty.dart';

class ChangeCollectionTypeDialog extends ConsumerWidget {
  static void show(BuildContext context, String collectionId) {
    showDialog(
      barrierDismissible: false,
      barrierColor: UIColors.dimmed,
      context: context,
      builder: (_) => ChangeCollectionTypeDialog(collectionId: collectionId),
    );
  }

  final String collectionId;

  const ChangeCollectionTypeDialog({
    super.key,
    required this.collectionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collection =
        ref.watch(collectionProvider(collectionId: collectionId));

    if (collection == null) return const Empty();

    return CollectionTypeDialog(
      title: DialogTexts.collectionTypeTitle,
      initialType: collection.collectionType,
      onSelected: (newType) {
        // Copy with is not defined for Collection but for its subtypes
        if (collection is Liste) collection.copyWith(type: newType).save();
        if (collection is Item) collection.copyWith(type: newType).save();
      },
    );
  }
}
