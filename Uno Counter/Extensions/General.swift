//
//  General.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/9/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import Foundation
import UIKit
import ChameleonFramework

extension UIColor {
    
    class func RGBA(R: CGFloat, G: CGFloat, B: CGFloat, A: CGFloat) -> UIColor {
        return UIColor(red: R/255.0, green: G/255.0, blue: B/255.0, alpha: A)
    }
    
    open class var Turquoise:    UIColor { get {return UIColor.RGBA(R: 26,  G: 188, B: 156, A: 1)}}
    open class var Emerland:     UIColor { get {return UIColor.RGBA(R: 46,  G: 204, B: 113, A: 1)}}
    open class var PeterRiver:   UIColor { get {return UIColor.RGBA(R: 52,  G: 152, B: 249, A: 1)}}
    open class var Amethyst:     UIColor { get {return UIColor.RGBA(R: 155, G: 89,  B: 182, A: 1)}}
    open class var WetAsphalt:   UIColor { get {return UIColor.RGBA(R: 52,  G: 73,  B: 94,  A: 1)}}
    open class var GreenSea:     UIColor { get {return UIColor.RGBA(R: 22,  G: 160, B: 133, A: 1)}}
    open class var Nephritis:    UIColor { get {return UIColor.RGBA(R: 39,  G: 174, B: 93,  A: 1)}}
    open class var BelizeHole:   UIColor { get {return UIColor.RGBA(R: 41,  G: 128, B: 185, A: 1)}}
    open class var Wisteria:     UIColor { get {return UIColor.RGBA(R: 41,  G: 128, B: 185, A: 1)}}
    open class var MidnightBlue: UIColor { get {return UIColor.RGBA(R: 44,  G: 62,  B: 80,  A: 1)}}
    open class var SunFlower:    UIColor { get {return UIColor.RGBA(R: 241, G: 196, B: 15,  A: 1)}}
    open class var Carrot:       UIColor { get {return UIColor.RGBA(R: 230, G: 126, B: 34,  A: 1)}}
    open class var Alizarin:     UIColor { get {return UIColor.RGBA(R: 231, G: 76,  B: 60,  A: 1)}}
    open class var Concrete:     UIColor { get {return UIColor.RGBA(R: 149, G: 165, B: 166, A: 1)}}
    open class var Orange:       UIColor { get {return UIColor.RGBA(R: 243, G: 156, B: 18,  A: 1)}}
    open class var Pumpkin:      UIColor { get {return UIColor.RGBA(R: 211, G: 84,  B: 0,   A: 1)}}
    open class var Pomegranate:  UIColor { get {return UIColor.RGBA(R: 192, G: 57,  B: 43,  A: 1)}}
    open class var Silver:       UIColor { get {return UIColor.RGBA(R: 189, G: 195, B: 199, A: 1)}}
}

extension UIColor {
    convenience init(_ hex6: UInt32) {
        let divisor = CGFloat(255)
        let red = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green = CGFloat((hex6 & 0x00FF00) >> 8) / divisor
        let blue = CGFloat((hex6 & 0x0000FF) >> 0) / divisor
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

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

extension UserDefaults {
    func setColor(_ color: UIColor, forKey key: String) {
        set(NSKeyedArchiver.archivedData(withRootObject: color), forKey: key)
    }
    func color(forKey key: String) -> UIColor? {
        guard let data = data(forKey: key) else { return nil }
        return NSKeyedUnarchiver.unarchiveObject(with: data) as? UIColor
    }
}

extension UIView {
    
    // In order to create computed properties for extensions, we need a key to
    // store and access the stored property
    fileprivate struct AssociatedObjectKeys {
        static var tapGestureRecognizer = "MediaViewerAssociatedObjectKey_mediaViewer"
    }
    
    fileprivate typealias Action = (() -> Void)?
    
    // Set our computed property type to a closure
    fileprivate var tapGestureRecognizerAction: Action? {
        set {
            if let newValue = newValue {
                // Computed properties get stored as associated objects
                objc_setAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            }
        }
        get {
            let tapGestureRecognizerActionInstance = objc_getAssociatedObject(self, &AssociatedObjectKeys.tapGestureRecognizer) as? Action
            return tapGestureRecognizerActionInstance
        }
    }
    
    // This is the meat of the sauce, here we create the tap gesture recognizer and
    // store the closure the user passed to us in the associated object we declared above
    public func addTapGestureRecognizer(action: (() -> Void)?) {
        self.isUserInteractionEnabled = true
        self.tapGestureRecognizerAction = action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // Every time the user taps on the UIImageView, this function gets called,
    // which triggers the closure we stored
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        if let action = self.tapGestureRecognizerAction {
            action?()
        }
    }
}

extension AppDelegate {
    
    func setAppAppearance() {
        
        window?.backgroundColor = .white
        if let appPrimaryColor = UserDefaults.standard.color(forKey:Constants.appPrimaryColor) {
            Chameleon.setGlobalThemeUsingPrimaryColor(appPrimaryColor, with: .contrast)
        } else {
            Chameleon.setGlobalThemeUsingPrimaryColor(.Turquoise, with: .contrast)
        }
        UIApplication.shared.statusBarStyle = (UIStatusBarStyleContrast)
    }
    
    func checkApplicationFirstLaunch() {
        
        if !UserDefaults.standard.bool(forKey: Constants.applicationFirstLaunch) {
            
            UserDefaults.standard.set(true, forKey: Constants.applicationFirstLaunch)
            createPhotoPath()
            UserDefaults.standard.synchronize()
        }
    }
    
    func createPhotoPath() {
    
        let libraryDirectory = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first!
        let dataPath = libraryDirectory.appendingPathComponent(Constants.userPhotosFolder)
        
        do {
            try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print("Error creating directory: \(error.localizedDescription)")
        }
    }
}
