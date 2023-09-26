#include "flutter_window.h"
#include <locale>
#include <codecvt>
#include <optional>
#include <Windows.h>
#include <TlHelp32.h>
#include <psapi.h>

#include "flutter/generated_plugin_registrant.h"
#include <flutter/binary_messenger.h>
#include <flutter/standard_method_codec.h>
#include <flutter/method_channel.h>
#include <flutter/method_result_functions.h>
#include <ScreenCapture.h>

using namespace std;
bool IsScreenRecordingCurrentlyInProgress() {
    // Define this function or include its header file if it is defined elsewhere.
    return false;
}
FlutterWindow::FlutterWindow(const flutter::DartProject &project)
        : project_(project) {}

FlutterWindow::~FlutterWindow() {}

void initMethodChannel(flutter::FlutterEngine *flutter_instance) {
    const static std::string channel_name("test_channel");
    auto channel = std::make_shared<flutter::MethodChannel<>>(
            flutter_instance->messenger(), channel_name,
            &flutter::StandardMethodCodec::GetInstance());

    channel->SetMethodCallHandler(
            [](const flutter::MethodCall<>& call,
               std::unique_ptr<flutter::MethodResult<>> result) {
                if (call.method_name().compare("test") == 0) {
                    // Check for screen recording
                    if (IsScreenRecordingCurrentlyInProgress()) {
                        // Send message back to Dart
                        result->Success("Screen recording detected!");
                        return;
                    }
                    // Existing process listing code...
                } else {
                    result->NotImplemented();
                }
            });
}

bool FlutterWindow::OnCreate() {
    if (!Win32Window::OnCreate()) {
        return false;
    }

    RECT frame = GetClientArea();

    // The size here must match the window dimensions to avoid unnecessary surface
    // creation / destruction in the startup path.
    flutter_controller_ = std::make_unique<flutter::FlutterViewController>(
            frame.right - frame.left, frame.bottom - frame.top, project_);
    // Ensure that basic setup of the controller was successful.
    if (!flutter_controller_->engine() || !flutter_controller_->view()) {
        return false;
    }
    RegisterPlugins(flutter_controller_->engine());
    // initialize method channel here ******
    initMethodChannel(flutter_controller_->engine()); 

    SetChildContent(flutter_controller_->view()->GetNativeWindow());
    return true;
}

void FlutterWindow::OnDestroy() {
    if (flutter_controller_) {
        flutter_controller_ = nullptr;
    }

    Win32Window::OnDestroy();
}

LRESULT
FlutterWindow::MessageHandler(HWND hwnd, UINT const message,
                              WPARAM const wparam,
                              LPARAM const lparam)

noexcept {
// Give Flutter, including plugins, an opportunity to handle window messages.
if (flutter_controller_) {
std::optional <LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
if (result) {
return *
result;
}
}

switch (message) {
case WM_FONTCHANGE:
flutter_controller_->engine()->ReloadSystemFonts();
return 0;
}

return
Win32Window::MessageHandler(hwnd, message, wparam, lparam
);
}