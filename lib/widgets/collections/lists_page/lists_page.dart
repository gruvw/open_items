import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/global/texts.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/ordering/orderings.dart';
import 'package:open_items/state/application/account.dart';
import 'package:open_items/state/application/globals.dart';
import 'package:open_items/state/application/lists.dart';
import 'package:open_items/state/shared_preferences/objects/default_list_type.dart';
import 'package:open_items/state/shared_preferences/objects/selected_account_local_id.dart';
import 'package:open_items/widgets/collections/collection_entry.dart';
import 'package:open_items/widgets/collections/collection_view.dart';
import 'package:open_items/widgets/collections/dialogs/change_collection_type.dart';
import 'package:open_items/widgets/collections/dialogs/delete_collection.dart';
import 'package:open_items/widgets/collections/lists_page/drawer/accounts_drawer.dart';
import 'package:open_items/widgets/collections/add_button.dart';
import 'package:open_items/widgets/collections/search_button.dart';
import 'package:open_items/widgets/components/structure/menu_element.dart';
import 'package:open_items/widgets/components/modals/collection_type_dialog.dart';
import 'package:open_items/widgets/components/modals/confirmation_dialog.dart';
import 'package:open_items/widgets/components/modals/ordering/lists_ordering_dialog.dart';
import 'package:open_items/widgets/components/modals/text_dialog.dart';
import 'package:open_items/widgets/router/loading_page.dart';
import 'package:open_items/widgets/router/route_generator.dart';
import 'package:open_items/widgets/validation/core.dart';
import 'package:open_items/widgets/validation/list.dart';

enum ListsPopupMenu {
  orderBy(MenuTexts.orderBy),
  defaultListType(MenuTexts.defaultListType);

  final String label;

  const ListsPopupMenu(this.label);
}

class ListsPage extends HookConsumerWidget {
  // Static because must be shown only once per application opening
  static bool _testingMessageShown = false; // TODO move to global provider

  final String accountLocalId;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ListsPage({
    super.key,
    required this.accountLocalId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultListType = ref.watch(defaultListTypeProvider);

    final account = ref.watch(localAccountProvider(accountLocalId: accountLocalId));
    final accountProperties = ref.watch(accountPropertiesProvider(accountLocalId: accountLocalId));
    final listsProperties = ref.watch(listsPropertiesProvider(accountLocalId: accountLocalId));
    final lists = ref.watch(listsProvider(accountLocalId: accountLocalId));

    // Set viewed account as the (persisted) selected one
    useEffect(() {
      ref.read(selectedAccountLocalIdProvider.notifier).updateAccount(accountLocalId);
    }, const []);

    // Display loading screen while object is deleted
    if (account == null || accountProperties == null || listsProperties == null || lists == null) {
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
              builder: (context) => ListsOrderingDialog(accountLocalId: accountLocalId),
            ),
          ListsPopupMenu.defaultListType => showDialog(
              barrierColor: UIColors.dimmed,
              context: context,
              builder: (context) => CollectionTypeDialog(
                title: MenuTexts.defaultListType,
                initialType: defaultListType,
                onSelected: (newType) =>
                    ref.read(defaultListTypeProvider.notifier).updateType(newType),
              ),
            ),
        };

    Future<void> createList(String title) async {
      final time = DateTime.now();

      final listLocalId = await database.createListe(
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
        listLocalId: listLocalId,
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
            listsProperties.firstWhere((lp) => lp.listLocalId == list.listLocalId);

        return CollectionEntry(
          key: ObjectKey(list),
          index: index,
          groupTag: 0,
          reorderEnabled: accountProperties.listsOrdering == ListsOrdering.custom,
          leading: Icon(list.collectionType.icon),
          onDelete: () => DeleteCollectionDialog.deleteCollection(context, list),
          onClick: () => Navigator.pushNamed(
            context,
            Routes.collection.name,
            arguments: [listProperties.localId, list.localId],
          ),
          leadingOnClick: () => ChangeCollectionTypeDialog.show(context, list.listLocalId),
          content: list.title,
        );
      },
    );

    final emptyView = Center(
      child: Text(
        Texts.emptyLists,
        style: UITexts.normal,
      ),
    );

    final menu = ListsPopupMenu.values.map((ListsPopupMenu menu) {
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

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: UIColors.background,
      drawer: AccountsDrawer(selectedAccountLocalId: accountLocalId),
      floatingActionButton: AddButton(
        onPressed: () => showDialog(
          barrierDismissible: false,
          barrierColor: UIColors.dimmed,
          context: context,
          builder: (_) => TextDialog(
            title: DialogTexts.newListTitle,
            submitText: Texts.createButton,
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
              icon: const Icon(
                UIIcons.menu,
                color: UIColors.secondary,
              ),
            ),
            const SizedBox(
              width: UILayout.appBarLeadingSpacing,
            ),
            const Icon(
              UIIcons.offline,
              color: UIColors.secondary,
            ),
          ],
        ),
        actions: [
          const SearchButton(),
          PopupMenuButton(
            iconColor: UIColors.secondary,
            onSelected: menuCallback,
            itemBuilder: (BuildContext context) => menu,
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
      style: UITexts.normal,
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
