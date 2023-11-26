import 'package:flutter/material.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/tile_button.dart';
import 'package:open_items/widgets/router/route_generator.dart';

class AccountTile extends StatelessWidget {
  final Account account;
  final bool isActive;

  const AccountTile({
    super.key,
    required this.account,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final contentColor = isActive ? UIColors.secondary : UIColors.primary;

    final display = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          account.name,
          style: UITexts.normal.apply(
            color: contentColor,
          ),
        ),
        if (!account.isOffline)
          Text(
            account.server,
            style: UITexts.normal.apply(
              color: isActive ? UIColors.secondary : UIColors.hintText,
            ),
          )
        else
          Icon(
            UIIcons.offline,
            color: contentColor,
          ),
      ],
    );

    final onPressed = !isActive
        ? () => Navigator.pushNamed(
              context,
              Routes.lists.name,
              arguments: account.localId,
            )
        : null;

    return Container(
      color: isActive ? UIColors.primary : UIColors.background,
      child: Column(
        children: [
          TileButton(
            padding: const EdgeInsets.symmetric(
              vertical: DrawerLayout.accountTileVerticalPadding,
              horizontal: DrawerLayout.accountTileHorizontalPadding,
            ),
            onPressed: onPressed,
            content: Expanded(
              child: display,
            ),
          ),
          const Divider(
            color: UIColors.primary,
            height: DrawerLayout.tileDividerWidth,
            thickness: DrawerLayout.tileDividerWidth,
          ),
        ],
      ),
    );
  }
}
