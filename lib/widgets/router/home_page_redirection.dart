import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/state/shared_preferences/objects/selected_account.dart';
import 'package:open_items/widgets/authenticate/authenticate_page.dart';
import 'package:open_items/widgets/collections/lists_page/lists_page.dart';
import 'package:open_items/widgets/router/loading_page.dart';

class HomePageRedirection extends ConsumerWidget {
  const HomePageRedirection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAccount = ref.watch(selectedAccountProvider);

    return selectedAccount.maybeWhen(
      data: (accountId) {
        if (accountId != null) {
          return ListsPage(accountId: accountId);
        }

        return const AuthenticatePage();
      },
      orElse: () => const LoadingPage(),
    );
  }
}
