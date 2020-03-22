//
//  FloatingPoint+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

extension FloatingPoint {

    // MARK: Returns rounded FloatingPoint to specified number of places
    open func rounded(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }
        var divisor: Self = 1
        for _ in 0..<places { divisor *= 10 }
        return (self * divisor).rounded() / divisor
    }

    // MARK: Rounds current FloatingPoint to specified number of places
    open mutating func round(toPlaces places: Int) {
        self = rounded(toPlaces: places)
    }

    // MARK: Returns ceiled FloatingPoint to specified number of places
    open func ceiled(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }
        var divisor: Self = 1
        for _ in 0..<places { divisor *= 10 }
        return (self * divisor).rounded(.up) / divisor
    }

    // MARK: Ceils current FloatingPoint to specified number of places
    open mutating func ceil(toPlaces places: Int) {
        self = ceiled(toPlaces: places)
    }
    
    // MARK: Returns a random floating point number between 0.0 and 1.0, inclusive.
    open static func random() -> Float {
        return Float(arc4random()) / Float(0xFFFFFFFF)
    }
    
    // MARK: Returns a random floating point number in the range min...max, inclusive.
    open static func random(within: Range<Float>) -> Float {
        return Float.random() * (within.upperBound - within.lowerBound) + within.lowerBound
    }
}
