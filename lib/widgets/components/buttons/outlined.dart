import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/widgets/components/buttons/plain.dart';

const _outlinedHorizontalPadding = 7.0;

class OutlinedButtonPrimary extends PlainButton {
  const OutlinedButtonPrimary({
    super.key,
    required super.content,
    super.onPressed,
    super.leading,
    super.enabled,
  }) : super(
          foregroundColor: UIColors.primary,
          backgroundColor: UIColors.secondary,
          borderColor: UIColors.primary,
          horizontalPadding: _outlinedHorizontalPadding,
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
          horizontalPadding: _outlinedHorizontalPadding,
        );
}
