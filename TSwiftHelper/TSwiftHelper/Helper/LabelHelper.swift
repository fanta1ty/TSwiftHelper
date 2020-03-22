//
//  LabelHelper.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

struct LabelStyle {
    let backgroundColor: DefinedColors!
    let borderColor: DefinedColors!
    let textColor: DefinedColors!
    let textFont: DefinedFonts!
    
    let borderWidth: CGFloat
    let corderRadius: CGFloat
    
    let textAlignment: NSTextAlignment!
    
    let numberOfLines: Int!
    
    let isHidden: Bool
    
    init(backgroundColor: DefinedColors = .Clear,
         borderColor: DefinedColors = .Clear,
         borderWidth: CGFloat = 0,
         corderRadius: CGFloat = 0,
         textColor: DefinedColors = .Black,
         textFont: DefinedFonts = .InterRegular(size: 14),
         textAlignment: NSTextAlignment = .left,
         numberOfLines: Int = 0, isHidden: Bool = false) {
        
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.corderRadius = corderRadius
        self.textColor = textColor
        self.textFont = textFont
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
        self.isHidden = isHidden
    }
}

// MARK: - Static Functions
extension LabelStyle {
    // MARK: regularDefaultFontSize
    static func regularDefaultFontSize() -> LabelStyle {
        return LabelStyle(textFont: .InterRegular(size: 12))
    }
    
    // MARK: boldDefaultFontSize
    static func boldDefaultFontSize() -> LabelStyle {
        return LabelStyle(textFont: .InterBold(size: 12))
    }
    
    // MARK: regularFontSize
    static func regularFontSize(size: Float) -> LabelStyle {
        return LabelStyle(textFont: .InterRegular(size: size))
    }
    
    // MARK: boldFontSize
    static func boldFontSize(size: Float) -> LabelStyle {
        return LabelStyle(textFont: .InterBold(size: size))
    }
}

final class LabelHelper: UILabel {
    private let style: LabelStyle
    
    init(style: LabelStyle, text: String? = nil, parent: UIView? = nil) {
        self.style = style
        super.init(frame: .zero)
        
        self.text = text
        
        if let parent = parent {
            parent.addSubview(self)
        }
        
        initializeStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Functions
extension LabelHelper {
    // MARK: initializeStyle
    final private func initializeStyle() {
        textColor = style.textColor.value
        backgroundColor = style.backgroundColor.value
        
        layer.borderColor = style.borderColor.value.cgColor
        layer.borderWidth = style.borderWidth
        layer.cornerRadius = style.corderRadius
        
        font = style.textFont.value
        textAlignment = style.textAlignment
        numberOfLines = style.numberOfLines
        
        minimumScaleFactor = 0.5
        adjustsFontSizeToFitWidth = true
        
        isHidden = style.isHidden
    }
}
