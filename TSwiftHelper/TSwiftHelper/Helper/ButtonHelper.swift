//
//  ButtonHelper.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

struct ButtonStyle {
    let backgroundColor: DefinedColors!
    let borderColor: DefinedColors!
    
    let textColor: DefinedColors!
    let textFont: DefinedFonts!
    
    let borderWidth: CGFloat
    let corderRadius: CGFloat
    
    let clipsToBounds: Bool
    let isHidden: Bool
    let isUserInteractionEnabled: Bool
    
    init(backgroundColor: DefinedColors = .Clear, borderColor: DefinedColors = .Clear, borderWidth: CGFloat = 0, corderRadius: CGFloat = 0, textColor: DefinedColors = .Black, textFont: DefinedFonts = .InterRegular(size: 14), clipsToBounds: Bool = true, isHidden: Bool = false, isUserInteractionEnabled: Bool = true) {
        
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.corderRadius = corderRadius
        self.textColor = textColor
        self.textFont = textFont
        self.clipsToBounds = clipsToBounds
        self.isHidden = isHidden
        self.isUserInteractionEnabled = isUserInteractionEnabled
    }
}

// MARK: - Static Functions
extension ButtonStyle {
    // MARK: regularDefaultFontSize
    static func regularDefaultFontSize() -> ButtonStyle {
        return ButtonStyle(textFont: .InterRegular(size: 12))
    }
    
    // MARK: boldDefaultFontSize
    static func boldDefaultFontSize() -> ButtonStyle {
        return ButtonStyle(textFont: .InterBold(size: 12))
    }
    
    // MARK: regularFontSize
    static func regularFontSize(size: Float) -> ButtonStyle {
        return ButtonStyle(textFont: .InterRegular(size: size))
    }
    
    // MARK: boldFontSize
    static func boldFontSize(size: Float) -> ButtonStyle {
        return ButtonStyle(textFont: .InterBold(size: size))
    }
}

final class ButtonHelper: UIButton {
    private let style: ButtonStyle
    
    init(style: ButtonStyle,
         title: String? = nil,
         normalImage: UIImage? = nil,
         selectedImage: UIImage? = nil,
         parent: UIView? = nil) {
        
        self.style = style
        super.init(frame: .zero)
        
        setImage(normalImage, for: .normal)
        setImage(selectedImage, for: .selected)
        
        setTitle(title, for: .normal)
        
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
extension ButtonHelper {
    // MARK: initializeStyle
    final private func initializeStyle() {
        setTitleColor(style.textColor.value, for: .normal)
        backgroundColor = style.backgroundColor.value
        
        layer.borderColor = style.borderColor.value.cgColor
        layer.borderWidth = style.borderWidth
        layer.cornerRadius = style.corderRadius
        
        titleLabel?.font = style.textFont.value
        clipsToBounds = style.clipsToBounds
        
        isHidden = style.isHidden
        isUserInteractionEnabled = style.isUserInteractionEnabled
    }
}
