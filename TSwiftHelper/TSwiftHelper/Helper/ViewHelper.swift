//
//  ViewHelper.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

struct ViewStyle {
    let backgroundColor: DefinedColors!
    let borderColor: DefinedColors!
    
    let borderWidth: CGFloat
    let corderRadius: CGFloat
    let clipsToBounds: Bool
    
    let isHidden: Bool
    let isUserInteractionEnabled: Bool
    
    init(backgroundColor: DefinedColors = .Clear, borderColor: DefinedColors = .Clear, borderWidth: CGFloat = 0, corderRadius: CGFloat = 0, clipsToBounds: Bool = true, isHidden: Bool = false, isUserInteractionEnabled: Bool = true) {
        
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.corderRadius = corderRadius
        self.clipsToBounds = clipsToBounds
        self.isHidden = isHidden
        self.isUserInteractionEnabled = isUserInteractionEnabled
    }
}

final class ViewHelper: UIView {
    private let style: ViewStyle
    
    init(style: ViewStyle, parent: UIView? = nil) {
        self.style = style
        super.init(frame: .zero)
        
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
extension ViewHelper {
    // MARK: initializeStyle
    final private func initializeStyle() {
        backgroundColor = style.backgroundColor.value
        
        layer.borderColor = style.borderColor.value.cgColor
        layer.borderWidth = style.borderWidth
        layer.cornerRadius = style.corderRadius
        
        clipsToBounds = style.clipsToBounds
        
        isHidden = style.isHidden
        isUserInteractionEnabled = style.isUserInteractionEnabled
    }
}
