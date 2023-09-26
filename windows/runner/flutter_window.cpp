#include <Windows.h> 

// إضافة ملف كشف تسجيل الشاشة
#include "ScreenCapture.h"

// متغير عالمي لمتابعة حالة النافذة 
bool isRecording = false;

LRESULT CALLBACK FlutterWindow::MessageHandler(HWND hwnd, UINT message, WPARAM wparam, LPARAM lparam) noexcept {

  // تمكين فلتر من معالجة الرسائل
  if (flutter_controller_) {
    auto result = flutter_controller_->HandleTopLevelWindowProc(hwnd, message, wparam, lparam);
    if (result) return *result;
  }

  switch(message) {

    case WM_ACTIVATEAPP: {

      // الكشف عن بدء/إنهاء تسجيل الشاشة
      bool isCurrentlyRecording = IsScreenRecordingCurrentlyInProgress();  

      // تبديل حالة مرئية النافذة
      if(isCurrentlyRecording != isRecording) {
        isRecording = isCurrentlyRecording;
        ShowWindow(hwnd, isRecording ? SW_HIDE : SW_SHOW);
      }

      break;
    }

    // معالجة رسائل أخرى

  }

  return Win32Window::MessageHandler(hwnd, message, wparam, lparam);

}