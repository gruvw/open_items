import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/widgets/components/buttons/plain.dart';

class SolidButtonPrimary extends PlainButton {
  const SolidButtonPrimary({super.key, required super.text, required super.onPressed})
      : super(
          foregroundColor: ColorTheme.secondary,
          backgroundColor: ColorTheme.primary,
          borderColor: ColorTheme.primary,
        );
}

class SolidButtonSecondary extends PlainButton {
  const SolidButtonSecondary({super.key, required super.text, required super.onPressed})
      : super(
          foregroundColor: ColorTheme.primary,
          backgroundColor: ColorTheme.secondary,
          borderColor: ColorTheme.secondary,
        );
}
