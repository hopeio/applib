
import 'applib_platform_interface.dart';

class Applib {
  Future<String?> getPlatformVersion() {
    return ApplibPlatform.instance.getPlatformVersion();
  }
}
