//
//  Array+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public extension Array {
    // MARK: find
    func find(with predicate: (Element) -> Bool) -> Index? {
        for index in self.startIndex ..< self.endIndex {
            if predicate(self[index]) {
                return index
            }
        }
        return nil
    }
    
    // MARK: findAndReplace
    mutating func findAndReplace(with predicate: (Element) -> Bool, for item: Element) -> Bool {
        if let index = find(with: predicate) {
            self[index] = item
            return true
        }
        return false
    }
    
    // MARK: Get a sub array from range of index
    func get(at range: ClosedRange<Int>) -> Array {
        let halfopenClampedRange = Range(range).clamped(to: indices)
        return Array(self[halfopenClampedRange])
    }

    // MARK: Checks if array contains at least 1 item which type is same with given element's type
    func containsType<T>(of element: T) -> Bool {
        let elementType = type(of: element)
        return contains { type(of: $0) == elementType}
    }

    // MARK: Decompose an array to a tuple with first element and the rest
    func decompose() -> (head: Iterator.Element, tail: SubSequence)? {
        return (count > 0) ? (self[0], self[1..<count]) : nil
    }

    // MARK: Iterates on each element of the array with its index. (Index, Element)
    func forEachEnumerated(_ body: @escaping (_ offset: Int, _ element: Element) -> Void) {
        enumerated().forEach(body)
    }

    // MARK: Gets the object at the specified index, if it exists.
     func get(at index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }

    // MARK: Prepends an object to the array.
     mutating func insertFirst(_ newElement: Element) {
        insert(newElement, at: 0)
    }

    // MARK: Returns a random element from the array.
     func random() -> Element? {
        guard count > 0 else { return nil }
        let index = Int(arc4random_uniform(UInt32(count)))
        return self[index]
    }

    // MARK: Reverse the given index. i.g.: reverseIndex(2) would be 2 to the last
    func reverseIndex(_ index: Int) -> Int? {
        guard index >= 0 && index < count else { return nil }
        return Swift.max(count - 1 - index, 0)
    }

    // MARK: Shuffles the array in-place using the Fisher-Yates-Durstenfeld algorithm.
     mutating func shuffle() {
        guard count > 1 else { return }
        var j: Int
        for i in 0..<(count-2) {
            j = Int(arc4random_uniform(UInt32(count - i)))
            if i != i+j { self.swapAt(i, i+j) }
        }
    }

    // MARK: Shuffles copied array using the Fisher-Yates-Durstenfeld algorithm, returns shuffled array.
    func shuffled() -> Array {
        var result = self
        result.shuffle()
        return result
    }

    // MARK: Returns an array with the given number as the max number of elements.
    func takeMax(_ n: Int) -> Array {
        return Array(self[0..<Swift.max(0, Swift.min(n, count))])
    }

    // MARK: Checks if test returns true for all the elements in self
    func testAll(_ body: @escaping (Element) -> Bool) -> Bool {
        return !contains { !body($0) }
    }

    // MARK: Checks if all elements in the array are true or false
    func testAll(is condition: Bool) -> Bool {
        return testAll { ($0 as? Bool) ?? !condition == condition }
    }
}

// MARK: - Equatable
public extension Array where Element: Equatable {
    mutating func removeDuplicates() {
        var result = [Element]()
        for value in self {
            if !result.contains(value) {
                result.append(value)
            }
        }
        self = result
    }
    
    // MARK: Checks if the main array contains the parameter array
    func contains(_ array: [Element]) -> Bool {
        return array.testAll { self.firstIndex(of: $0) ?? -1 >= 0 }
    }

    // MARK: Checks if self contains a list of items.
    func contains(_ elements: Element...) -> Bool {
        return elements.testAll { self.firstIndex(of: $0) ?? -1 >= 0 }
    }

    // MARK: Returns the indexes of the object
    func indexes(of element: Element) -> [Int] {
        return enumerated().compactMap { ($0.element == element) ? $0.offset : nil }
    }

    // MARK: Returns the last index of the object
    func lastIndex(of element: Element) -> Int? {
        return indexes(of: element).last
    }

    // MARK: Removes the first given object
    mutating func removeFirst(_ element: Element) {
        guard let index = firstIndex(of: element) else { return }
        self.remove(at: index)
    }

    // MARK: Removes all occurrences of the given object(s), at least one entry is needed.
    mutating func removeAll(_ firstElement: Element?, _ elements: Element...) {
        var removeAllArr = [Element]()
        
        if let firstElementVal = firstElement {
            removeAllArr.append(firstElementVal)
        }
        
        elements.forEach({element in removeAllArr.append(element)})
        
        removeAll(removeAllArr)
    }

    // MARK: Removes all occurrences of the given object(s)
    mutating func removeAll(_ elements: [Element]) {
        // COW ensures no extra copy in case of no removed elements
        self = filter { !elements.contains($0) }
    }

