//
//  Hashable+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public extension Hashable {
    // MARK: A string representation of the hash value.
    var hashString: String {
        return String(self.hashValue)
    }
}
