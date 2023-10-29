import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/widgets/utils/feedback/progress.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: UIColors.background,
      body: Center(
        child: InfiniteProgressFeedback(),
      ),
    );
  }
}
