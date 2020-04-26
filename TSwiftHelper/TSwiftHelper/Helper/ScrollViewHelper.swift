//
//  ScrollViewHelper.swift
//  TSwiftHelper
//
//  Created by User on 4/26/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public struct ScrollViewStyle {
    let backgroundColor: DefinedColors!
    let borderColor: DefinedColors!
    
    let borderWidth: CGFloat
    let corderRadius: CGFloat
    let clipsToBounds: Bool
    
    let isHidden: Bool
    let isUserInteractionEnabled: Bool
    
    public init(backgroundColor: DefinedColors = .Clear, borderColor: DefinedColors = .Clear, borderWidth: CGFloat = 0, corderRadius: CGFloat = 0, clipsToBounds: Bool = true, isHidden: Bool = false, isUserInteractionEnabled: Bool = true) {
        
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.corderRadius = corderRadius
        self.clipsToBounds = clipsToBounds
        self.isHidden = isHidden
        self.isUserInteractionEnabled = isUserInteractionEnabled
    }
}

public final class ScrollViewHelper: UIScrollView {
    private let helperStyle: ScrollViewStyle
    
    public init(style: ScrollViewStyle, parent: UIView? = nil) {
        self.helperStyle = style
        
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

// MARK: - Public Functions
extension ScrollViewHelper {
    
}

// MARK: - Private Functions
extension ScrollViewHelper {
    // MARK: initializeStyle
    final private func initializeStyle() {
        backgroundColor = helperStyle.backgroundColor.value
        
        layer.borderColor = helperStyle.borderColor.value.cgColor
        layer.borderWidth = helperStyle.borderWidth
        layer.cornerRadius = helperStyle.corderRadius
        
        clipsToBounds = helperStyle.clipsToBounds
        
        isHidden = helperStyle.isHidden
        isUserInteractionEnabled = helperStyle.isUserInteractionEnabled
    }
}
