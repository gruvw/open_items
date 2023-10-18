import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/global/styles/text.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/state/providers/application.dart';
import 'package:open_items/widgets/components/buttons/solid.dart';
import 'package:open_items/widgets/components/input/text.dart';
import 'package:open_items/widgets/components/tabs/solid.dart';
import 'package:open_items/widgets/modals/confirm.dart';
import 'package:open_items/widgets/validation/accounts.dart';

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
    final activeTab = useState(Tabs.newOfflineAccount);
    final welcomeShown = useState(false);
    final offlineNameError = useState<String?>(null);
    final emailController = useTextEditingController();
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final offlineNameController = useTextEditingController(
      text: UIValuesTheme.offlineAccountNameDefault,
    );

    final createAccountSelected = activeTab.value == Tabs.newOfflineAccount ||
        activeTab.value == Tabs.newOnlineAccount;
    final onlineSelected = activeTab.value == Tabs.newOnlineAccount ||
        activeTab.value == Tabs.logIn;
    final cancellable = database.getLocalAccounts().isNotEmpty;

    // Account dialog
    if (!cancellable && !welcomeShown.value) {
      welcomeShown.value = true;
      Future.delayed(
        Duration.zero,
        () => showDialog(context: context, builder: (_) => _accountDialog),
      );
    }

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
            if (activeTab.value == Tabs.newOnlineAccount)
              TextInput(
                controller: emailController,
                placeholder:UIValuesTheme.emailPlaceholder,
              ),
            if (onlineSelected)
              TextInput(
                controller: usernameController,
                placeholder: UIValuesTheme.usernamePlaceholder,
              ),
            if (activeTab.value == Tabs.newOfflineAccount)
              TextInput(
                controller: offlineNameController,
                placeholder: UIValuesTheme.offlineNamePlaceholder,
                errorText: offlineNameError.value,
              ),
            if (onlineSelected)
              TextInput(
                controller: passwordController,
                placeholder: UIValuesTheme.passwordPlaceholder,
              ),
            SolidButtonSecondary(
              text: "",
              onPressed: () {
                // Only offline accounts supported
                if (activeTab.value != Tabs.newOfflineAccount) {
                  // Switch to active tab
                  activeTab.value = Tabs.newOfflineAccount;

                  // Pre-fill the offline account name with username if user entered
                  if (usernameController.text.isNotEmpty) {
                    offlineNameController.text = usernameController.text;
                  }

                  showDialog(
                    context: context,
                    builder: (_) => _notSupportedDialog
                  );
                  return;
                }

                final name = usernameController.text;
                final validation = validNewOfflineName(name);

                if (!validation.isValid) {
                  offlineNameError.value = validation.nameError;
                  return;
                }

                // final account = database.createOfflineAccount(name: name);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Dialogs

const _accountDialog = ConfirmationDialog(
  title: "Account creation",
  confirmedText: "Let's go!",
  body: Text(
    "Welcome to Open-Items!\nYou can add an offline account and use the application right away or you can create an online account and benefit from online functionalities (syncing, sharing, ...).",
    style: TextsTheme.normalText,
  ),
);

const _notSupportedDialog = ConfirmationDialog(
  title: "Not Supported",
  body: Text(
    "Sorry this functionality is not yet supported.",
    style: TextsTheme.normalText,
  ),
);
