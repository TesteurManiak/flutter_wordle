import 'package:flutter/foundation.dart';

final class EnvVariables {
  const EnvVariables._();

  // Debug
  static const isDev = bool.fromEnvironment('DEV_MODE_ENABLED');
  static const canShowDebugOptions = kDebugMode || isDev;

  // App
  static const apiDomain = String.fromEnvironment('apiDomain');
}
