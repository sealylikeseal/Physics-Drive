import SwiftUI
import Firebase

@main
struct CarCrashGameApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var auth = AuthManager()

    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(auth)
        }
    }
}

// Firebase initialization
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
