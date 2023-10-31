// Here lies local validations
// Validation functions must be fast as they are often evaluated on every key press

typedef ValidationCallback<T> = ValidationResult Function(T input);
typedef SubmitValidate<T> = ValidationResult? Function(T input);

ValidationCallback alwaysValid<T>(Function(T input) callback) {
  return (input) {
    callback(input);
    return ValidResult();
  };
}

sealed class ValidationResult {
  String? get errorMessage => switch (this) {
        ValidResult() => null,
        InvalidResult(errorMessage: final m) => m,
      };

  bool get isValid => this is ValidResult;
}

class ValidResult extends ValidationResult {}

class InvalidResult extends ValidationResult {
  @override
  final String? errorMessage;

  InvalidResult({required this.errorMessage});
}
