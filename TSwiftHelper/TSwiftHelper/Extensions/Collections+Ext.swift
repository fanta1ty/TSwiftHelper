//
//  Collections+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

extension Collection {
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    public subscript (safe index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
#if os(iOS)
    // MARK:  : A parralelized map for collections, operation is non blocking
    public func parallelizedMap<R>(_ each: @escaping (Self.Iterator.Element) -> R) -> [R?] {
        let indices = indicesArray()
        var res = [R?](repeating: nil, count: indices.count)
        
        let queue = OperationQueue()
        let operations = indices.enumerated().map { index in
            return BlockOperation {
                res[index.offset] = each(self[index.element])
            }
        }
        queue.addOperations(operations, waitUntilFinished: true)
        
        return res
    }

    // MARK: Helper method to get an array of collection indices
    private func indicesArray() -> [Self.Index] {
        var indicesArray: [Self.Index] = []
        var nextIndex = startIndex
        while nextIndex != endIndex {
            indicesArray.append(nextIndex)
            nextIndex = index(after: nextIndex)
        }
        return indicesArray
    }
#endif
}
