//
//  UITableView+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/27/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

// MARK: - Functions
public extension UITableView {
    // MARK: scrollToBottom
    func scrollToBottom(animated: Bool = true) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: animated)
    }
    
    // MARK: scrollToTop
    func scrollToTop(animated: Bool = true) {
        setContentOffset(CGPoint.zero, animated: animated)
    }
}
