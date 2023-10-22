extension NullMap<T> on T? {
  R? map<R>(R? Function(T) convert) => this == null ? null : convert(this as T);
}
