import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/models/objects/account.dart';
import 'package:open_items/state/shared_preferences/objects/selected_account.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/accounts_drawer.dart';
import 'package:open_items/widgets/components/modals/confirmation_dialog.dart';
import 'package:open_items/widgets/router/loading_page.dart';

class ListsPage extends HookConsumerWidget {
  // Static because must be shown only once per application opening
  static bool _testingMessageShown = false;

  final Account account;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ListsPage({
    super.key,
    required this.account,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Type error when deleting referenced object from current page
    final accountDeleted = useState(false);
    if (accountDeleted.value) return const LoadingPage();

    // Set viewed account as the selected one
    useEffect(() {
      ref.read(selectedAccountProvider);
      ref.read(selectedAccountProvider.notifier).updateAccount(account);
    }, const []);

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
      key: _scaffoldKey,
      backgroundColor: UIColors.background,
      appBar: AppBar(
        backgroundColor: UIColors.primary,
        leadingWidth: DrawerLayout.appBarLeadingWidth,
        leading: Row(
          children: [
            IconButton(
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              icon: const Icon(Icons.menu),
            ),
            const SizedBox(
              width: DrawerLayout.appBarLeadingSpacing,
            ),
            const Icon(Icons.cloud_off),
          ],
        ),
      ),
      drawer: AccountsDrawer(
        selectedAccount: account,
        accountDeleted: accountDeleted,
      ),
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
