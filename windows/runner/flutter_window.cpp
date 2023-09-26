// In ScreenCaptureDetector.h
#include "flutter_window.h"
// other includes 

// Global vars
HWND hwnd;
bool recordingInProgress = false;

void initMethodChannel(FlutterEngine* engine) {

  auto channel = std::make_unique<MethodChannel<>>(
    engine->messenger(), "com/example/hide", &StandardMethodCodec::GetInstance());

  channel->SetMethodCallHandler([](const MethodCall<>& call, MethodResult<> result) {
    
    if(call.method_name() == "onScreenshot") {
      recordingInProgress = true;
      ProtectFromScreenCapture(); 
      result->Success();
    }
    
    if(call.method_name() == "onScreenCaptureStarted") {
      // Notify app of start
    }

    if(call.method_name() == "onScreenCaptureEnded") {
      // Notify app of end
    }

  });

}

void ProtectFromScreenCapture() {

  // Hide window
  SetWindowLong(hwnd, GWL_EXSTYLE, WS_EX_TOOLWINDOW);  

  // Draw blank surface

  while(recordingInProgress) {

    // Draw blank surface

  }

}

// Rest of FlutterWindow class 

LRESULT CALLBACK MessageHandler(HWND hwnd, UINT msg, ...) {

  switch(msg) {

    case WM_USER_RECORDING_ENDED: 
      recordingInProgress = false;
      // Remove tool window style
      break;

  }

  // Handle other messages

}
// Define notification message id
#define WM_RECORDING_NOTIFICATION WM_USER+1

void FlutterWindow::initMethodChannel() {

  // Channel setup

  channel->setMethodCallHandler([](const MethodCall<>& call, Result result) {

    if(call == "startRecording") {

      recordingInProgress = true;
      ProtectWindow();
      PostMessage(hwnd, WM_RECORDING_NOTIFICATION, RECORDING_STARTED, 0);

    } else if(call == "stopRecording") {

      recordingInProgress = false;  
      RestoreWindow();
      PostMessage(hwnd, WM_RECORDING_NOTIFICATION, RECORDING_STOPPED, 0);

    }

  });

}

LRESULT CALLBACK FlutterWindow::HandleMessage(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {

  if(msg == WM_RECORDING_NOTIFICATION) {

    // Notify app of recording status change
    NotifyApplication((RecordingNotification)wp);

  } else {

    // Handle other messages

  }

  return DefWindowProc(hwnd, msg, wp, lp);

}

void FlutterWindow::NotifyApplication(RecordingNotification status) {

  // Notify app via method channel
  channel->invokeMethod("recordingChanged", std::to_string(status));

}

enum RecordingNotification {
  RECORDING_STARTED,
  RECORDING_STOPPED
};
class ScreenCaptureDetector {
public:
  static bool IsScreenRecording();

  static void StartListening(HWNDhwnd);
  static void StopListening();

  static void OnScreenRecordingStarted(); 
  static void OnScreenRecordingStopped();

private:
  static bool recordingInProgress;

  static LRESULT CALLBACK MessageHandler(HWNDhwnd, UINT msg, WPARAM wp, LPARAM lp);
};


// In ScreenCaptureDetector.cpp

bool ScreenCaptureDetector::recordingInProgress = false;

LRESULT CALLBACK ScreenCaptureDetector::MessageHandler(HWNDhwnd, UINT msg, WPARAM wp, LPARAM lp) {

  if(msg == WM_INPUT_RECORDING_STARTED) {
    OnScreenRecordingStarted();
  }

  if(msg == WM_INPUT_RECORDING_STOPPED) {
    OnScreenRecordingStopped();
  }

  return DefWindowProc(hwnd, msg, wp, lp);

}

void ScreenCaptureDetector::OnScreenRecordingStarted() {
  recordingInProgress = true;
}

void ScreenCaptureDetector::OnScreenRecordingStopped() {
  recordingInProgress = false;
}


// In FlutterWindow.cpp

ScreenCaptureDetector detector;

FlutterWindow::OnCreate() {

  detector.StartListening(hwnd);

}

FlutterWindow::OnDestroy() {

  detector.StopListening();

}