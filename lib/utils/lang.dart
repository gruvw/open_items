// https://github.com/dart-lang/language/issues/361
extension NullMap<T> on T? {
  R? map<R>(R? Function(T v) convert) =>
      this == null ? null : convert(this as T);
}
