import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_items/widgets/router/loading_page.dart';

class ListTitle extends ConsumerWidget {
  final String listId;

  const ListTitle({
    super.key,
    required this.listId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LoadingPage();
  }
}
