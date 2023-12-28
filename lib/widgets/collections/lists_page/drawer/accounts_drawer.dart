import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/global/texts.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/database.dart';
import 'package:open_items/state/application/account.dart';
import 'package:open_items/state/application/accounts.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/account_tile.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/drawer_section.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/tile_button.dart';
import 'package:open_items/widgets/components/modals/deletion_dialog.dart';
import 'package:open_items/widgets/components/modals/text_dialog.dart';
import 'package:open_items/widgets/router/route_generator.dart';
import 'package:open_items/widgets/utils/feedback/dialogs.dart';
import 'package:open_items/widgets/validation/account.dart';
import 'package:open_items/widgets/validation/core.dart';

class AccountsDrawer extends ConsumerWidget {
  final String selectedAccountLocalId;

  const AccountsDrawer({
    super.key,
    required this.selectedAccountLocalId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(localAccountsProvider);
    final selectedAccount = ref.watch(localAccountProvider(
      accountLocalId: selectedAccountLocalId,
    ))!;

    final deletionDialog = DeletionDialog(
      title: DialogTexts.deleteAccountTitle,
      content: DialogTexts.deleteAccountContent,
      target: selectedAccount.name,
      onDelete: () {
        final nextAccount = accounts
            .where((a) => a.localId != selectedAccount.localId)
            .firstOrNull;

        selectedAccount
            .delete()
            .then((_) => selectedAccount.notify(EventType.delete));

        Navigator.pushNamedAndRemoveUntil(
          context,
          nextAccount == null ? Routes.authenticate.name : Routes.lists.name,
          arguments: nextAccount?.localId,
          (_) => false,
        );

        return false;
      },
    );

    final renameDialog = TextDialog(
      title: DialogTexts.editAccountTitle,
      submitText: Texts.editButton,
      validation: validOfflineAccountRename(selectedAccount.name),
      placeholder: UIPlaceholders.accountName,
      initialValue: selectedAccount.name,
      onSubmit: alwaysValid(
        (name) => selectedAccount.copyWith(name: name).save(),
      ),
    );

    return SafeArea(
      child: Drawer(
        backgroundColor: UIColors.secondary,
        // Disable weird border color artefact
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        child: Column(
          children: [
            const DrawerSection(
              title: MenuTexts.drawerAccounts,
            ),
            for (final account in accounts)
              AccountTile(
                account: account,
                isActive: account.localId == selectedAccount.localId,
              ),
            TileButton(
              padding: _tilePadding,
              leading: const Icon(
                UIIcons.add,
                color: UIColors.primary,
              ),
              content: Text(
                MenuTexts.drawerAddAccount,
                style: UITexts.normal,
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
              compact: true,
            ),
            TileButton(
              padding: _tilePadding,
              leading: const Icon(UIIcons.import, color: UIColors.primary),
              content: Text(MenuTexts.drawerImport, style: UITexts.normal),
              onPressed: () => NotImplementedDialog.show(context),
            ),
            TileButton(
              padding: _tilePadding,
              leading: const Icon(UIIcons.export, color: UIColors.primary),
              content: Text(MenuTexts.drawerExport, style: UITexts.normal),
              onPressed: () => NotImplementedDialog.show(context),
            ),
            _tileDivider,
            TileButton(
              padding: _tilePadding,
              leading: const Icon(
                UIIcons.rename,
                color: UIColors.primary,
              ),
              content: Text(
                MenuTexts.drawerRenameAccount,
                style: UITexts.normal,
              ),
              onPressed: () {
                showDialog(
                  barrierDismissible: false,
                  barrierColor: UIColors.dimmed,
                  context: context,
                  builder: (_) => renameDialog,
                );
              },
            ),
            _tileDivider,
            TileButton(
              padding: _tilePadding,
              leading: const Icon(UIIcons.delete, color: UIColors.danger),
              content: Text(
                MenuTexts.drawerDeleteAccount,
                style: UITexts.normal,
              ),
              onPressed: () {
                showDialog(
                  barrierColor: UIColors.dimmed,
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

  static const _tilePadding = EdgeInsets.symmetric(
    vertical: DrawerLayout.tileVerticalPadding,
    horizontal: DrawerLayout.tileHorizontalPadding,
  );

  static const _tileDivider = Divider(
    color: UIColors.primary,
    height: DrawerLayout.tileDividerWidth,
    thickness: DrawerLayout.tileDividerWidth,
  );
}
