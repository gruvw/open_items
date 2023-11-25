import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/ordering/item_order.dart';
import 'package:open_items/models/ordering/orderings.dart';
import 'package:open_items/state/application/collection.dart';
import 'package:open_items/state/application/globals.dart';
import 'package:open_items/widgets/collections/collection_entry.dart';
import 'package:open_items/widgets/collections/collection_page/list_title.dart';
import 'package:open_items/widgets/collections/collection_view.dart';
import 'package:open_items/widgets/collections/dialogs/change_collection_type.dart';
import 'package:open_items/widgets/collections/dialogs/delete_collection.dart';
import 'package:open_items/widgets/collections/dialogs/edit_item_text.dart';
import 'package:open_items/widgets/collections/dialogs/edit_list_title.dart';
import 'package:open_items/widgets/collections/new_button.dart';
import 'package:open_items/widgets/collections/search_button.dart';
import 'package:open_items/widgets/components/input/menu_element.dart';
import 'package:open_items/widgets/components/modals/ordering/list_ordering_dialog.dart';
import 'package:open_items/widgets/components/modals/text_dialog.dart';
import 'package:open_items/widgets/router/loading_page.dart';
import 'package:open_items/widgets/router/route_generator.dart';
import 'package:open_items/widgets/validation/core.dart';
import 'package:open_items/widgets/validation/item.dart';

enum CollectionMenuType { list, item, both }

enum CollectionPopupMenu {
  // List wide options
  orderBy("Order By", CollectionMenuType.both),
  stackDone("Stack Done Items", CollectionMenuType.both),

  collectionType("Collection Type", CollectionMenuType.both),

  editList("Edit Title", CollectionMenuType.list),
  deleteList("Delete List", CollectionMenuType.list),

  editItem("Edit Text", CollectionMenuType.item),
  deleteItem("Delete Item", CollectionMenuType.item);

  final CollectionMenuType type;
  final String label;

  const CollectionPopupMenu(this.label, this.type);
}

class CollectionPage extends HookConsumerWidget {
  final String listPropertiesId;
  final String collectionId;

