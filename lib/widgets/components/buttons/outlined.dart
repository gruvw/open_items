import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/widgets/components/buttons/plain.dart';

class OutlinedButtonPrimary extends PlainButton {
  const OutlinedButtonPrimary({
    super.key,
    required super.text,
    required super.onPressed,
  }) : super(
          foregroundColor: UIColors.secondary,
          backgroundColor: UIColors.primary,
          borderColor: UIColors.secondary,
        );
}

class OutlinedButtonSecondary extends PlainButton {
  const OutlinedButtonSecondary({
    super.key,
    required super.text,
    required super.onPressed,
  }) : super(
          foregroundColor: UIColors.primary,
          backgroundColor: UIColors.secondary,
          borderColor: UIColors.primary,
        );
}
