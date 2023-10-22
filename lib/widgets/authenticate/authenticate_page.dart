import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/global/styles/text.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/state/application/database.dart';
import 'package:open_items/state/application/providers.dart';
import 'package:open_items/state/shared_preferences/objects/selected_account.dart';
import 'package:open_items/widgets/components/buttons/solid.dart';
import 'package:open_items/widgets/components/input/tab.dart';
import 'package:open_items/widgets/components/input/text.dart';
import 'package:open_items/widgets/modals/confirm.dart';
import 'package:open_items/widgets/router/route_generator.dart';
import 'package:open_items/widgets/utils/state/hooks.dart';
import 'package:open_items/widgets/validation/accounts.dart';

enum Tabs {
  newOnlineAccount("Create", 0, 0),
  newOfflineAccount("Add", 0, 1),
  logIn("Log in", 1, 0);

  static const primaryTabLength = 2;
  static const secondaryTabLength = 2;

  final String submitText;
  final int primaryTabIndex;
  final int secondaryTabIndex;

  const Tabs(
    this.submitText,
    this.primaryTabIndex,
    this.secondaryTabIndex,
  );

  factory Tabs.of(int primaryTabIndex, int secondaryTabIndex) {
    if (primaryTabIndex == 0) {
      return Tabs.values[secondaryTabIndex];
    }

    return Tabs.logIn;
  }
}

class AuthenticatePage extends HookConsumerWidget {
  static const _initialTab = Tabs.newOfflineAccount;

  const AuthenticatePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // State

    final cancellable = ref.watch(localAccountsProvider).isNotEmpty;

    final welcomeShown = useState(false);

    // Form state
    final offlineNameError = useState<String?>(null);
    final emailController = useTextEditingController();
    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final offlineNameController = useTextEditingController(
      text: !cancellable ? UIValues.offlineAccountNameDefault : null,
    );

    useListener(() {
      final validation = validNewOfflineName(offlineNameController.text);
      offlineNameError.value = validation.nameError;
    }, [offlineNameController]);

    // Tabs

    final primaryTabController = useTabController(
      initialLength: Tabs.primaryTabLength,
      initialIndex: _initialTab.primaryTabIndex,
    );
    final secondaryTabController = useTabController(
      initialLength: Tabs.secondaryTabLength,
      initialIndex: _initialTab.secondaryTabIndex,
    );

    useListenable(primaryTabController);
    useListenable(secondaryTabController);
    final activeTab = Tabs.of(
      primaryTabController.index,
      secondaryTabController.index,
    );

    void updateActiveTab(Tabs tab) {
      primaryTabController.index = _initialTab.primaryTabIndex;
      secondaryTabController.index = _initialTab.secondaryTabIndex;
    }

    final createAccountSelected = activeTab == Tabs.newOfflineAccount ||
        activeTab == Tabs.newOnlineAccount;
    final onlineSelected =
        activeTab == Tabs.newOnlineAccount || activeTab == Tabs.logIn;

    // Form

    void onSubmit() {
      // Only offline accounts supported
      if (activeTab != Tabs.newOfflineAccount) {
        updateActiveTab(_initialTab);

        // Pre-fill the offline account name with username if user entered
        if (usernameController.text.isNotEmpty) {
          offlineNameController.text = usernameController.text;
        }

        showDialog(
          context: context,
          builder: (_) => _notSupportedDialog,
        );

        return;
      }

      final name = offlineNameController.text;
      final validation = validNewOfflineName(name);
      offlineNameError.value = validation.nameError;

      if (!validation.isValid) {
        return;
      }

      final account = database.createOfflineAccount(name: name);
      ref.read(selectedAccountProvider.notifier).updateAccount(account);

      Navigator.pushNamed(context, Routes.lists.name, arguments: account);
    }

    // Account dialog

    if (!cancellable && !welcomeShown.value) {
      welcomeShown.value = true;
      Future.delayed(
        Duration.zero,
        () => showDialog(context: context, builder: (_) => _accountDialog),
      );
    }

    // Widgets

    final tabBars = Container(
      color: UIColors.primary,
      child: Column(
        children: [
          TabBar(
            controller: primaryTabController,
            labelStyle: UITexts.normalText,
            indicatorColor: UIColors.secondary,
            unselectedLabelColor: UIColors.hintText,
            indicatorWeight: 2,
            tabs: const [
              IconTab(
                text: "Create Account",
                icon: Icon(Icons.person),
              ),
              IconTab(
                text: "Log In",
                icon: Icon(Icons.login),
              ),
            ],
          ),
          if (createAccountSelected)
            TabBar(
              dividerColor: UIColors.primary,
              controller: secondaryTabController,
              labelStyle: UITexts.normalText,
              indicatorColor: UIColors.secondary,
              unselectedLabelColor: UIColors.hintText,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                IconTab(
                  text: "Online Account",
                  icon: Icon(Icons.language),
                ),
                IconTab(
                  text: "Offline Account",
                  icon: Icon(Icons.cloud_off),
                ),
              ],
            ),
          const Divider(
            color: UIColors.primary,
            height: 8,
            thickness: 8,
          ),
        ],
      ),
    );

    final form = Column(
      children: [
        if (activeTab == Tabs.newOnlineAccount)
          TextInput(
            key: const ValueKey(0),
            controller: emailController,
            placeholder: UIValues.emailPlaceholder,
          ),
        if (onlineSelected)
          TextInput(
            key: const ValueKey(1),
            controller: usernameController,
            placeholder: UIValues.usernamePlaceholder,
          ),
        if (activeTab == Tabs.newOfflineAccount)
          TextInput(
            key: const ValueKey(2),
            controller: offlineNameController,
            placeholder: UIValues.offlineNamePlaceholder,
            errorText: offlineNameError.value,
            onChanged: (value) {},
          ),
        if (onlineSelected)
          TextInput(
            key: const ValueKey(3),
            controller: passwordController,
            placeholder: UIValues.passwordPlaceholder,
            obscureText: true,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SolidButtonPrimary(
              text: activeTab.submitText,
              onPressed: onSubmit,
              enabled: activeTab != Tabs.newOfflineAccount ||
                  offlineNameError.value == null,
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: UIColors.background,
      appBar: AppBar(
        leading: cancellable
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
              )
            : null,
        title: Text(
          "Add Account",
          style: UITexts.titleText.apply(
            color: UIColors.secondary,
          ),
        ),
        backgroundColor: UIColors.primary,
      ),
      body: Column(
        children: [
          tabBars,
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: form,
          ),
        ],
      ),
    );
  }
}

// Dialogs

final _accountDialog = ConfirmationDialog(
  title: "Account creation",
  confirmedText: "Let's go!",
  body: Text(
    "Welcome to Open-Items!\nYou can either create an account online and benefit from the online functionalities (syncing, sharing, ...) or you can add an offline account and use the application right away.",
    style: UITexts.normalText,
  ),
);

final _notSupportedDialog = ConfirmationDialog(
  title: "Not Supported",
  body: Text(
    "Sorry this functionality is not yet supported.",
    style: UITexts.normalText,
  ),
);
