import 'package:flutter/foundation.dart';

@immutable
class AuthConstants {
  static const String userNotFound = 'user-not-found';
  static const String networkRequestFailed = 'network-request-failed';
  static const String wrongPassword = 'wrong-password';
  static const String invalidEmail = 'invalid-email';

  const AuthConstants._();
}
