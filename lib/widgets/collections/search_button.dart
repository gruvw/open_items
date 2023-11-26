import 'package:flutter/material.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/widgets/utils/feedback/dialogs.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        UIIcons.search,
        color: UIColors.secondary,
      ),
      onPressed: () => NotImplementedDialog.show(context),
    );
  }
}
