//
//  Bool+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

extension Bool {
    // MARK: Converts Bool to Int.
    public var toInt: Int { return self ? 1 : 0 }

    // MARK: Toggle boolean value.
    @discardableResult
    public mutating func toggle() -> Bool {
        self = !self
        return self
    }
    
    // MARK: Return inverted value of bool.
    public var toggled: Bool {
        return !self
    }
}