  const CollectionPage({
    super.key,
    required this.listPropertiesId,
    required this.collectionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listProperties = ref
        .watch(accountListPropertiesProvider(propertiesId: listPropertiesId));
    final list = ref.watch(listProvider(listId: listProperties?.listId));

    final collection =
        ref.watch(collectionProvider(collectionId: collectionId));
    final items = ref.watch(itemsProvider(
      listPropertiesId: listPropertiesId,
      parentId: collectionId,
    ));
    print(items);

    // Display loading screen while object is deleted
    if (listProperties == null ||
        list == null ||
        collection == null ||
        items == null) {
      return const LoadingPage();
    }

    Future<void> createItem(String text) async {
      final time = DateTime.now();

      await database.createItem(
        serverId: CoreValues.unknownServerId,
        parentId: collectionId,
        text: text,
        type: collection.collectionType,
        lexoRank: "a" * items.length, // TODO lexoRanking
        creationTime: time,
        editionTime: time,
        doneTime: time,
        isDone: DefaultValues.isDone,
      );
    }

    void menuCallback(CollectionPopupMenu menu) => switch (menu) {
          CollectionPopupMenu.collectionType =>
            ChangeCollectionTypeDialog.show(context, collectionId),
          CollectionPopupMenu.orderBy => showModalBottomSheet(
              context: context,
              builder: (context) =>
                  ListOrderingDialog(listPropertiesId: listPropertiesId),
            ),
          CollectionPopupMenu.stackDone => listProperties
              .copyWith(shouldStackDone: !listProperties.shouldStackDone)
              .save(),
          CollectionPopupMenu.editList =>
            EditListTitleDialog.show(context, list.localId),
          CollectionPopupMenu.editItem =>
            EditItemTextDialog.show(context, collectionId),
          CollectionPopupMenu.deleteList ||
          CollectionPopupMenu.deleteItem =>
            DeleteCollectionDialog.deleteCollection(context, collection, true),
        };

    final menu = CollectionPopupMenu.values
        .where((m) => m.type != CollectionMenuType.item) // TODO
        .where((m) =>
            m != CollectionPopupMenu.stackDone ||
            listProperties.itemsOrdering != ItemsOrdering.done)
        .map((CollectionPopupMenu menu) {
      return PopupMenuItem(
        value: menu,
        child: MenuElement(
          text: menu.label,
          color: switch (menu) {
            CollectionPopupMenu.deleteList ||
            CollectionPopupMenu.deleteItem =>
              UIColors.danger,
            _ => null,
          },
          icon: switch (menu) {
            CollectionPopupMenu.orderBy => UIIcons.order,
            CollectionPopupMenu.stackDone => listProperties.shouldStackDone
                ? UIIcons.checkedBox
                : UIIcons.uncheckedBox,
            CollectionPopupMenu.collectionType =>
              collection.collectionType.icon,
            CollectionPopupMenu.editList ||
            CollectionPopupMenu.editItem =>
              UIIcons.edit,
            CollectionPopupMenu.deleteList ||
            CollectionPopupMenu.deleteItem =>
              UIIcons.delete,
          },
        ),
      );
    }).toList();

    late final itemsCustomOrder = items.sorted(itemsPositionCustomCompare);

    final uncheckedNb = items.where((i) => !i.isDone).length;
    // When using done ordering, done items stack at the top
    final dividerIndex = listProperties.itemsOrdering == ItemsOrdering.done
        ? items.length - uncheckedNb
        : uncheckedNb;
    final isCheck = collection.collectionType == CollectionType.check;

    final listsView = CollectionView(
      length: items.length,
      builder: (context, index) {
        final item = items[index];

        final icon = switch (collection.collectionType) {
          CollectionType.check =>
            Icon(item.isDone ? UIIcons.checkedBox : UIIcons.uncheckedBox),
          CollectionType.unordered => const Icon(UIIcons.bullet),
          CollectionType.ordered => Text(
              "${itemsCustomOrder.indexOf(item) + 1}.",
              style: UITexts.normalText),
        };

        return CollectionEntry(
          key: ObjectKey(item),
          index: index,
          groupTag: collection.content,
          isFat: item.itemIds.isNotEmpty,
          icon: icon,
          reorderEnabled: listProperties.itemsOrdering == ItemsOrdering.custom,
          fatDividier: listProperties.stackDone &&
              isCheck &&
              dividerIndex != 0 &&
              dividerIndex != items.length &&
              index == dividerIndex - 1,
          onDelete: () =>
              DeleteCollectionDialog.deleteCollection(context, item),
          onClick: () => Navigator.pushNamed(
            context,
            Routes.collection.name,
            arguments: [listPropertiesId, item.localId],
          ),
          onIconClick: !isCheck
              ? null
              : () => item.copyWith(isDone: !item.isDone).save(),
          content: item.content,
        );
      },
    );

    final emptyView = Center(
      child: Text(
        "Create new items using the + button",
        style: UITexts.titleText,
      ),
    );

    return Scaffold(
      backgroundColor: UIColors.background,
      floatingActionButton: NewButton(
        onPressed: () => showDialog(
          barrierDismissible: false,
          barrierColor: UIColors.dimmed,
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
          PopupMenuButton(
            onSelected: menuCallback,
            itemBuilder: (BuildContext context) => menu,
          ),
        ],
      ),
      body: Column(
        children: [
          _divider,
          ListTitle(listId: list.localId),
          Expanded(child: items.isNotEmpty ? listsView : emptyView),
        ],
      ),
    );
  }

  static const _divider = Divider(
    color: UIColors.secondary,
    height: CollectionLayout.titleSectionDividerWidth,
    thickness: CollectionLayout.titleSectionDividerWidth,
  );
}
