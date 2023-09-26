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

// Global vars
HWND hwnd; // Application window handle
bool recordingInProgress = false;

void initMethodChannel(FlutterEngine* engine) {

  auto channel = std::make_unique<MethodChannel<>>(
    engine->messenger(), "com/example/hide", &StandardMethodCodec::GetInstance());

  channel->SetMethodCallHandler([=](const MethodCall<>& call, MethodResult<> result) {

    if(call.method_name() == "onScreenshot") {
      recordingInProgress = true;
      ProtectFromScreenCapture();
    }

    result->Success(nullptr);
  });

}

void ProtectFromScreenCapture() {

  // Hide window
  SetWindowLong(hwnd, GWL_EXSTYLE, GetWindowLong(hwnd, GWL_EXSTYLE) | WS_EX_TOOLWINDOW);

  // Draw blank surface
  HDC screen = GetDC(NULL);
  HDC memDC = CreateCompatibleDC(screen);

  while(recordingInProgress) {

   RECT rc;
    GetClientRect(hwnd, &rc);

    HBITMAP bmp = CreateCompatibleBitmap(screen, rc.right, rc.bottom);
    HGDIOBJ old = SelectObject(memDC, bmp);

    DrawRect(memDC, 0, 0, rc.right, rc.bottom, RGB(0,0,0));

    BitBlt(screen, 0, 0, rc.right, rc.bottom, memDC, 0, 0, SRCCOPY);

    SelectObject(memDC, old);
    DeleteObject(bmp);
  }

  DeleteDC(memDC);
  ReleaseDC(NULL, screen);

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
    // initialize method channel here ******************
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
