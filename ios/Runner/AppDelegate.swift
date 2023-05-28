
import UIKit
import Flutter
import Firebase
enum ChannelName {
    static let record = "samples.flutter.io/record"
//     static let screenShot = "samples.flutter.io/screenShot"
}
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate , FlutterStreamHandler {
  private var eventSink: FlutterEventSink?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 11.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
   }
       guard let controller = window?.rootViewController as? FlutterViewController else {
       fatalError("rootViewController is not type FlutterViewController")
       }


           let recordChannel = FlutterEventChannel(name: ChannelName.record,
                                                 binaryMessenger: controller.binaryMessenger)
//            let screenShotChannel = FlutterEventChannel(name: ChannelName.screenShot,
//                                                  binaryMessenger: controller.binaryMessenger)
           recordChannel.setStreamHandler(self)
//            screenShotChannel.setStreamHandler(self)
  return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}
  public func onListen(withArguments arguments: Any?,
                       eventSink: @escaping FlutterEventSink) -> FlutterError? {
    self.eventSink = eventSink

      onRecordNotification()
      if #available(iOS 11.0, *) {
      NotificationCenter.default.addObserver(
        self,
        selector: #selector(AppDelegate.onRecord),
        name:UIScreen.capturedDidChangeNotification,
        object: nil)}
//       NotificationCenter.default.addObserver(
//         self,
//         selector: #selector(AppDelegate.screenShot),
//         name:UIApplication.userDidTakeScreenshotNotification,
//         object: nil)
    return nil
  }

    @objc private func onRecord(notification: NSNotification) {
        onRecordNotification()
    }
//     @objc private func screenShot(notification: NSNotification) {
//         onScreenShot()
//     }
    private func onRecordNotification(){

        let isCaptured = UIScreen.main.isCaptured
        guard let eventSink = eventSink else {
          return
        }
        if #available(iOS 11.0, *) {
        eventSink(isCaptured)
        }

    }
//     private func onScreenShot(){
//
//
//         guard let eventSink = eventSink else {
//           return
//         }
//
//         eventSink(true)
//
//
//     }


  public func onCancel(withArguments arguments: Any?) -> FlutterError? {
    NotificationCenter.default.removeObserver(self)
    eventSink = nil
    return nil
  }
}


