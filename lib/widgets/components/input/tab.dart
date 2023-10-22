import 'package:flutter/material.dart';

class IconTab extends StatelessWidget {
  final String text;
  final Icon icon;

  const IconTab({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(text),
        ],
      ),
    );
  }
}
