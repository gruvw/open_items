import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_colors.dart';

// TODO
class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text("List Page"),
      appBar: AppBar(
        backgroundColor: UIColors.primary,
      ),
    );
  }
}
