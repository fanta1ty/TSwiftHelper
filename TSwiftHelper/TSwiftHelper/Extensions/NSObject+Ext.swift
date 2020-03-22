//
//  NSObject+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

// MARK: - Properties Section
extension NSObject {
    var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy:".").last!
    }
    
    class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy:".").last!
    }
}

// MARK: - Function Section
extension NSObject {
    
}
