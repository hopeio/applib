#ifndef FLUTTER_PLUGIN_APPLIB_PLUGIN_H_
#define FLUTTER_PLUGIN_APPLIB_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace applib {

class ApplibPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  ApplibPlugin();

  virtual ~ApplibPlugin();

  // Disallow copy and assign.
  ApplibPlugin(const ApplibPlugin&) = delete;
  ApplibPlugin& operator=(const ApplibPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace applib

#endif  // FLUTTER_PLUGIN_APPLIB_PLUGIN_H_
