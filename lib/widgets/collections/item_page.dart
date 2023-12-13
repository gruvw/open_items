import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_colors.dart';

// TODO
class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text("Item Page"),
      appBar: AppBar(
        backgroundColor: UIColors.primary,
      ),
    );
  }
}
