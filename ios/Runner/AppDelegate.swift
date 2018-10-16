import UIKit
import Flutter

let MethodChannelName = "com.mw.viet_flutter_news"
let GetStatusBarHeight = "getStatusBarHeight"

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
        ) -> Bool {
        //GeneratedPluginRegistrant.register(with: self)
        guard let controller = self.window.rootViewController as? FlutterViewController else {
            preconditionFailure("controller initialize failure")
        }
        let channel = FlutterMethodChannel(name: MethodChannelName, binaryMessenger: controller)
        channel.setMethodCallHandler { (call, result) in
            if call.method == GetStatusBarHeight {
                result(self.getStatusBarHeight())
            }
        }
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func getStatusBarHeight() -> Double {
        return Double(UIApplication.shared.statusBarFrame.height)
    }
    
}
