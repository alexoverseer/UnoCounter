import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupWindow(with: RootViewController.instantiate())
        setAppAppearance()
        checkApplicationFirstLaunch()
        print("iOS📱: \(FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).last!)")
    
        return true
    }
    
    private func setupWindow(with controller: UIViewController) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let navigation = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigation
    }
}
