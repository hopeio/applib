import 'dart:ffi';
import 'dart:isolate';
import 'dart:io'; // For Platform.isX
import 'dart:math'; // For Platform.isX

DynamicLibrary findDynamicLibrary(String name, String dir) {
  if (!dir.endsWith('/')) dir = '$dir/';
  if (Platform.isAndroid) {
    try {
      return DynamicLibrary.open('lib$name.so');
      // ignore: avoid_catching_errors
    } on ArgumentError {
      final appIdAsBytes = File('/proc/self/cmdline').readAsBytesSync();

      // app id ends with the first \0 character in here.
      final endOfAppId = max(appIdAsBytes.indexOf(0), 0);
      final appId = String.fromCharCodes(appIdAsBytes.sublist(0, endOfAppId));

      return DynamicLibrary.open('/data/data/$appId/lib/lib$name.so');
    }
  }
  if (Platform.isIOS) {
    try {
      return DynamicLibrary.open('$name.framework/$name');
      // Ignoring the error because its the only way to know if it was sucessful
      // or not...
      // ignore: avoid_catching_errors
    } on ArgumentError catch (_) {
      // In an iOS app without sqlite3_flutter_libs this falls back to using the version provided by iOS.
      // This version is different for each iOS release.
      //
      // When using sqlcipher_flutter_libs this falls back to the version provided by the SQLCipher pod.
      return DynamicLibrary.process();
    }
  }
  return DynamicLibrary.process();
}
