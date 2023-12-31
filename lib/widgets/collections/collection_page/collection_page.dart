import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/global/texts.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/models/objects/collection.dart';
import 'package:open_items/models/objects/item.dart';
import 'package:open_items/models/objects/list.dart';
import 'package:open_items/models/ordering/item_order.dart';
import 'package:open_items/models/ordering/orderings.dart';
import 'package:open_items/state/application/collection.dart';
import 'package:open_items/state/application/globals.dart';
import 'package:open_items/widgets/collections/collection_entry.dart';
import 'package:open_items/widgets/collections/collection_page/item_text.dart';
import 'package:open_items/widgets/collections/collection_page/list_title.dart';
import 'package:open_items/widgets/collections/collection_view.dart';
import 'package:open_items/widgets/collections/dialogs/change_collection_type.dart';
import 'package:open_items/widgets/collections/dialogs/delete_collection.dart';
import 'package:open_items/widgets/collections/dialogs/edit_item_text.dart';
import 'package:open_items/widgets/collections/dialogs/edit_list_title.dart';
import 'package:open_items/widgets/collections/add_button.dart';
import 'package:open_items/widgets/collections/search_button.dart';
import 'package:open_items/widgets/components/structure/menu_element.dart';
import 'package:open_items/widgets/components/modals/ordering/list_ordering_dialog.dart';
import 'package:open_items/widgets/components/modals/text_dialog.dart';
import 'package:open_items/widgets/router/loading_page.dart';
import 'package:open_items/widgets/router/route_generator.dart';
import 'package:open_items/widgets/validation/core.dart';
import 'package:open_items/widgets/validation/item.dart';

enum CollectionMenuType { list, item, both }

enum CollectionPopupMenu {
  // List wide options
  orderBy(MenuTexts.orderBy, CollectionMenuType.both),
  stackDone(MenuTexts.stackDone, CollectionMenuType.both),

  collectionType(MenuTexts.collectionType, CollectionMenuType.both),

  editList(MenuTexts.editTitle, CollectionMenuType.list),
  deleteList(MenuTexts.deleteList, CollectionMenuType.list),

  editItem(MenuTexts.editText, CollectionMenuType.item),
  deleteItem(MenuTexts.deleteItem, CollectionMenuType.item);

  final CollectionMenuType type;
  final String label;

  const CollectionPopupMenu(this.label, this.type);
}

class CollectionPage extends ConsumerWidget {
  final String listPropertiesLocalId;
  final String collectionLocalId;

