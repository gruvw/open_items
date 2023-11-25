import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/state/application/collection.dart';
import 'package:open_items/widgets/components/modals/cancel_dialog.dart';
import 'package:open_items/widgets/utils/feedback/empty.dart';

class DeleteCollectionDialog extends ConsumerWidget {
  static void deleteCollection(
    BuildContext context,
    Collection collection, [
    bool shouldPop = false,
  ]) {
    if (collection.itemIds.isNotEmpty) {
      show(context, collection.localId, shouldPop);
    } else {
      collection.delete();
      if (shouldPop) {
        Navigator.pop(context);
      }
    }
  }

  static void show(
    BuildContext context,
    String collectionId, [
    bool shouldPop = false,
  ]) {
    showDialog(
      barrierColor: UIColors.dimmed,
      context: context,
      builder: (dialogContext) => DeleteCollectionDialog(
        collectionId: collectionId,
        shouldPop: shouldPop,
      ),
    );
  }

  final String collectionId;
  final bool shouldPop;

  const DeleteCollectionDialog({
    super.key,
    required this.collectionId,
    this.shouldPop = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collection =
        ref.watch(collectionProvider(collectionId: collectionId));

    if (collection == null) return const Empty();

    return CancelDialog(
      title: "Delete Collection",
      confirmedText: "Delete",
      danger: true,
      body: Text(
        "Do you really want to delete this collection: ${collection.content} ?",
        style: UITexts.normalText,
      ),
      onConfirm: () {
        collection.delete();

        if (shouldPop) {
          // Here we pop twice: once for dialog and once more for deleted collection page
          int count = 0;
          Navigator.popUntil(context, (route) => count++ == 1);
        }
      },
    );
  }
}
