import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
// import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/material.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuthenicate() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  static Future<bool> authenticate() async {
    try {
      if (!await _canAuthenicate()) return false;
      return await _auth.authenticate(
          authMessages: const [],
          localizedReason: 'Use Face ID to authenticate',
          options: AuthenticationOptions(useErrorDialogs: true));
    } catch (e) {
      debugPrint('Error $e');
      return false;
    }
  }
}

// Future<void> localAuth(BuildContext context) async {
//   final localAuth = LocalAuthentication();
//   final didAuthenticate = await localAuth.authenticateWithBiometrics(
//       localizedReason: 'Please authenticate');
//   if (didAuthenticate) {
//     Navigator.pop(context);
//   }
// }
