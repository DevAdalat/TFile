// ignore_for_file: lines_longer_than_80_chars

import 'package:hive_flutter/hive_flutter.dart';

class TFileDB {
  static final _db = Hive.box('AppDB');

  Future<void> init() async {
    // ignore: inference_failure_on_function_invocation
    await Hive.openBox('AppDB');
  }

  static bool get isSplashComplete =>
      _db.get('isSplashComplete', defaultValue: false) as bool;
  static bool get isUserLoggedIn =>
      _db.get('isUserLoggedIn', defaultValue: false) as bool;

  static set isSplashComplete(bool value) => _db.put('isSplashComplete', value);
  static set isUserLoggedIn(bool value) => _db.put('isUserLoggedIn', value);
}
