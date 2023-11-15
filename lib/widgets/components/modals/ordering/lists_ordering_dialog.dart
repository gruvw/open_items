import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/ordering/orderings.dart';
import 'package:open_items/state/application/account.dart';
import 'package:open_items/widgets/components/modals/ordering/ordering_button.dart';

class ListsOrderingDialog extends ConsumerWidget {
  final String accountId;

  const ListsOrderingDialog({
    super.key,
    required this.accountId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final account = ref.watch(localAccountProvider(accountId: accountId))!;
    final properties = ref.watch(
        accountPropertiesProvider(propertiesId: account.accountPropertiesId!))!;

    final selectedOrdering = properties.listsOrdering;
    final shouldReversed = properties.shouldReverseOrder;

    return Container(
      color: UIColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...ListsOrdering.values.map((e) => OrderingButton(
                label: e.label,
                selected: e == selectedOrdering,
                reversed: shouldReversed,
                onPressed: () {
                  if (e == selectedOrdering) {
                    properties
                        .copyWith(shouldReverseOrder: !shouldReversed)
                        .save();
                  } else {
                    properties
                        .copyWith(
                          listsOrdering: e,
                          shouldReverseOrder: DefaultValues.shouldReverse,
                        )
                        .save();
                  }
                },
              ))
        ],
      ),
    );
  }
}
