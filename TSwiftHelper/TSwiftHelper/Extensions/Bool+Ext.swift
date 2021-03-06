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

public extension Bool {
    // MARK: Converts Bool to Int.
    var toInt: Int { return self ? 1 : 0 }
    
    // MARK: Return inverted value of bool.
    var toggled: Bool {
        return !self
    }
}
