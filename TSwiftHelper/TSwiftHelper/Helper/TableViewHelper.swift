//
//  TableViewHelper.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

struct TableViewStyle {
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

final class TableViewHelper: UITableView {
    private let helperStyle: TableViewStyle
    private let cellClasses: [AnyClass?]
    private let cellIdentifiers: [String]!
    
    init(style: TableViewStyle, parent: UIView? = nil, cellStyle: UITableView.Style = .grouped, cellClasses: [AnyClass?], cellIdentifiers: [String]) {
        self.helperStyle = style
        self.cellClasses = cellClasses
        self.cellIdentifiers = cellIdentifiers
        
        super.init(frame: .zero, style: cellStyle)
        
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
extension TableViewHelper {
    // MARK: initializeStyle
    final private func initializeStyle() {
        backgroundColor = helperStyle.backgroundColor.value
        
        layer.borderColor = helperStyle.borderColor.value.cgColor
        layer.borderWidth = helperStyle.borderWidth
        layer.cornerRadius = helperStyle.corderRadius
        
        clipsToBounds = helperStyle.clipsToBounds
        
        isHidden = helperStyle.isHidden
        isUserInteractionEnabled = helperStyle.isUserInteractionEnabled
        
        separatorStyle = .none
        
        for (index, cellClass) in cellClasses.enumerated() {
            register(cellClass, forCellReuseIdentifier: cellIdentifiers[index])
        }
    }
}
