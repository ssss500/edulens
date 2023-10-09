#include "flutter_window.h"
#include <locale>
#include <codecvt>
#include <optional>

#include <TlHelp32.h>
#include <psapi.h>
#include <iostream>
#include <windows.h>
#include "flutter/generated_plugin_registrant.h"
#include <flutter/binary_messenger.h>
#include <flutter/standard_method_codec.h>
#include <flutter/method_channel.h>
#include <flutter/method_result_functions.h>
using namespace std;

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
        : project_(project) {}

FlutterWindow::~FlutterWindow() {}

void initMethodChannel(flutter::FlutterEngine* flutter_instance) {
    const static std::string channel_name("test_channel");

    auto channel = std::make_unique<flutter::MethodChannel<>>(
            flutter_instance->messenger(), channel_name,
            &flutter::StandardMethodCodec::GetInstance());

    channel->SetMethodCallHandler(
            [](const flutter::MethodCall<>& call,
               std::unique_ptr<flutter::MethodResult<>> result) {

                HWND hwnd = GetConsoleWindow();

                // Hide the window
                ShowWindow(hwnd, SW_HIDE);

                // Start a loop to check if the user is taking a screenshot or video recording
                while (true) {
                    // Check if the user is taking a screenshot
                    if (GetAsyncKeyState(VK_SNAPSHOT) & 1) {
                        // Send a message to the window to hide it
                        SendMessage(hwnd, WM_SYSCOMMAND, SC_MINIMIZE, 0);
                    }

                    // Check if the user is recording a video
                    if (GetAsyncKeyState(VK_F12) & 1) {
                        // Send a message to the window to hide it
                        SendMessage(hwnd, WM_SYSCOMMAND, SC_MINIMIZE, 0);
                    }

                    // Sleep for 1 second
                    Sleep(1000);
                }

                // Show the window again
                ShowWindow(hwnd, SW_SHOW);

                // Return a result to the Flutter app if needed
                result->Success();

                return 0;
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
    // initialize method channel here ****************
    initMethodChannel(flutter_controller_->engine());

    // RegisterFlutterInstance(flutter_controller_->engine());
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
                              LPARAM const lparam) noexcept {
// Give Flutter, including plugins, an opportunity to handle window messages.
if (flutter_controller_) {
std::optional<LRESULT> result =
        flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam,
                                                      lparam);
if (result) {
return *result;
}
}

switch (message) {
case WM_FONTCHANGE:
flutter_controller_->engine()->ReloadSystemFonts();
return 0;
}

return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}