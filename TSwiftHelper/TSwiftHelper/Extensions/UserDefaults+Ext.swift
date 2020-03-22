//
//  UserDefaults+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

extension UserDefaults {
    
    // MARK: Generic getter and setter for UserDefaults.
    open subscript(key: String) -> AnyObject? {
        get {
            return object(forKey: key) as AnyObject?
        }
        set {
            set(newValue, forKey: key)
        }
    }
    
    // MARK: Date from UserDefaults.
    open func date(forKey key: String) -> Date? {
        return object(forKey: key) as? Date
    }
}
