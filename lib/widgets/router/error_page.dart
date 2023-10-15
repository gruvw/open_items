import 'package:flutter/material.dart';
import 'package:open_items/global/values.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ValuesTheme.errorRouteText),
      ),
      body: const Center(
        child: Text(ValuesTheme.errorRouteText),
      ),
    );
  }
}
