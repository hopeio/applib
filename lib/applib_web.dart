// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as web;

import 'applib_platform_interface.dart';

/// A web implementation of the ApplibPlatform of the Applib plugin.
class ApplibWeb extends ApplibPlatform {
  /// Constructs a ApplibWeb
  ApplibWeb();

  static void registerWith(Registrar registrar) {
    ApplibPlatform.instance = ApplibWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = web.window.navigator.userAgent;
    return version;
  }
}
