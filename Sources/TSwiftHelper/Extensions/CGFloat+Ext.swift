//
//  CGFloat+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public extension CGFloat {

    // MARK: Return the central value of CGFloat.
    var center: CGFloat { return (self / 2) }

    @available(*, deprecated, renamed: "degreesToRadians")
    func toRadians() -> CGFloat {
        return (.pi * self) / 180.0
    }

    /// 
    func degreesToRadians() -> CGFloat {
        return (.pi * self) / 180.0
    }

    /// 
    mutating func toRadiansInPlace() {
        self = (.pi * self) / 180.0
    }

    // MARK: Converts angle degrees to radians.
    static func degreesToRadians(_ angle: CGFloat) -> CGFloat {
        return (.pi * angle) / 180.0
    }

    // MARK: Converts radians to degrees.
    func radiansToDegrees() -> CGFloat {
        return (180.0 * self) / .pi
    }

    // MARK: Converts angle radians to degrees mutable version.
    mutating func toDegreesInPlace() {
        self = (180.0 * self) / .pi
    }

    // MARK: Converts angle radians to degrees static version.
    static func radiansToDegrees(_ angleInDegrees: CGFloat) -> CGFloat {
        return (180.0 * angleInDegrees) / .pi
    }

    // MARK: Returns a random floating point number between 0.0 and 1.0, inclusive.
    static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / Float(0xFFFFFFFF))
    }

    // MARK: Returns a random floating point number in the range min...max, inclusive.
    static func random(within: Range<CGFloat>) -> CGFloat {
        return CGFloat.random() * (within.upperBound - within.lowerBound) + within.lowerBound
    }

    // MARK: Returns a random floating point number in the range min...max, inclusive.
    static func random(within: ClosedRange<CGFloat>) -> CGFloat {
        return CGFloat.random() * (within.upperBound - within.lowerBound) + within.lowerBound
    }

    /**
      MARK:  :Returns the shortest angle between two angles. The result is always between
      -π and π.
     */
    static func shortestAngleInRadians(from first: CGFloat, to second: CGFloat) -> CGFloat {
        let twoPi = CGFloat(.pi * 2.0)
        var angle = (second - first).truncatingRemainder(dividingBy: twoPi)
        if angle >= .pi {
            angle -= twoPi
        }
        if angle <= -.pi {
            angle += twoPi
        }
        return angle
    }
}
