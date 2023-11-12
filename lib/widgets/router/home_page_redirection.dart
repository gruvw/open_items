import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/state/shared_preferences/objects/selected_account_id.dart';
import 'package:open_items/widgets/authenticate/authenticate_page.dart';
import 'package:open_items/widgets/collections/lists_page/lists_page.dart';

class HomePageRedirection extends ConsumerWidget {
  const HomePageRedirection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountId = ref.watch(selectedAccountIdProvider);

    if (accountId != null) {
      return ListsPage(accountId: accountId);
    }

    return const AuthenticatePage();
  }
}
