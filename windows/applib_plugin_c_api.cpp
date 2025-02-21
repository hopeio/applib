#include "include/applib/applib_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "applib_plugin.h"

void ApplibPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  applib::ApplibPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
