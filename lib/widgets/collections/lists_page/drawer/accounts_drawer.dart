import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_icons.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/state/application/database.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/account_tile.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/drawer_section.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/tile_button.dart';
import 'package:open_items/widgets/router/route_generator.dart';

class AccountsDrawer extends ConsumerWidget {
  static const _divider = Divider(
    height: DrawerLayout.tileDividerWidth,
    thickness: DrawerLayout.tileDividerWidth,
  );

  final Account selectedAccount;

  const AccountsDrawer({
    super.key,
    required this.selectedAccount,
  });

  void sendToAuthenticate(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.authenticate.name,
      // Make it first page if there are no accounts
      // (_) => database.getLocalAccounts().isNotEmpty,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(localAccountsProvider);

    return SafeArea(
      child: Drawer(
        backgroundColor: UIColors.background,
        child: Column(
          children: [
            const DrawerSection(
              title: "Accounts",
            ),
            for (final account in accounts)
              AccountTile(
                account: account,
                isActive: account.localId == selectedAccount.localId,
              ),
            TileButton(
              leading: const Icon(
                UIIcons.add,
                color: UIColors.primary,
              ),
              content: Text(
                "Add account",
                style: UITexts.normalText,
              ),
              onPressed: () => Navigator.pushNamed(
                context,
                Routes.authenticate.name,
              ),
            ),
            const SizedBox(
              height: DrawerLayout.sectionSpacing,
            ),
            DrawerSection(
              title: selectedAccount.name,
            ),
            TileButton(
              leading: const Icon(
                UIIcons.import,
                color: UIColors.primary,
              ),
              content: Text(
                "Import data",
                style: UITexts.normalText,
              ),
            ),
            TileButton(
              leading: const Icon(
                UIIcons.export,
                color: UIColors.primary,
              ),
              content: Text(
                "Export data",
                style: UITexts.normalText,
              ),
            ),
            _divider,
            TileButton(
              leading: const Icon(
                UIIcons.rename,
                color: UIColors.primary,
              ),
              content: Text(
                "Rename account",
                style: UITexts.normalText,
              ),
            ),
            TileButton(
              leading: const Icon(
                UIIcons.delete,
                color: UIColors.danger,
              ),
              content: Text(
                "Delete account",
                style: UITexts.normalText,
              ),
              onPressed: () {
                // TODO confirm dialog

                final nextAccount = accounts
                    .where((a) => a.localId != selectedAccount.localId)
                    .firstOrNull;

                if (nextAccount == null) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.authenticate.name,
                    (_) => false,
                  );
                } else {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.lists.name,
                    arguments: nextAccount,
                    (_) => false,
                  );
                }

                // FIX https://stackoverflow.com/questions/59291336/navigator-pop-callback
                Future.delayed(const Duration(milliseconds: 500), () {
                  selectedAccount
                      .delete()
                      .then((_) => selectedAccount.notify(EventType.delete));
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
