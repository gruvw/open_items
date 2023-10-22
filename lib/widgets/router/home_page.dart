import 'package:flutter/material.dart';
import 'package:open_items/state/providers/application.dart';
import 'package:open_items/widgets/authenticate/authenticate_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final accounts = database.getLocalAccounts();
    return accounts.isEmpty ? const AuthenticatePage() : ListsPage(account: accounts.first);

    return AuthenticatePage();
  }
}
