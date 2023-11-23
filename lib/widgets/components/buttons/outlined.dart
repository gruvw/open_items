import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/widgets/components/buttons/plain.dart';

class PlainOutlinedButton extends PlainButton {
  const PlainOutlinedButton({
    super.key,
    required super.child,
    required super.foregroundColor,
    required super.backgroundColor,
    required super.borderColor,
    super.onPressed,
    super.leading,
    super.enabled,
  }) : super(
          horizontalPadding: ButtonLayout.outlinedHorizontalPadding,
        );
}

class OutlinedButtonPrimary extends PlainOutlinedButton {
  const OutlinedButtonPrimary({
    super.key,
    required super.child,
    super.onPressed,
    super.leading,
    super.enabled,
  }) : super(
          foregroundColor: UIColors.primary,
          backgroundColor: UIColors.background,
          borderColor: UIColors.primary,
        );
}

class OutlinedButtonSecondary extends PlainOutlinedButton {
  const OutlinedButtonSecondary({
    super.key,
    required super.child,
    super.onPressed,
    super.leading,
    super.enabled,
  }) : super(
          foregroundColor: UIColors.secondary,
          backgroundColor: UIColors.primary,
          borderColor: UIColors.secondary,
        );
}
