import Foundation
import UIKit

extension UIApplication {
    func updateAppAppearance() {
        
        for window in UIApplication.shared.windows {
            for view in window.subviews {
                view.removeFromSuperview()
                window.addSubview(view)
            }
            // update the status bar
            window.rootViewController?.setNeedsStatusBarAppearanceUpdate()
        }
    }
}
