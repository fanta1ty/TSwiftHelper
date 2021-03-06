//
//  UISwitch+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public extension UISwitch {

    // MARK: toggles Switch
    func toggle() {
        self.setOn(!self.isOn, animated: true)
    }
}
