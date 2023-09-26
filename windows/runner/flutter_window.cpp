// // تضمين الملفات اللازمة
// #include </flutter_windows.h>
// #include <binary_messenger.h>
// #include <method_channel.h>

// // تعريف فئة FlutterWindow والتي ترث من FlutterWindow
// class FlutterWindow : public flutter::FlutterWindow {
// public:
//     FlutterWindow(const flutter::DartProject& project,
//                   const flutter::FlutterWindow::OnPlatformViewCreatedCallback& on_platform_view_created_callback);
//     ~FlutterWindow() override;

//     // Override OnCreate and OnDestroy to start and stop ScreenCaptureDetector
//     void OnCreate() override;
//     void OnDestroy() override;

// private:
//     // Function to initialize the method channel
//     void initMethodChannel();

//     // Handle recording notification messages
//     LRESULT CALLBACK HandleMessage(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp);

//     // Notify app of recording status change
//     void NotifyApplication(RecordingNotification status);

//     // Recording notification enum
//     enum RecordingNotification {
//         RECORDING_STARTED,
//         RECORDING_STOPPED
//     };

//     // Method channel for communication with Flutter app
//     std::unique_ptr<flutter::MethodChannel<>> channel;

//     // ScreenCaptureDetector instance
//     ScreenCaptureDetector detector;

//     // Window handle
//     HWND hwnd_;

//     // Recording status
//     bool recordingInProgress_ = false;
// };

// // ScreenCaptureDetector class
// class ScreenCaptureDetector {
// public:
//     static bool IsScreenRecording();
//     static void StartListening(HWND hwnd);
//     static void StopListening();

// private:
//     static bool recordingInProgress;
//     static LRESULT CALLBACK MessageHandler(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp);
// };

// // تعريف المتغيرات الاستاتيكية
// bool ScreenCaptureDetector::recordingInProgress = false;

// // تعريف دالة MessageHandler لمعالجة الرسائل الواردة
// LRESULT CALLBACK ScreenCaptureDetector::MessageHandler(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {

// if(msg == WM_INPUT_RECORDING_STARTED) {
// FlutterWindow::NotifyApplication(FlutterWindow::RECORDING_STARTED);
// recordingInProgress = true;
// }

// if(msg == WM_INPUT_RECORDING_STOPPED) {
// FlutterWindow::NotifyApplication(FlutterWindow::RECORDING_STOPPED);
// recordingInProgress = false;
// }

// return DefWindowProc(hwnd, msg, wp, lp);

// }

// // تعريف دوال ScreenCaptureDetector للبدء والتوقف عن الاستماع للتسجيل
// void ScreenCaptureDetector::StartListening(HWND hwnd) {

// // Register message handler
// SetWindowLong(hwnd, GWL_WNDPROC, (LONG)MessageHandler);

// }

// void ScreenCaptureDetector::StopListening() {

//   // Unregister message handler
//   SetWindowLong(hwnd, GWL_WNDPROC, (LONG)DefWindowProc);

// }

// // تعريف دالة FlutterWindow لإنشاء النافذة وتعيين سلوكها
// FlutterWindow::FlutterWindow(const flutter::DartProject& project,
//                              const flutter::FlutterWindow::OnPlatformViewCreatedCallback& on_platform_view_created_callback)
//         : flutter::FlutterWindow(project, on_platform_view_created_callback) {

//   // Initialize method channel
//   initMethodChannel();

// }

// FlutterWindow::~FlutterWindow() {
//   // Stop ScreenCaptureDetector
//   detector.StopListening();
// }

// // تعريف دوال OnCreate و OnDestroy لبدء وإيقاف ScreenCaptureDetector
// void FlutterWindow::OnCreate() {
//   hwnd_ = hwnd();
//   detector.StartListening(hwnd_);
// }

// void FlutterWindow::OnDestroy() {
//   detector.StopListening();
// }

// // تعريف دالة initMethodChannel لإنشاء قناة الطريقة وتعيين معالج الطريقة
// void FlutterWindow::initMethodChannel() {

//   // Create method channel
//   channel = std::make_unique<flutter::MethodChannel<>>(
//           messenger(), "com/example/hide", &flutter::StandardMethodCodec::GetInstance());

//   // Set method call handler
//   channel->SetMethodCallHandler([this](const auto& call, auto result) {

//       if(call.method_name() == "onScreenshot") {
//         recordingInProgress_ = true;
//         // Call function to protect from screen capture
//         ProtectFromScreenCapture();
//         result->Success();
//       }

//       if(call.method_name() == "onScreenCaptureStarted") {
//         // Notify app of start
//       }

//       if(call.method_name() == "onScreenCaptureEnded") {
//         // Notify app of end
//       }

//   });

// }

// // تعريف دالة NotifyApplication لإرسال إشعارات إلى التطبيق
// void FlutterWindow::NotifyApplication(RecordingNotification status) {

//   // Notify app via method channel
//   channel->InvokeMethod("recordingChanged", std::to_string(status));

// }

// // تعريف دالة ProtectFromScreenCapture لإخفاء النافذة ورسم سطح فارغ
// void ProtectFromScreenCapture() {

//   // Hide window
//   SetWindowLong(hwnd_, GWL_EXSTYLE, WS_EX_TOOLWINDOW);

//   // Draw blank surface
//   while(recordingInProgress_) {
//     // Draw blank surface
//   }

// }

// // تعريف دالة main لإنشاء النافذة وتشغيل التطبيق
// int main() {
//   flutter::DartProject project("path/to/flutter/project");
//   FlutterWindow window(project);
//   window.Show();
//   window.Run();
//   return 0;
// }

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
using namespace std;

FlutterWindow::FlutterWindow(const flutter::DartProject& project)
        : project_(project) {}

FlutterWindow::~FlutterWindow() {}

void initMethodChannel(flutter::FlutterEngine* flutter_instance) {

  const static std::string channel_name("test_channel");

  auto channel =
          std::make_unique<flutter::MethodChannel<>>(
                  flutter_instance->messenger(), channel_name,
                  &flutter::StandardMethodCodec::GetInstance());

  channel->SetMethodCallHandler(
          [](const flutter::MethodCall<>& call,
             std::unique_ptr<flutter::MethodResult<>> result) {

              if (call.method_name().compare("test") == 0) {
                PROCESSENTRY32 entry;
                entry.dwSize = sizeof(PROCESSENTRY32);

                HANDLE snapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);

                std::vector<std::string> processes;

                Process32First(snapshot, &entry);
                do {
                  std::wstring wname(entry.szExeFile);
#pragma warning(disable : 4244)

                  std::string name = std::string(wname.begin(), wname.end());
#pragma warning(disable : 4244)

                  processes.push_back(name);''
                } while (Process32Next(snapshot, &entry));

                CloseHandle(snapshot);

                flutter::EncodableList list;

                for (const std::string& process : processes) {
                  list.push_back(flutter::EncodableValue(process));
                }
                result->Success(list);

              }
              else {
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