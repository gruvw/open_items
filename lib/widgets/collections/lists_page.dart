import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/text.dart';
import 'package:open_items/models/account.dart';
import 'package:open_items/widgets/modals/confirm.dart';

class ListsPage extends ConsumerWidget {
  // Static because must be shown only once per application opening
  static bool _testingMessageShown = false;

  final Account account;

  const ListsPage({super.key, required this.account});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Testing dialog
    if (!_testingMessageShown) {
      _testingMessageShown = true;
      Future.delayed(
        Duration.zero,
        () => showDialog(context: context, builder: (_) => _testingDialog),
      );
    }

    return Scaffold(
      body: Text("Lists Page: for ${account.name}"),
    );
  }
}

// Dialogs

const _testingDialog = ConfirmationDialog(
  title: "Testing Version",
  confirmedText: "I understand",
  body: Text.rich(
    TextSpan(
      style: TextsTheme.normalText,
      children: [
        TextSpan(text: "This is a "),
        TextSpan(text: "test", style: TextsTheme.normalBold),
        TextSpan(
            text:
                " version of the application.\nDon't store valuable data and only use for testing purposes."),
      ],
    ),
  ),
);