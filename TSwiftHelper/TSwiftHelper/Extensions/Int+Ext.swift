//
//  Int+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

extension Int {
    // MARK: Checks if the integer is even.
    public var isEven: Bool { return (self % 2 == 0) }

    // MARK: Checks if the integer is odd.
    public var isOdd: Bool { return (self % 2 != 0) }

    // MARK: Checks if the integer is positive.
    public var isPositive: Bool { return (self > 0) }

    // MARK: Checks if the integer is negative.
    public var isNegative: Bool { return (self < 0) }

    // MARK: Converts integer value to Double.
    public var toDouble: Double { return Double(self) }

    // MARK: Converts integer value to Float.
    public var toFloat: Float { return Float(self) }

    // MARK: Converts integer value to CGFloat.
    public var toCGFloat: CGFloat { return CGFloat(self) }

    // MARK: Converts integer value to String.
    public var toString: String { return String(self) }

    // MARK: Converts integer value to UInt.
    public var toUInt: UInt { return UInt(self) }

    // MARK: Converts integer value to Int32.
    public var toInt32: Int32 { return Int32(self) }

    // MARK: Converts integer value to a 0..<Int range. Useful in for loops.
    public var range: CountableRange<Int> { return 0..<self }

    // MARK: Returns number of digits in the integer.
    public var digits: Int {
        if self == 0 {
            return 1
        } else if Int(fabs(Double(self))) <= LONG_MAX {
            return Int(log10(fabs(Double(self)))) + 1
        }
    }

    // MARK: The digits of an integer represented in an array(from most significant to least).
    /// This method ignores leading zeros and sign
    public var digitArray: [Int] {
        var digits = [Int]()
        for char in self.toString {
            if let digit = Int(String(char)) {
                digits.append(digit)
            }
        }
        return digits
    }

    // MARK: Returns a random integer number in the range min...max, inclusive.
    public static func random(within: Range<Int>) -> Int {
        let delta = within.upperBound - within.lowerBound
        return within.lowerBound + Int(arc4random_uniform(UInt32(delta)))
    }
}

extension UInt {
    // MARK: Convert UInt to Int
    public var toInt: Int { return Int(self) }

    // MARK: Greatest common divisor of two integers using the Euclid's algorithm.
    /// Time complexity of this in O(log(n))
    public static func gcd(_ firstNum: UInt, _ secondNum: UInt) -> UInt {
        let remainder = firstNum % secondNum
        if remainder != 0 {
            return gcd(secondNum, remainder)
        } else {
            return secondNum
        }
    }

    // MARK: Least common multiple of two numbers. LCM = n * m / gcd(n, m)
    public static func lcm(_ firstNum: UInt, _ secondNum: UInt) -> UInt {
        return firstNum * secondNum / UInt.gcd(firstNum, secondNum)
    }
}
