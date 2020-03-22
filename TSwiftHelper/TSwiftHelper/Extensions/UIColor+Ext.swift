//
//  UIColor+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

extension UIColor {
    // MARK: Implement Initialization With Hex Value Function
    convenience init(hex: UInt32) {
        let a = CGFloat(hex & 0xFF) / 255.0
        let b = CGFloat((hex >> 8) & 0xFF) / 255.0
        let g = CGFloat((hex >> 16) & 0xFF) / 255.0
        let r = CGFloat((hex >> 24) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    // MARK: Implement Initialization With Red Green Blue Value Function
    convenience init(redInt r: Float, greenInt g: Float, blueInt b: Float, a: Float) {
        let bv = CGFloat(b / 255.0)
        let gv = CGFloat(g / 255.0)
        let rv = CGFloat(r / 255.0)
        self.init(red: rv, green: gv, blue: bv, alpha: CGFloat(a))
    }
    
    // MARK: Implement Initialization With Hex String And Alpha Value Function
    convenience init(hexString: String, alpha: CGFloat) {
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
