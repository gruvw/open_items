import 'package:flutter/material.dart';
import 'package:open_items/global/styles/colors.dart';

class InfiniteProgressFeedback extends StatelessWidget {
  const InfiniteProgressFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: UIColors.primary,
    );
  }
}
