//
//  TextViewHelper.swift
//  TSwiftHelper
//
//  Created by User on 3/28/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public struct TextViewStyle {
    let backgroundColor: DefinedColors!
    let borderColor: DefinedColors!
    let textColor: DefinedColors!
    let textFont: DefinedFonts!
    
    let borderWidth: CGFloat
    let corderRadius: CGFloat
    
    let textAlignment: NSTextAlignment!
    let keyboardType: UIKeyboardType!
    let isSecureTextEntry: Bool
    
    let autocorrectionType: UITextAutocorrectionType
    let spellCheckingType: UITextSpellCheckingType
    let autocapitalizationType: UITextAutocapitalizationType
    
    let isHidden: Bool
    let isUserInteractionEnabled: Bool
    
    init(backgroundColor: DefinedColors = .Clear, borderColor: DefinedColors = .Clear, borderWidth: CGFloat = 0, corderRadius: CGFloat = 0, textColor: DefinedColors = .Black, textFont: DefinedFonts = .InterRegular(size: 14), textAlignment: NSTextAlignment = .left, keyboardType: UIKeyboardType = .default, isSecureTextEntry: Bool = false, autocorrectionType: UITextAutocorrectionType = .no, spellCheckingType: UITextSpellCheckingType = .no, autocapitalizationType: UITextAutocapitalizationType = .none, isHidden: Bool = false, isUserInteractionEnabled: Bool = true) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.corderRadius = corderRadius
        self.textColor = textColor
        self.textFont = textFont
        self.textAlignment = textAlignment
        self.keyboardType = keyboardType
        self.isSecureTextEntry = isSecureTextEntry
        self.autocorrectionType = autocorrectionType
        self.spellCheckingType = spellCheckingType
        self.autocapitalizationType = autocapitalizationType
        self.isHidden = isHidden
        self.isUserInteractionEnabled = isUserInteractionEnabled
    }
}

// MARK: - Static Functions
extension TextViewStyle {
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

final class TextViewHelper: UITextView {
    private let style: TextViewStyle
    
    init(style: TextViewStyle, text: String? = nil, parent: UIView? = nil) {
        self.style = style
        super.init(frame: .zero, textContainer: nil)
        
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
extension TextViewHelper {
    // MARK: initializeStyle
    final private func initializeStyle() {
        textColor = style.textColor.value
        backgroundColor = style.backgroundColor.value
        
        layer.borderColor = style.borderColor.value.cgColor
        layer.borderWidth = style.borderWidth
        layer.cornerRadius = style.corderRadius
        
        font = style.textFont.value
        textAlignment = style.textAlignment
        
        keyboardType = style.keyboardType
        isSecureTextEntry = style.isSecureTextEntry
        autocorrectionType = style.autocorrectionType
        spellCheckingType = style.spellCheckingType
        autocapitalizationType = style.autocapitalizationType
        
        isHidden = style.isHidden
        isUserInteractionEnabled = style.isUserInteractionEnabled
    }
}
