//
//  BaseAPI.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public enum Task {
    /// All basic request task.
    case request
    case download
    case upload
}

public protocol AppServerConfiguration {
    var baseURL: String { get }
    var defaultHeaders: [String: String] { get }
}

public extension AppServerConfiguration {
    var defaultHeaders: [String : String] {
        return [:]
    }
}

open class BaseAPI {
    let serverConfiguration: AppServerConfiguration
    
    public init(serverConfiguration: AppServerConfiguration) {
        self.serverConfiguration = serverConfiguration
    }
}

public enum EntityState<T: Equatable> {
    case result(T?)
    case fail(String)
}

extension EntityState: Equatable {
    public static func ==<T>(lhs: EntityState<T>, rhs: EntityState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.fail, .fail):
            return true
            
        case (.result(let t1), .result(let t2)):
            return t1 == t2
            
        default:
            return false
        }
    }
}

// MARK: EntityArrayState Section
public enum EntityArrayState<T: Equatable> {
    case result([T]?)
    case fail(String)
}

extension EntityArrayState: Equatable {
    public static func ==<T>(lhs: EntityArrayState<T>, rhs: EntityArrayState<T>) -> Bool {
        
        switch (lhs, rhs) {
        case (.fail, .fail):
            return true
            
        case (.result(let t1), .result(let t2)):
            return t1 == t2
            
        default:
            return false
        }
    }
}
