import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/ordering/orderings.dart';
import 'package:open_items/state/application/account.dart';
import 'package:open_items/state/application/globals.dart';
import 'package:open_items/state/application/lists.dart';
import 'package:open_items/state/shared_preferences/objects/default_list_type.dart';
import 'package:open_items/state/shared_preferences/objects/selected_account_id.dart';
import 'package:open_items/widgets/collections/collection_entry.dart';
import 'package:open_items/widgets/collections/collection_view.dart';
import 'package:open_items/widgets/collections/dialogs/change_collection_type.dart';
import 'package:open_items/widgets/collections/dialogs/delete_collection.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/accounts_drawer.dart';
import 'package:open_items/widgets/collections/new_button.dart';
import 'package:open_items/widgets/collections/search_button.dart';
import 'package:open_items/widgets/components/input/menu_element.dart';
import 'package:open_items/widgets/components/modals/collection_type_dialog.dart';
import 'package:open_items/widgets/components/modals/confirmation_dialog.dart';
import 'package:open_items/widgets/components/modals/ordering/lists_ordering_dialog.dart';
import 'package:open_items/widgets/components/modals/text_dialog.dart';
import 'package:open_items/widgets/router/loading_page.dart';
import 'package:open_items/widgets/router/route_generator.dart';
import 'package:open_items/widgets/validation/core.dart';
import 'package:open_items/widgets/validation/list.dart';

enum ListsPopupMenu {
  orderBy("Order By"),
  defaultListType("Default List Type");

  final String label;

  const ListsPopupMenu(this.label);
}

class ListsPage extends HookConsumerWidget {
  // Static because must be shown only once per application opening
  static bool _testingMessageShown = false; // TODO move to global provider

  final String accountId;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ListsPage({
    super.key,
    required this.accountId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultListType = ref.watch(defaultListTypeProvider);

    final account = ref.watch(localAccountProvider(accountId: accountId));
    final accountProperties =
        ref.watch(accountPropertiesProvider(accountId: accountId));
    final listsProperties =
        ref.watch(listsPropertiesProvider(accountId: accountId));
    final lists = ref.watch(listsProvider(accountId: accountId));

    // Set viewed account as the (persisted) selected one
    useEffect(() {
      ref.read(selectedAccountIdProvider.notifier).updateAccount(accountId);
    }, const []);

    // Display loading screen while object is deleted
    if (account == null ||
        accountProperties == null ||
        listsProperties == null ||
        lists == null) {
      return const LoadingPage();
    }

    // Testing dialog
    if (!_testingMessageShown) {
      _testingMessageShown = true;
      Future.delayed(
        Duration.zero,
        () => showDialog(
          barrierDismissible: false,
          barrierColor: UIColors.dimmed,
          context: context,
          builder: (_) => _testingDialog,
        ),
      );
    }

    void menuCallback(ListsPopupMenu item) => switch (item) {
          ListsPopupMenu.orderBy => showModalBottomSheet(
              context: context,
              builder: (context) => ListsOrderingDialog(accountId: accountId),
            ),
          ListsPopupMenu.defaultListType => showDialog(
              barrierColor: UIColors.dimmed,
              context: context,
              builder: (context) => CollectionTypeDialog(
                title: "Default List Type",
                initialType: defaultListType,
                onSelected: (newType) => ref
                    .read(defaultListTypeProvider.notifier)
                    .updateType(newType),
              ),
            ),
        };

    Future<void> createList(String title) async {
      final time = DateTime.now();

      final listId = await database.createListe(
        owner: account,
        listServerId: CoreValues.unknownServerId,
        title: title,
        type: defaultListType,
        creationTime: time,
        editionTime: time,
      );

      await database.createAccountListProperties(
        user: account,
        serverId: CoreValues.unknownServerId,
        listLocalId: listId,
        itemsOrdering: DefaultValues.itemsOrdering,
        lexoRank: "a" * lists.length, // TODO lexoRanking
        shouldReverseOrder: DefaultValues.shouldReverse,
        shouldStackDone: DefaultValues.shouldStackDone,
      );
    }

    final listsView = CollectionView(
      length: lists.length,
      builder: (context, index) {
        final list = lists[index];

        final listProperties =
            listsProperties.firstWhere((lp) => lp.listId == list.listId);

        return CollectionEntry(
          key: ObjectKey(list),
          index: index,
          groupTag: 0,
          reorderEnabled:
              accountProperties.listsOrdering == ListsOrdering.custom,
          leading: Icon(list.collectionType.icon),
          onDelete: () =>
              DeleteCollectionDialog.deleteCollection(context, list),
          onClick: () => Navigator.pushNamed(
            context,
            Routes.collection.name,
            arguments: [listProperties.localId, list.localId],
          ),
          leadingOnClick: () =>
              ChangeCollectionTypeDialog.show(context, list.listId),
          content: list.title,
        );
      },
    );

    final emptyView = Center(
      child: Text(
        "Create new lists using the + button",
        style: UITexts.titleText,
      ),
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: UIColors.background,
      drawer: AccountsDrawer(selectedAccountId: accountId),
      floatingActionButton: NewButton(
        onPressed: () => showDialog(
          barrierDismissible: false,
          barrierColor: UIColors.dimmed,
          context: context,
          builder: (_) => TextDialog(
            title: "New List Title",
            submitText: "Create",
            capitalization: TextCapitalization.sentences,
            placeholder: UIPlaceholders.listTitle,
            validation: validListTitle,
            onSubmit: alwaysValid((title) => createList(title)),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: UIColors.primary,
        leadingWidth: UILayout.appBarLeadingWidth,
        leading: Row(
          children: [
            IconButton(
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              icon: const Icon(UIIcons.menu),
            ),
            const SizedBox(
              width: UILayout.appBarLeadingSpacing,
            ),
            const Icon(UIIcons.offline),
          ],
        ),
        actions: [
          const SearchButton(),
          PopupMenuButton(
            onSelected: menuCallback,
            itemBuilder: (BuildContext context) {
              return ListsPopupMenu.values.map((ListsPopupMenu menu) {
                return PopupMenuItem(
                  value: menu,
                  child: MenuElement(
                    text: menu.label,
                    icon: switch (menu) {
                      ListsPopupMenu.orderBy => UIIcons.order,
                      ListsPopupMenu.defaultListType => defaultListType.icon,
                    },
                  ),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: lists.isNotEmpty ? listsView : emptyView,
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
