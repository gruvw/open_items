import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/global/values.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          UIValues.errorRouteText,
          style: UITexts.title,
        ),
      ),
      body: Center(
        child: Text(
          UIValues.errorRouteText,
          style: UITexts.normal,
        ),
      ),
    );
  }
}
