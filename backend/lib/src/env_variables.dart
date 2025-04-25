import 'dart:io';

class EnvVariables {
  const EnvVariables._();

  static final pgHost = Platform.environment['PG_HOST'] ?? 'localhost';
  static final pgUser = Platform.environment['PG_USER'] ?? 'postgres';
  static final pgPassword = Platform.environment['PG_PASSWORD'] ?? 'postgres';
  static final devModeEnabled = Platform.environment['DEV_MODE'] == 'true';
}
