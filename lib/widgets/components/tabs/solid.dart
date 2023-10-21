import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/widgets/components/tabs/plain.dart';

class SolidTabPrimary extends PlainTab {
  const SolidTabPrimary({
    super.key,
    required super.text,
    required isActive,
    super.onPressed,
  }) : super(
          foregroundColor: isActive ? UIColors.secondary : UIColors.primary,
          backgroundColor: isActive ? UIColors.primary : UIColors.secondary,
          borderColor: UIColors.primary,
        );
}
