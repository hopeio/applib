import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'applib_platform_interface.dart';

/// An implementation of [ApplibPlatform] that uses method channels.
class MethodChannelApplib extends ApplibPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('applib');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
