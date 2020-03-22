//
//  PrintHelper.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public enum PrintLevel {
    case debug
    case info
    case error
    case warning
    case verbose
    
}

// MARK: print
public func print(level: PrintLevel, message: String) {
    let length = Float(message.count + 3) * 1.5
    let seperate = String(repeating: "-", count: Int(length))
    
    var levelStr = "❤️"
    
    switch level {
    case .debug:
        levelStr = "💚"
        
    case .info:
        levelStr = "💙"
        
    case .error:
        levelStr = "❤️"
        
    case .warning:
        levelStr = "💛"
        
    case .verbose:
        levelStr = "💜"
    }
    
    let printStr = levelStr + " " + message + "\n" + seperate
    print(printStr)
}
