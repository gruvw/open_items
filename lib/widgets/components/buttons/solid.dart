import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/widgets/components/buttons/plain.dart';

class SolidButtonPrimary extends PlainButton {
  const SolidButtonPrimary({
    super.key,
    required super.content,
    required super.onPressed,
    super.enabled,
    super.leading,
  }) : super(
          foregroundColor: UIColors.secondary,
          backgroundColor: UIColors.primary,
          borderColor: UIColors.primary,
        );
}

class SolidButtonSecondary extends PlainButton {
  const SolidButtonSecondary({
    super.key,
    required super.content,
    required super.onPressed,
    super.enabled,
    super.leading,
  }) : super(
          foregroundColor: UIColors.primary,
          backgroundColor: UIColors.secondary,
          borderColor: UIColors.secondary,
        );
}
