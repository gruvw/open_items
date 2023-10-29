import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/accounts_drawer.dart';
import 'package:open_items/widgets/modals/confirmation_dialog.dart';

class ListsPage extends ConsumerWidget {
  // Static because must be shown only once per application opening
  static bool _testingMessageShown = false;

  final Account account;

  const ListsPage({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Set viewed account as the selected one
    // ref.read(selectedAccountProvider.notifier).updateAccount(account);

    // Testing dialog
    if (!_testingMessageShown) {
      _testingMessageShown = true;
      Future.delayed(
        Duration.zero,
        () => showDialog(
          barrierColor: UIColors.dimmed,
          context: context,
          builder: (_) => _testingDialog,
        ),
      );
    }

    return Scaffold(
      backgroundColor: UIColors.background,
      appBar: AppBar(
        backgroundColor: UIColors.primary,
        // leading: const Icon(Icons.cloud_off),
      ),
      drawer: AccountsDrawer(selectedAccount: account),
      body: Text("Lists Page: for ${account.name}"),
    );
  }
}

// Dialogs

final _testingDialog = ConfirmationDialog(
  title: "Test Version",
  confirmedText: "I understand",
  body: Text.rich(
    TextSpan(
      style: UITexts.normalText,
      children: [
        const TextSpan(text: "This is a "),
        TextSpan(text: "test", style: UITexts.normalBold),
        const TextSpan(
            text:
                " version of the application.\nDon't store valuable data and only use for testing purposes."),
      ],
    ),
  ),
);
