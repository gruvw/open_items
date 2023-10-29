import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/state/application/database.dart';
import 'package:open_items/state/shared_preferences/objects/selected_account.dart';
import 'package:open_items/widgets/authenticate/authenticate_page.dart';
import 'package:open_items/widgets/collections/lists_page/lists_page.dart';
import 'package:open_items/widgets/utils/feedback/progress.dart';

class HomePageRedirection extends ConsumerWidget {
  const HomePageRedirection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.read(localAccountsProvider);
    final selectedAccount = ref.watch(selectedAccountProvider);

    return selectedAccount.maybeWhen(
      data: (account) {
        if (accounts.isEmpty) {
          return const AuthenticatePage();
        }

        if (account != null) {
          return ListsPage(account: account);
        }

        final newSelectedAccount = accounts.first;
        return ListsPage(account: newSelectedAccount);
      },
      orElse: () => const Scaffold(
        backgroundColor: UIColors.background,
        body: Center(
          child: InfiniteProgressFeedback(),
        ),
      ),
    );
  }
}
