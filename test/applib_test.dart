import 'package:flutter_test/flutter_test.dart';
import 'package:applib/applib.dart';
import 'package:applib/applib_platform_interface.dart';
import 'package:applib/applib_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockApplibPlatform
    with MockPlatformInterfaceMixin
    implements ApplibPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ApplibPlatform initialPlatform = ApplibPlatform.instance;

  test('$MethodChannelApplib is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelApplib>());
  });

  test('getPlatformVersion', () async {
    Applib applibPlugin = Applib();
    MockApplibPlatform fakePlatform = MockApplibPlatform();
    ApplibPlatform.instance = fakePlatform;

    expect(await applibPlugin.getPlatformVersion(), '42');
  });
}
