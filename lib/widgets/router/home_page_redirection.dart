import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/state/shared_preferences/objects/selected_account.dart';
import 'package:open_items/widgets/authenticate/authenticate_page.dart';
import 'package:open_items/widgets/collections/lists_page.dart';
import 'package:open_items/widgets/utils/feedback/progress.dart';

class HomePageRedirection extends ConsumerWidget {
  const HomePageRedirection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAccount = ref.watch(selectedAccountNotifierProvider);

    return selectedAccount.maybeWhen(
      data: (account) => account == null
          ? const AuthenticatePage()
          : ListsPage(account: account),
      orElse: () => const Scaffold(
        backgroundColor: UIColors.background,
        body: Center(
          child: InfiniteProgressFeedback(),
        ),
      ),
    );
  }
}
