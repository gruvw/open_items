// Here lies local validations
// Validation functions must be fast as they are often evaluated on every key press

abstract class ValidationResult {
  bool get isValid;
}
