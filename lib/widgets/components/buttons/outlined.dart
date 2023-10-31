import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/widgets/components/buttons/plain.dart';

class OutlinedButtonPrimary extends PlainButton {
  const OutlinedButtonPrimary({
    super.key,
    required super.content,
    super.onPressed,
    super.leading,
    super.enabled,
  }) : super(
          foregroundColor: UIColors.primary,
          backgroundColor: UIColors.background,
          borderColor: UIColors.primary,
          horizontalPadding: ButtonLayout.outlinedHorizontalPadding,
        );
}

class OutlinedButtonSecondary extends PlainButton {
  const OutlinedButtonSecondary({
    super.key,
    required super.content,
    super.onPressed,
    super.leading,
    super.enabled,
  }) : super(
          foregroundColor: UIColors.secondary,
          backgroundColor: UIColors.primary,
          borderColor: UIColors.secondary,
          horizontalPadding: ButtonLayout.outlinedHorizontalPadding,
        );
}
