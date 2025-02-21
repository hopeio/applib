import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'applib_method_channel.dart';

abstract class ApplibPlatform extends PlatformInterface {
  /// Constructs a ApplibPlatform.
  ApplibPlatform() : super(token: _token);

  static final Object _token = Object();

  static ApplibPlatform _instance = MethodChannelApplib();

  /// The default instance of [ApplibPlatform] to use.
  ///
  /// Defaults to [MethodChannelApplib].
  static ApplibPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ApplibPlatform] when
  /// they register themselves.
  static set instance(ApplibPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
