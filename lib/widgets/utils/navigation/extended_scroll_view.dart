import 'package:flutter/material.dart';
import 'package:open_items/global/layouts.dart';

class ExtendedScrollView extends StatelessWidget {
  final Widget child;

  const ExtendedScrollView({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        child,
        const SizedBox(
          height: UILayout.scrollOff,
        )
      ]),
    );
  }
}
