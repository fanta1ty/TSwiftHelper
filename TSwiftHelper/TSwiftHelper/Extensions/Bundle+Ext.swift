//
//  Bundle+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public extension Bundle {

    #if os(iOS) || os(tvOS)
    // MARK: load xib
    //  Usage: Set some UIView subclass as xib's owner class
    //  Bundle.loadNib("ViewXibName", owner: self) //some UIView subclass
    //  self.addSubview(self.contentView)
    class func loadNib(_ name: String, owner: AnyObject!) {
        _ = Bundle.main.loadNibNamed(name, owner: owner, options: nil)?[0]
    }

    // MARK: load xib
    /// Usage: let view: ViewXibName = Bundle.loadNib("ViewXibName")
    class func loadNib<T>(_ name: String) -> T? {
        return Bundle.main.loadNibNamed(name, owner: nil, options: nil)?[0] as? T
    }
    
    #endif
}
