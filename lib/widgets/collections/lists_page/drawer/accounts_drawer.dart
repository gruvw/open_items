import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_icons.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/state/application/database.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/account_tile.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/drawer_section.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/tile_button.dart';
import 'package:open_items/widgets/components/modals/cancel_dialog.dart';
import 'package:open_items/widgets/components/modals/text_dialog.dart';
import 'package:open_items/widgets/router/route_generator.dart';
import 'package:open_items/widgets/validation/accounts/new_offline_name.dart';

class AccountsDrawer extends ConsumerWidget {
  final Account selectedAccount;
  final ValueNotifier<bool>? accountDeleted;

  const AccountsDrawer({
    super.key,
    required this.selectedAccount,
    this.accountDeleted,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(localAccountsProvider);

    final deletionDialog = CancelDialog(
      title: "Delete Account",
      confirmedText: "Delete",
      danger: true,
      body: Text(
        "Do you really want to delete this account: ${selectedAccount.name} ?",
        style: UITexts.normalText,
      ),
      onConfirm: () {
        accountDeleted?.value = true;

        final nextAccount = accounts
            .where((a) => a.localId != selectedAccount.localId)
            .firstOrNull;

        selectedAccount
            .delete()
            .then((_) => selectedAccount.notify(EventType.delete));

        Navigator.pushNamedAndRemoveUntil(
          context,
          nextAccount == null ? Routes.authenticate.name : Routes.lists.name,
          arguments: nextAccount,
          (_) => false,
        );

        return false;
      },
    );

    final nameDialog = TextDialog(
      title: "Edit Account Name",
      submitText: "Edit",
      validation: validOfflineAccountRename(selectedAccount.name),
      placeholder: UIValues.accountNamePlaceholder,
      initialValue: selectedAccount.name,
      onSubmit: (name) {
        // TODO
      },
    );

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
              leading: const Icon(UIIcons.import, color: UIColors.primary),
              content: Text("Import data", style: UITexts.normalText),
            ),
            TileButton(
              leading: const Icon(UIIcons.export, color: UIColors.primary),
              content: Text("Export data", style: UITexts.normalText),
            ),
            _divider,
            TileButton(
              leading: const Icon(UIIcons.rename, color: UIColors.primary),
              content: Text("Rename account", style: UITexts.normalText),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => nameDialog,
                );
              },
            ),
            _divider,
            TileButton(
              leading: const Icon(UIIcons.delete, color: UIColors.danger),
              content: Text("Delete account", style: UITexts.normalText),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => deletionDialog,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  static const _divider = Divider(
    color: UIColors.primary,
    height: DrawerLayout.tileDividerWidth,
    thickness: DrawerLayout.tileDividerWidth,
  );
}
