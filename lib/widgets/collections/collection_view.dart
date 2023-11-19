import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:open_items/global/styles/layouts.dart';

class CollectionView extends StatelessWidget {
  final int length;
  final Widget Function(BuildContext context, int index) builder;

  const CollectionView({
    super.key,
    required this.length,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return SlidableAutoCloseBehavior(
      child: ReorderableListView.builder(
        footer: const SizedBox(height: CollectionLayout.listViewScrollOff),
        itemCount: length,
        buildDefaultDragHandles: false,
        // TODO lexoRanking (might need some refactor)
        onReorder: (oldIndex, newIndex) {},
        itemBuilder: builder,
      ),
    );
  }
}
