//
//  General.swift
//  Uno Counter
//
//  Created by Alexandr Pavlov on 8/9/17.
//  Copyright © 2017 Softintercom. All rights reserved.
//

import Foundation
import UIKit

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
