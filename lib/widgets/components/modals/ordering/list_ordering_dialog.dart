import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/ordering/orderings.dart';
import 'package:open_items/state/application/collection.dart';
import 'package:open_items/widgets/components/modals/ordering/ordering_button.dart';

class ListOrderingDialog extends ConsumerWidget {
  final String listPropertiesId;

  const ListOrderingDialog({
    super.key,
    required this.listPropertiesId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listProerties = ref
        .watch(accountListPropertiesProvider(propertiesId: listPropertiesId))!;

    final selectedOrdering = listProerties.itemsOrdering;
    final shouldReversed = listProerties.shouldReverseOrder;

    return Container(
      color: UIColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...ItemsOrdering.values.map(
            (o) => OrderingButton(
              label: o.label,
              selected: o == selectedOrdering,
              reversed: shouldReversed,
              onPressed: () {
                if (o == selectedOrdering) {
                  listProerties
                      .copyWith(shouldReverseOrder: !shouldReversed)
                      .save();
                } else {
                  listProerties
                      .copyWith(
                        itemsOrdering: o,
                        shouldReverseOrder: DefaultValues.shouldReverse,
                      )
                      .save();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
