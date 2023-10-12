#include "flutter_window.h"

#include <optional>

#include "flutter/generated_plugin_registrant.h"
#include "flutter_window.h"
#include <windows.h>
#include <flutter/binary_messenger.h>
#include <flutter/standard_method_codec.h>
#include <flutter/method_channel.h>
#include <flutter/method_result_functions.h>
FlutterWindow::FlutterWindow(const flutter::DartProject& project)
        : project_(project) {}

FlutterWindow::~FlutterWindow() {}
bool ProtectScreenFromRecording(HWND windowHandle)
{
    DWORD affinity = WDA_NONE; // تعيين القدرة على التسجيل إلى القيمة الافتراضية (WDA_NONE)

    // تحديد القدرة على التسجيل للنافذة باستخدام SetWindowDisplayAffinity
    if (!SetWindowDisplayAffinity(windowHandle, affinity))
    {
        // فشل في تعيين القدرة على التسجيل
        return false;
    }

    // تم تعيين القدرة على التسجيل بنجاح
    return true;
}
bool Protect = true; // Declare and define the Protect variable

void initMethodChannel(flutter::FlutterEngine* flutter_instance) {
    const std::string channel_name("my_channel");

    auto channel = std::make_unique<flutter::MethodChannel<>>(
            flutter_instance->messenger(), channel_name,
            &flutter::StandardMethodCodec::GetInstance()
    );

    channel->SetMethodCallHandler(
            [](const flutter::MethodCall<flutter::EncodableValue>& call,
               std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result) {
                std::string method = call.method_name();

                if (method == "protectScreen") {
                    HWND windowHandle = FindWindow(NULL, L"test_screen_protect"); // Replace this with the window handle of your application

                    if (windowHandle != NULL) {
                        if (Protect) {
                            bool setResult = SetWindowDisplayAffinity(windowHandle, WDA_MONITOR);
                            result->Success(flutter::EncodableValue(setResult));
                        } else {
                            bool setResult = SetWindowDisplayAffinity(windowHandle, WDA_NONE);
                            result->Success(flutter::EncodableValue(setResult));
                        }
                    } else {
                        result->Error("Error", "Failed to get the window handle.");
                    }
                }
            }
    );
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
    SetChildContent(flutter_controller_->view()->GetNativeWindow());

    flutter_controller_->engine()->SetNextFrameCallback([&]() {
        this->Show();
    });
   initMethodChannel(flutter_controller_->engine());
    SystemParametersInfo(SPI_SETSCREENSAVERRUNNING, TRUE, NULL, SPIF_SENDCHANGE);

    // تعطيل تسجيل الفيديو
   // SystemParametersInfo(SPI_SETAUDIOSCREENCAPTUREENABLED, FALSE, NULL, SPIF_SENDCHANGE);
    // Flutter can complete the first frame before the "show window" callback is
    // registered. The following call ensures a frame is pending to ensure the
    // window is shown. It is a no-op if the first frame hasn't completed yet.
    flutter_controller_->ForceRedraw();

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
break;
}

return Win32Window::MessageHandler(hwnd, message, wparam, lparam);
}