    // MARK: Difference of self and the input arrays.
    func difference(_ values: [Element]...) -> [Element] {
        var result = [Element]()
        elements: for element in self {
            for value in values {
                //  if a value is in both self and one of the values arrays
                //  jump to the next iteration of the outer loop
                if value.contains(element) {
                    continue elements
                }
            }
            //  element it's only in self
            result.append(element)
        }
        return result
    }

    // MARK: Intersection of self and the input arrays.
    func intersection(_ values: [Element]...) -> Array {
        var result = self
        var intersection = Array()

        for (i, value) in values.enumerated() {
            //  the intersection is computed by intersecting a couple per loop:
            //  self n values[0], (self n values[0]) n values[1], ...
            if i > 0 {
                result = intersection
                intersection = Array()
            }

            //  find common elements and save them in first set
            //  to intersect in the next loop
            value.forEach { (item: Element) -> Void in
                if result.contains(item) {
                    intersection.append(item)
                }
            }
        }
        return intersection
    }

    // MARK: Union of self and the input arrays.
    func union(_ values: [Element]...) -> Array {
        var result = self
        for array in values {
            for value in array {
                if !result.contains(value) {
                    result.append(value)
                }
            }
        }
        return result
    }

    // MARK: Returns an array consisting of the unique elements in the array
    func unique() -> Array {
        return reduce([]) { $0.contains($1) ? $0 : $0 + [$1] }
    }
}

// MARK: - Hashable
extension Array where Element: Hashable {
    // MARK: Removes all occurrences of the given object(s)
    public mutating func removeAll(_ elements: [Element]) {
        let elementsSet = Set(elements)
        // COW ensures no extra copy in case of no removed elements
        self = filter { !elementsSet.contains($0) }
    }
}

public func ==<T: Equatable>(lhs: [T]?, rhs: [T]?) -> Bool {
    switch (lhs, rhs) {
    case let (lhs?, rhs?):
        return lhs == rhs
    case (.none, .none):
        return true
    default:
        return false
    }
}

// MARK: - Deprecated 1.8

extension Array {

    // MARK: Checks if array contains at least 1 instance of the given object type
    @available(*, deprecated, renamed: "containsType(of:)")
    public func containsInstanceOf<T>(_ element: T) -> Bool {
        return containsType(of: element)
    }

    // MARK: Gets the object at the specified index, if it exists.
    @available(*, deprecated, renamed: "get(at:)")
    public func get(_ index: Int) -> Element? {
        return get(at: index)
    }

    // MARK: Checks if all elements in the array are true of false
    @available(*, deprecated, renamed: "testAll(is:)")
    public func testIfAllIs(_ condition: Bool) -> Bool {
        return testAll(is: condition)
    }

}

extension Array where Element: Equatable {

    // MARK: Removes the first given object
    @available(*, deprecated, renamed: "removeFirst(_:)")
    public mutating func removeFirstObject(_ object: Element) {
        removeFirst(object)
    }
}

// MARK: - Deprecated 1.7

extension Array {

    // MARK: Prepends an object to the array.
    @available(*, deprecated, renamed: "insertFirst(_:)")
    public mutating func insertAsFirst(_ newElement: Element) {
        insertFirst(newElement)
    }

}

extension Array where Element: Equatable {

    // MARK: Checks if the main array contains the parameter array
    @available(*, deprecated, renamed: "contains(_:)")
    public func containsArray(_ array: [Element]) -> Bool {
        return contains(array)
    }

    // MARK: Returns the indexes of the object
    @available(*, deprecated, renamed: "indexes(of:)")
    public func indexesOf(_ object: Element) -> [Int] {
        return indexes(of: object)
    }

    // MARK: Returns the last index of the object
    @available(*, deprecated, renamed: "lastIndex(_:)")
    public func lastIndexOf(_ object: Element) -> Int? {
        return lastIndex(of: object)
    }

    // MARK: Removes the first given object
    @available(*, deprecated, renamed: "removeFirstObject(_:)")
    public mutating func removeObject(_ object: Element) {
        removeFirstObject(object)
    }

}

// MARK: - Deprecated 1.6

extension Array {

    // MARK: Creates an array with values generated by running each value of self
    /// through the mapFunction and discarding nil return values.
    @available(*, deprecated, renamed: "flatMap(_:)")
    public func mapFilter<V>(mapFunction map: (Element) -> (V)?) -> [V] {
        return compactMap { map($0) }
    }

    // MARK: Iterates on each element of the array with its index.  (Index, Element)
    @available(*, deprecated, renamed: "forEachEnumerated(_:)")
    public func each(_ call: @escaping (Int, Element) -> Void) {
        forEachEnumerated(call)
    }

}
