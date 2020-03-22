//
//  ImageViewHelper.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

struct ImageViewStyle {
    let backgroundColor: DefinedColors!
    let borderColor: DefinedColors!
    
    let borderWidth: CGFloat
    let corderRadius: CGFloat
    
    let contentMode: UIView.ContentMode
    let clipsToBounds: Bool
    let isHidden: Bool
    
    init(backgroundColor: DefinedColors = .Clear,
         borderColor: DefinedColors = .Clear,
         borderWidth: CGFloat = 0,
         corderRadius: CGFloat = 0,
         contentMode: UIView.ContentMode = UIView.ContentMode.scaleAspectFill,
         clipsToBounds: Bool = true, isHidden: Bool = false) {
        
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.corderRadius = corderRadius
        self.contentMode = contentMode
        self.clipsToBounds = clipsToBounds
        self.isHidden = isHidden
    }
}

final class ImageViewHelper: UIImageView {
    private let style: ImageViewStyle
    
    init(style: ImageViewStyle,
         iconImage: UIImage? = nil,
         parent: UIView? = nil) {
        
        self.style = style
        super.init(frame: .zero)
        
        image = iconImage
        
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
extension ImageViewHelper {
    // MARK: initializeStyle
    final private func initializeStyle() {
        backgroundColor = style.backgroundColor.value
        
        layer.borderColor = style.borderColor.value.cgColor
        layer.borderWidth = style.borderWidth
        layer.cornerRadius = style.corderRadius
        
        contentMode = style.contentMode
        clipsToBounds = style.clipsToBounds
        isHidden = style.isHidden
    }
}
