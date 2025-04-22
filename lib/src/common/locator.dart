import 'package:flutter/foundation.dart';

typedef LocatorFactory<T> = T Function();
typedef OnDisposeCallback<T> = void Function(T value);

class Locator<T> {
  Locator({required LocatorFactory<T> create, this.onDispose}) : _create = create;

  LocatorFactory<T> _create;
  final OnDisposeCallback<T>? onDispose;

  T? _instance;
  T get instance => _instance ??= _create();

  /// Invalidates the current instance of the locator.
  void invalidate() {
    onDispose?.call(instance);
    _instance = null;
  }

  /// Overrides the current instance of the locator with the provided [create]
  /// function.
  @visibleForTesting
  void overrideWith(LocatorFactory<T> create) {
    invalidate();
    _create = create;
  }

  /// Overrides the current instance of the locator with the provided [value].
  @visibleForTesting
  void overrideWithValue(T value) {
    invalidate();
    _create = () => value;
    _instance = value;
  }
}
