//
//  StringHelper.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

// MARK: - StringHelper
public final class StringHelper {
    // MARK: remove special character
    public static func removeSpecialCharacters(text: String, specialCharacters: String = "+-*=(),.:!_") -> String {
        return text.filter { character in
            let specialChars : Set<Character> = Set(specialCharacters)
            if specialChars.contains(character) {
                return false
            } else {
                return true
            }
        }
    }
    
    // MARK: nonAccentVietnamese
    public static func nonAccentVietnamese(text: String) -> String {
        let preparedText = removeSpecialCharacters(text: text)
        var foldedText = preparedText.folding(options: .diacriticInsensitive, locale: Locale(identifier: "vi_VN"))
        foldedText = foldedText.replacingOccurrences(of: "đ", with: "d")
        foldedText = foldedText.replacingOccurrences(of: "Đ", with: "D")
        return foldedText
    }
    
    // MARK: matches
    public static func matches(for regex: String, in text: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: text,
                                        range: NSRange(text.startIndex..., in: text))
            return results.map {
                String(text[Range($0.range, in: text)!])
            }
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
        }
    }
}
