//
//  Double+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

precedencegroup PowerPrecedence { higherThan: MultiplicationPrecedence }
infix operator ** : PowerPrecedence

public extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        
        return formatter
    }()
    
    static let withCommaSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        
        return formatter
    }()

}

public extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

public extension Double {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
    
    // MARK: Converts Double to String
    var toString: String { return String(self) }

    // MARK: Converts Double to Int
    var toInt: Int { return Int(self) }
    
    #if os(iOS) || os(tvOS)
    
    // MARK: Converts Double to CGFloat
    var toCGFloat: CGFloat { return CGFloat(self) }
    
    #endif
    
    // MARK: Creating the exponent operator
    static func ** (lhs: Double, rhs: Double) -> Double {
        return pow(lhs, rhs)
    }
    
    var formattedWithSeparator: String {
         Formatter.withSeparator.string(for: self) ?? ""
    }
    
    var formattedWithCommaSeparator: String {
         Formatter.withCommaSeparator.string(for: self) ?? ""
    }

}

// MARK: - Deprecated 1.8
public extension Double {

    // MARK: Returns a Double rounded to decimal
    @available(*, deprecated, renamed: "rounded(toPlaces:)")
    func getRoundedByPlaces(_ places: Int) -> Double {
        return rounded(toPlaces: places)
    }

    // MARK: Rounds the current Double rounded to decimal
    @available(*, deprecated, renamed: "round(toPlaces:)")
    mutating func roundByPlaces(_ places: Int) {
        self.round(toPlaces: places)
    }

    // MARK: Returns a Double Ceil to decimal
    @available(*, deprecated, renamed: "ceiled(toPlaces:)")
    func getCeiledByPlaces(_ places: Int) -> Double {
        return ceiled(toPlaces: places)
    }

    // MARK: Ceils current Double to number of places
    @available(*, deprecated, renamed: "ceil(toPlaces:)")
    mutating func ceilByPlaces(_ places: Int) {
        self.ceil(toPlaces: places)
    }
    
    // MARK: Absolute value of Double.
    var abs: Double {
        if self > 0 {
            return self
        } else {
            return -self
        }
    }

}
