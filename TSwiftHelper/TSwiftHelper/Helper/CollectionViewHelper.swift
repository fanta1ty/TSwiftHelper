//
//  CollectionViewHelper.swift
//  TSwiftHelper
//
//  Created by User on 4/8/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public struct CollectionViewStyle {
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

public final class CollectionViewHelper: UICollectionView {
    private let helperStyle: CollectionViewStyle
    private let cellClasses: [AnyClass?]
    private let cellIdentifiers: [String]!
    
    public init(style: CollectionViewStyle, collectionViewLayout: UICollectionViewLayout, cellClasses: [AnyClass?], cellIdentifiers: [String], parent: UIView? = nil) {
        self.helperStyle = style
        self.cellClasses = cellClasses
        self.cellIdentifiers = cellIdentifiers
        
        super.init(frame: .zero, collectionViewLayout: collectionViewLayout)
        
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
extension CollectionViewHelper {
    // MARK: initializeStyle
    final private func initializeStyle() {
        backgroundColor = helperStyle.backgroundColor.value
        
        layer.borderColor = helperStyle.borderColor.value.cgColor
        layer.borderWidth = helperStyle.borderWidth
        layer.cornerRadius = helperStyle.corderRadius
        
        clipsToBounds = helperStyle.clipsToBounds
        
        isHidden = helperStyle.isHidden
        isUserInteractionEnabled = helperStyle.isUserInteractionEnabled
        
        for (index, cellClass) in cellClasses.enumerated() {
            register(cellClass, forCellWithReuseIdentifier: cellIdentifiers[index])
        }
    }
}
