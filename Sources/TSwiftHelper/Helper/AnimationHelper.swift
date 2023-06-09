//
//  AnimationHelper.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public final class AnimationHelper {
    // MARK: enableRotation
    public static func enableRotation(targetView: UIView, enable: Bool) {
        let animationKey = "rotationAnimation"
        let animationKeyPath = "transform.rotation.z"
        
        if enable {
            let rotationAnimation = CABasicAnimation(keyPath: animationKeyPath)
            rotationAnimation.toValue = Double.pi * 2
            rotationAnimation.duration = 1.5
            rotationAnimation.isCumulative = true
            rotationAnimation.repeatCount = .infinity
            targetView.layer.add(rotationAnimation, forKey: animationKey)
            
        } else {
            targetView.layer.removeAnimation(forKey: animationKey)
        }
    }
}
