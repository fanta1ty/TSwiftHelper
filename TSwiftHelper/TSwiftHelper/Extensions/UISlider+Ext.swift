//
//  UISlider+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

extension UISlider {
    // MARK: Slider moving to value with animation duration
    public func setValue(_ value: Float, duration: Double) {
      UIView.animate(withDuration: duration, animations: { () -> Void in
        self.setValue(self.value, animated: true)
        }, completion: { (_) -> Void in
          UIView.animate(withDuration: duration, animations: { () -> Void in
            self.setValue(value, animated: true)
            }, completion: nil)
      })
    }
}