  const CollectionPage({
    super.key,
    required this.listPropertiesLocalId,
    required this.collectionLocalId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listProperties = ref.watch(accountListPropertiesProvider(
        propertiesLocalId: listPropertiesLocalId));
    final list =
        ref.watch(listProvider(listLocalId: listProperties?.listLocalId));

    final collection =
        ref.watch(collectionProvider(collectionLocalId: collectionLocalId));
    // May be null
    final parent = ref.watch(parentProvider(itemLocalId: collectionLocalId));

    final items = ref.watch(itemsProvider(
      listPropertiesLocalId: listPropertiesLocalId,
      parentLocalId: collectionLocalId,
    ));
    // May be null
    final parentItems = ref.watch(itemsProvider(
      listPropertiesLocalId: listPropertiesLocalId,
      parentLocalId: parent?.localId,
    ));

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
        parentLocalId: collectionLocalId,
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
            ChangeCollectionTypeDialog.show(context, collectionLocalId),
          CollectionPopupMenu.orderBy => showModalBottomSheet(
              context: context,
              builder: (context) => ListOrderingDialog(
                  listPropertiesLocalId: listPropertiesLocalId),
            ),
          CollectionPopupMenu.stackDone => listProperties
              .copyWith(shouldStackDone: !listProperties.shouldStackDone)
              .save(),
          CollectionPopupMenu.editList =>
            EditListTitleDialog.show(context, list.localId),
          CollectionPopupMenu.editItem =>
            EditItemTextDialog.show(context, collectionLocalId),
          CollectionPopupMenu.deleteList ||
          CollectionPopupMenu.deleteItem =>
            DeleteCollectionDialog.deleteCollection(context, collection, true),
        };

    final menu = CollectionPopupMenu.values
        .where((m) => collection is Liste
            ? m.type != CollectionMenuType.item
            : m.type != CollectionMenuType.list)
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

    final itemsCustomOrder = items.sorted(itemsPositionCustomCompare);
    late final parentItemLocalIdsCustomOrder = parentItems
        ?.sorted(itemsPositionCustomCompare)
        .map((e) => e.localId)
        .toList();

    final uncheckedNb = items.where((i) => !i.isDone).length;
    // When using done ordering, done items stack at the top
    final dividerIndex = listProperties.itemsOrdering == ItemsOrdering.done
        ? items.length - uncheckedNb
        : uncheckedNb;
    final isCheckCollection = collection.collectionType == CollectionType.check;

    final listsView = CollectionView(
      length: items.length,
      builder: (context, index) {
        final item = items[index];

        return CollectionEntry(
          key: ObjectKey(item),
          index: index,
          groupTag: collection.content,
          isFat: item.itemLocalIds.isNotEmpty,
          leading: _iconFor(collection, item, itemsCustomOrder.indexOf(item)),
          reorderEnabled: listProperties.itemsOrdering == ItemsOrdering.custom,
          fatDividier: listProperties.stackDone &&
              isCheckCollection &&
              dividerIndex != 0 &&
              dividerIndex != items.length &&
              index == dividerIndex - 1,
          onDelete: () =>
              DeleteCollectionDialog.deleteCollection(context, item),
          onClick: () => Navigator.pushNamed(
            context,
            Routes.collection.name,
            arguments: [listPropertiesLocalId, item.localId],
          ),
          leadingOnClick: !isCheckCollection
              ? null
              : () => item.copyWith(isDone: !item.isDone).save(),
          content: item.content,
        );
      },
    );

    final emptyView = Center(
      child: Text(Texts.emptyItems, style: UITexts.normal),
    );

    final displayItemText = collection is Item;

    return Scaffold(
      backgroundColor: UIColors.background,
      floatingActionButton: AddButton(
        onPressed: () => showDialog(
          barrierDismissible: false,
          barrierColor: UIColors.dimmed,
          context: context,
          builder: (_) => TextDialog(
            title: DialogTexts.newItemText,
            submitText: Texts.createButton,
            wrap: true,
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
              icon: const Icon(
                UIIcons.back,
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
      body: Column(
        children: [
          _divider,
          ListTitle(
            title: list.title,
            onTap: () => EditListTitleDialog.show(context, list.localId),
          ),
          if (displayItemText) _divider,
          if (displayItemText)
            ItemText(
              onClick: () =>
                  EditItemTextDialog.show(context, collectionLocalId),
              leadingOnClick: parent!.collectionType != CollectionType.check
                  ? null
                  : () =>
                      collection.copyWith(isDone: !collection.isDone).save(),
              leading: _iconFor(
                parent,
                collection,
                parentItemLocalIdsCustomOrder!.indexOf(collectionLocalId),
                true,
              ),
              text: collection.content,
            ),
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

Widget _iconFor(
  Collection collection,
  Item item,
  int customOrderIndex, [
  bool reversed = false,
]) {
  final color = reversed ? UIColors.secondary : UIColors.primary;

  return switch (collection.collectionType) {
    CollectionType.check => Icon(
        item.isDone ? UIIcons.checkedBox : UIIcons.uncheckedBox,
        color: color,
      ),
    CollectionType.unordered => Icon(
        UIIcons.bullet,
        color: color,
      ),
    CollectionType.ordered => Text(
        "${customOrderIndex + 1}.",
        style: UITexts.normal.copyWith(color: color),
      ),
  };
}
