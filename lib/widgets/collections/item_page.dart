import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';

// TODO
class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "Item Page",
        style: UITexts.normalText,
      ),
      appBar: AppBar(
        backgroundColor: UIColors.primary,
      ),
    );
  }
}
