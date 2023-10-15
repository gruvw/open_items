import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/state/providers/application.dart';
import 'package:open_items/widgets/components/tabs/solid.dart';

enum Tabs {
  newOnlineAccount,
  newOfflineAccount,
  logIn,
}

class AuthenticatePage extends HookWidget {
  const AuthenticatePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cancellable = database.getLocalAccounts().isNotEmpty;
    final activeTab = useState(Tabs.newOfflineAccount);
    final createAccountSelected = activeTab.value == Tabs.newOfflineAccount ||
        activeTab.value == Tabs.newOnlineAccount;

    return Scaffold(
      appBar: AppBar(
        leading: cancellable ? const Icon(Icons.arrow_left) : null,
        title: const Text("Add Account"),
        backgroundColor: ColorTheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SolidTabPrimary(
                  text: "Create Account",
                  isActive: createAccountSelected,
                  onPressed: () => activeTab.value = Tabs.newOnlineAccount,
                ),
                SolidTabPrimary(
                  text: "Log in",
                  isActive: !createAccountSelected,
                  onPressed: () => activeTab.value = Tabs.logIn,
                ),
              ],
            ),
            if (createAccountSelected)
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SolidTabPrimary(
                    text: "Online",
                    isActive: activeTab.value == Tabs.newOnlineAccount,
                    onPressed: () => activeTab.value = Tabs.newOnlineAccount,
                  ),
                  SolidTabPrimary(
                    text: "Offline",
                    isActive: activeTab.value == Tabs.newOfflineAccount,
                    onPressed: () => activeTab.value = Tabs.newOfflineAccount,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
