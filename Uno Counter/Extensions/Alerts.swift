import UIKit

func showAlert(title: String?, message: String?, action: (() -> Void)? = nil) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
        action?()
    }))
    let controller = UIApplication.shared.keyWindow?.rootViewController
    if let presentedViewController = controller?.presentedViewController{
        presentedViewController.present(alert, animated: true, completion: nil)
    }else{
        controller?.present(alert, animated: true, completion: nil)
    }
}

func showDevelopmentAlert() {
    showAlert(title: "Info", message: "This feature is not implemented yet 😕")
}
