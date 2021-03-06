//
//  CGRect+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public extension CGRect {
    // MARK: Easier initialization of CGRect
    init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat) {
        self.init(x: x, y: y, width: w, height: h)
    }

    // MARK: X value of CGRect's origin
    var x: CGFloat {
        get {
            return self.origin.x
        } set(value) {
            self.origin.x = value
        }
    }
    
    // MARK: Y value of CGRect's origin
    var y: CGFloat {
        get {
            return self.origin.y
        } set(value) {
            self.origin.y = value
        }
    }

    // MARK: Width of CGRect's size
    var w: CGFloat {
        get {
            return self.size.width
        } set(value) {
            self.size.width = value
        }
    }

    // MARK: Height of CGRect's size
    var h: CGFloat {
        get {
            return self.size.height
        } set(value) {
            self.size.height = value
        }
    }
    
    // MARK: Surface Area represented by a CGRectangle
    var area: CGFloat {
        return self.h * self.w
    }
}
