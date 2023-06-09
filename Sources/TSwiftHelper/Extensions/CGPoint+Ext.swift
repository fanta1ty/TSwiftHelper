//
//  CGPoint+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public extension CGPoint {
    
    // MARK: Constructor from CGVector
    init(vector: CGVector) {
        self.init(x: vector.dx, y: vector.dy)
    }
    
    // MARK: Constructor from CGFloat
    init(angle: CGFloat) {
        self.init(x: cos(angle), y: sin(angle))
    }

    // MARK: Adds two CGPoints.
    static func + (this: CGPoint, that: CGPoint) -> CGPoint {
        return CGPoint(x: this.x + that.x, y: this.y + that.y)
    }

    // MARK: Subtracts two CGPoints.
    static func - (left: CGPoint, right: CGPoint) -> CGPoint {
        return CGPoint(x: left.x - right.x, y: left.y - right.y)
    }

    // MARK: Multiplies a CGPoint with a scalar CGFloat.
    static func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
        return CGPoint(x: point.x * scalar, y: point.y * scalar)
    }

    // MARK: Calculates the distance between two CG Points.
    /// Inspired by : http://stackoverflow.com/questions/1906511/how-to-find-the-distance-between-two-cg-points
    static func distance(from: CGPoint, to: CGPoint) -> CGFloat {
        return sqrt(pow(to.x - from.x, 2) + pow(to.y - from.y, 2))
    }

    // MARK: Normalizes the vector described by the CGPoint to length 1.0 and returns the result as a new CGPoint.
    func normalized() -> CGPoint {
        let len = CGPoint.distance(from: self, to: CGPoint.zero)
        return CGPoint(x: self.x / len, y: self.y / len)
    }

    // MARK: Returns the angle represented by the point.
    var angle: CGFloat {
        return atan2(y, x)
    }

    // MARK: Returns the dot product of two vectors represented by points
    static func dotProduct(this: CGPoint, that: CGPoint) -> CGFloat {
        return this.x * that.x + this.y * that.y
    }

    // MARK: Performs a linear interpolation between two CGPoint values.
    static func linearInterpolation(startPoint: CGPoint, endPoint: CGPoint, interpolationParam: CGFloat) -> CGPoint {
        return startPoint + (endPoint - startPoint) * interpolationParam
    }
}
