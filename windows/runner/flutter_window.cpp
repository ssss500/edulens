// In ScreenCaptureDetector.h
#include "flutter_window.h"
// other includes 
#include <flutter/dart_project.h>
#include <flutter/flutter_view_controller.h>
#include <flutter/binary_messenger.h>

// Global vars
HWND hwnd;
bool recordingInProgress = false;

// Function to initialize the method channel
void initMethodChannel(FlutterEngine* engine) {

  auto channel = std::make_unique<MethodChannel<>>(
    engine->messenger(), "com/example/hide", &StandardMethodCodec::GetInstance());

  channel->SetMethodCallHandler([](const MethodCall<>& call, MethodResult<> result) {
    
    if(call.method_name() == "onScreenshot") {
      recordingInProgress = true;
      // Call function to protect from screen capture
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

// Function to protect from screen capture
void ProtectFromScreenCapture() {

  // Hide window
  SetWindowLong(hwnd, GWL_EXSTYLE, WS_EX_TOOLWINDOW);  

  // Draw blank surface
  while(recordingInProgress) {
    // Draw blank surface
  }

}

// Rest of FlutterWindow class 

// Message handler function
LRESULT CALLBACK MessageHandler(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {

  switch(msg) {

    case WM_USER_RECORDING_ENDED: 
      recordingInProgress = false;
      // Remove tool window style
      SetWindowLong(hwnd, GWL_EXSTYLE, WS_EX_APPWINDOW);
      break;

    // Handle other messages

  }

  // Call default message handler
  return DefWindowProc(hwnd, msg, wp, lp);

}

// Define notification message id
#define WM_RECORDING_NOTIFICATION WM_USER+1

// Function to initialize the method channel
void FlutterWindow::initMethodChannel() {

  // Channel setup
  channel->setMethodCallHandler([](const MethodCall<>& call, Result result) {

    if(call == "startRecording") {

      recordingInProgress = true;
      // Call function to protect from screen capture
      ProtectFromScreenCapture();
      // Post recording started notification
      PostMessage(hwnd, WM_RECORDING_NOTIFICATION, RECORDING_STARTED, 0);

    } else if(call == "stopRecording") {

      recordingInProgress = false;  
      // Remove tool window style
      SetWindowLong(hwnd, GWL_EXSTYLE, WS_EX_APPWINDOW);
      // Post recording stopped notification
      PostMessage(hwnd, WM_RECORDING_NOTIFICATION, RECORDING_STOPPED, 0);

    }

  });

}

// Handle recording notification messages
LRESULT CALLBACK FlutterWindow::HandleMessage(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {

  if(msg == WM_RECORDING_NOTIFICATION) {

    // Notify app of recording status change
    NotifyApplication((RecordingNotification)wp);

  } else {

    // Call default message handler
    return DefWindowProc(hwnd, msg, wp, lp);

  }

  return 0;

}

// Notify app of recording status change
void FlutterWindow::NotifyApplication(RecordingNotification status) {

  // Notify app via method channel
  channel->invokeMethod("recordingChanged", std::to_string(status));

}

// Recording notification enum
enum RecordingNotification {
  RECORDING_STARTED,
  RECORDING_STOPPED
};

// ScreenCaptureDetector class
class ScreenCaptureDetector {
public:
  static bool IsScreenRecording();
  static void StartListening(HWND hwnd);
  static void StopListening();
  static void OnScreenRecordingStarted(); 
  static void OnScreenRecordingStopped();

private:
  static bool recordingInProgress;
  static LRESULT CALLBACK MessageHandler(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp);
};

// In ScreenCaptureDetector.cpp

bool ScreenCaptureDetector::recordingInProgress = false;

LRESULT CALLBACK ScreenCaptureDetector::MessageHandler(HWND hwnd, UINT msg, WPARAM wp, LPARAM lp) {

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

// Initialize ScreenCaptureDetector on window creation
void FlutterWindow::OnCreate() {
  detector.StartListening(hwnd);
}

// Stop ScreenCaptureDetector on window destruction
void FlutterWindow::OnDestroy() {
  detector.StopListening();
}