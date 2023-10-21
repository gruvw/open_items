import 'package:flutter/material.dart';
import 'package:open_items/global/values.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(UIValues.errorRouteText),
      ),
      body: const Center(
        child: Text(UIValues.errorRouteText),
      ),
    );
  }
}
