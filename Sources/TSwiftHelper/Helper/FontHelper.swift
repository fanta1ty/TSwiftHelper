//
//  FontHelper.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public final class FontHelper: NSObject {
    // MARK: loadAll
    public static var loadAll: () -> Void = {
        let fontFamilies = FontFamilyName.allCases.map { $0.rawValue }
        let fontTypes = FontType.allCases.map { $0.rawValue }
        
        for fontFamily in fontFamilies {
            for fontType in fontTypes {
                let fontName = fontFamily + fontType
                loadFont(withName: fontName, extStr: "otf")
                loadFont(withName: fontName, extStr: "ttf")
            }
        }
      return {}
    }()
    
    // MARK: loadFont
    private static func loadFont(withName fontName: String, extStr: String) {
        let bundle = Bundle(for: self.classForCoder())
        
        guard let fontURL = bundle.url(forResource: fontName, withExtension: extStr) else {
            return
        }
        
        guard let fontData = try? Data(contentsOf: fontURL) as CFData else {
            return
        }
        
        guard let provider = CGDataProvider(data: fontData) else {
            return
        }
        guard let font = CGFont(provider) else {
            return
        }
        CTFontManagerRegisterGraphicsFont(font, nil)
    }
}
