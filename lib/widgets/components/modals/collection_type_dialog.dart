import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:open_items/global/layouts.dart';
import 'package:open_items/global/texts.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/widgets/components/buttons/outlined.dart';
import 'package:open_items/widgets/components/buttons/solid.dart';
import 'package:open_items/widgets/components/modals/cancel_dialog.dart';

class CollectionTypeDialog extends HookWidget {
  final String title;
  final CollectionType initialType;
  final void Function(CollectionType type) onSelected;

  const CollectionTypeDialog({
    super.key,
    required this.title,
    required this.initialType,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final selectedType = useState(initialType);

    final types = CollectionType.values.map(
      (t) => Column(
        children: [
          _CollectionTypeButton(
            type: t,
            selected: selectedType.value == t,
            onPressed: () => selectedType.value = t,
          ),
          if (t != CollectionType.values[CollectionType.values.length - 1])
            const SizedBox(
              height: DialogLayout.buttonsContentSpacing,
            )
        ],
      ),
    );

    return CancelDialog(
      title: title,
      cancelText: UIValues.cancelTextDefault,
      confirmedText: Texts.selectButton,
      onConfirm: () {
        onSelected(selectedType.value);
      },
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: DialogLayout.buttonsContentMaxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: types.toList(),
          ),
        ),
      ),
    );
  }
}

class _CollectionTypeButton extends StatelessWidget {
  final CollectionType type;
  final bool selected;
  final VoidCallback onPressed;

  const _CollectionTypeButton({
    required this.type,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final content = Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(type.icon),
          Text(type.label),
        ],
      ),
    );

    return selected
        ? SolidButtonPrimary(onPressed: onPressed, child: content)
        : OutlinedButtonPrimary(onPressed: onPressed, child: content);
  }
}
