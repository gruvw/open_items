import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/ordering/orderings.dart';
import 'package:open_items/state/application/collection.dart';
import 'package:open_items/state/application/globals.dart';
import 'package:open_items/widgets/collections/collection_entry.dart';
import 'package:open_items/widgets/collections/collection_view.dart';
import 'package:open_items/widgets/collections/list_page/list_title.dart';
import 'package:open_items/widgets/collections/new_button.dart';
import 'package:open_items/widgets/collections/search_button.dart';
import 'package:open_items/widgets/components/modals/text_dialog.dart';
import 'package:open_items/widgets/router/loading_page.dart';
import 'package:open_items/widgets/router/route_generator.dart';
import 'package:open_items/widgets/validation/core.dart';
import 'package:open_items/widgets/validation/item.dart';

enum ItemsPopupMenu {
  orderBy("Order By"),
  defaultListType("Default List Type");

  final String label;

  const ItemsPopupMenu(this.label);
}

class ListPage extends HookConsumerWidget {
  final String listPropertiesId;

  const ListPage({
    super.key,
    required this.listPropertiesId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listProperties = ref
        .watch(accountListPropertiesProvider(propertiesId: listPropertiesId));
    final list = ref.watch(listProvider(localId: listProperties?.listId));
    final items = ref.watch(itemsProvider(
      listPropertiesId: listPropertiesId,
      parentId: listProperties?.listId,
    ));

    // Display loading screen while object is deleted
    if (listProperties == null || list == null || items == null) {
      return const LoadingPage();
    }

    // void menuCallback(ItemsPopupMenu item) {
    //   switch (item) {}
    // }

    Future<void> createItem(String text) async {
      final time = DateTime.now();

      await database.createItem(
        serverId: CoreValues.unknownServerId,
        parentId: listProperties.listId,
        text: text,
        type: list.collectionType,
        lexoRank: "",
        creationTime: time,
        editionTime: time,
        doneTime: time,
        isDone: DefaultValues.isDone,
      );
    }

    final uncheckedItemsNb = items.where((i) => !i.isDone).length;
    final isCheck = list.collectionType == CollectionType.check;

    final listsView = CollectionView(
      length: items.length,
      builder: (context, index) {
        final item = items[index];

        final icon = switch (list.collectionType) {
          CollectionType.check =>
            item.isDone ? UIIcons.checkedBox : const Icon(UIIcons.uncheckedBox),
          CollectionType.unordered => const Icon(UIIcons.bullet),
          CollectionType.ordered =>
            Text("${index + 1}.", style: UITexts.normalText),
        };

        return CollectionEntry(
          key: ObjectKey(item),
          index: index,
          groupTag: items,
          icon: icon,
          reorderEnabled: listProperties.itemsOrdering == ItemsOrdering.custom,
          fatDividier: isCheck &&
              uncheckedItemsNb != 0 &&
              uncheckedItemsNb != items.length &&
              index == uncheckedItemsNb - 1,
          onDelete: () => item.delete(),
          onClick: () => Navigator.pushNamed(
            context,
            Routes.item.name,
            // arguments: , // TODO
          ),
          onIconClick: !isCheck
              ? null
              : () => item.copyWith(isDone: !item.isDone).save(),
          content: item.content,
        );
      },
    );

    const emptyView = Center(
      child: Text("Create new items using the + button"),
    );

    return Scaffold(
      backgroundColor: UIColors.background,
      floatingActionButton: NewButton(
        onPressed: () => showDialog(
          context: context,
          builder: (_) => TextDialog(
            title: "New Item Text",
            submitText: "Create",
            capitalization: TextCapitalization.sentences,
            placeholder: UIPlaceholders.itemText,
            validation: validItemText,
            onSubmit: alwaysValid((text) => createItem(text)),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: UIColors.primary,
        leadingWidth: UILayout.appBarLeadingWidth,
        leading: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(UIIcons.back),
            ),
            const SizedBox(
              width: UILayout.appBarLeadingSpacing,
            ),
            const Icon(UIIcons.offline),
          ],
        ),
        actions: [
          const SearchButton(),
          // PopupMenuButton(
          // onSelected: menuCallback, // TODO
          // itemBuilder: (BuildContext context) {
          //   return ListsPopupMenu.values.map((ListsPopupMenu menu) {
          //     return PopupMenuItem(
          //       value: menu,
          //       child: MenuElement(
          //         text: menu.label,
          //         icon: switch (menu) {
          //           ListsPopupMenu.orderBy => UIIcons.order,
          //           ListsPopupMenu.defaultListType => defaultListType.icon,
          //         },
          //       ),
          //     );
          //   }).toList();
          // },
          // ),
        ],
      ),
      body: Column(
        children: [
          Divider(
            color: UIColors.secondary,
            height: 3,
            thickness: 3,
          ),
          ListTitle(listId: list.listId),
          Expanded(child: items.isNotEmpty ? listsView : emptyView),
        ],
      ),
    );
  }
}
