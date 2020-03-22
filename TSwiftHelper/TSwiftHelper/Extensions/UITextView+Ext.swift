//
//  UITextView+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

extension UITextView {

    /// : Automatically sets these values: backgroundColor = clearColor, textColor = ThemeNicknameColor, clipsToBounds = true,
    /// textAlignment = Left, userInteractionEnabled = true, editable = false, scrollEnabled = false, font = ThemeFontName
    #if os(iOS)

    // MARK: Automatically adds a toolbar with a done button to the top of the keyboard. Tapping the button will dismiss the keyboard.
    public func addDoneButton(_ barStyle: UIBarStyle = .default, title: String? = nil) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: title ?? "Done", style: .done, target: self, action: #selector(resignFirstResponder))
        ]

        keyboardToolbar.barStyle = barStyle
        keyboardToolbar.sizeToFit()

        inputAccessoryView = keyboardToolbar
    }

    #endif
}
