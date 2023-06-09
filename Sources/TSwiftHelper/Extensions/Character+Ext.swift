//
//  Character+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public extension Character {
    // MARK: Converts Character to String //TODO: Add to readme
    var toString: String { return String(self) }

    // MARK: If the character represents an integer that fits into an Int, returns the corresponding integer.
    ///TODO: Add to readme
    var toInt: Int? { return Int(String(self)) }

    // MARK: Convert the character to lowercase
    var lowercased: Character {
            let s = String(self).lowercased()
            return s[s.startIndex]
    }

    // MARK: Convert the character to uppercase
    var uppercased: Character {
            let s = String(self).uppercased()
            return s[s.startIndex]
    }
    
    // MARK: Checks if character is emoji
    var isEmoji: Bool {
        return String(self).includesEmoji()
    }
}
