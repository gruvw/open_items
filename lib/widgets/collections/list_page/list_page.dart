import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_colors.dart';

class ListPage extends StatelessWidget {
  final String listPropertiesId;

  const ListPage({
    super.key,
    required this.listPropertiesId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("List Page $listPropertiesId"),
      appBar: AppBar(
        backgroundColor: UIColors.primary,
      ),
    );
  }
}
