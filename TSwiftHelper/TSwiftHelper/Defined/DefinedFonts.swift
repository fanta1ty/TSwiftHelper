//
//  DefinedFonts.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

enum FontFamilyName: String {
    case inter = "Inter"
    case niramit = "Niramit"
}

enum FontType: String {
    case bold = "-Bold"
    case boldItalic = "-BoldItalic"
    case extraLight = "-ExtraLight"
    case extraLightItalic = "-ExtraLightItalic"
    case italic = "-Italic"
    case light = "-Light"
    case lightItalic = "-LightItalic"
    case medium = "-Medium"
    case mediumItalic = "-MediumItalic"
    case regular = "-Regular"
    case semiBold = "-SemiBold"
    case semiBoldItalic = "-SemiBoldItalic"
}

enum DefinedFonts {
    // MARK: - Inter Section
    // MARK: Bold
    case InterBold(size: Float)
    case InterBoldItalic(size: Float)
    case NiramitBold(size: Float)
    case NiramitBoldItalic(size: Float)
    
    // MARK: Semi
    case InterSemiBold(size: Float)
    case InterSemiBoldItalic(size: Float)
    case NiramitSemiBold(size: Float)
    case NiramitSemiBoldItalic(size: Float)
    
    // MARK: Italic
    case InterExtraLight(size: Float)
    case InterExtraLightItalic(size: Float)
    case NiramitExtraLight(size: Float)
    case NiramitExtraLightItalic(size: Float)
    
    // MARK: Light
    case InterLight(size: Float)
    case InterLightItalic(size: Float)
    case NiramitLight(size: Float)
    case NiramitLightItalic(size: Float)
    
    // MARK: Medium
    case InterMedium(size: Float)
    case InterMediumItalic(size: Float)
    case NiramitMedium(size: Float)
    case NiramitMediumItalic(size: Float)
    
    // MARK: Regular
    case InterRegular(size: Float)
    case InterItalic(size: Float)
    case NiramitRegular(size: Float)
    case NiramitItalic(size: Float)
}

extension DefinedFonts {
    var value: UIFont? {
        switch self {
        // MARK: - Inter Section
        case .InterBold(let size):
            return UIFont(name: FontFamilyName.inter.rawValue + FontType.bold.rawValue, size: CGFloat(size))
            
        case .InterBoldItalic(let size):
            return UIFont(name: FontFamilyName.inter.rawValue + FontType.boldItalic.rawValue, size: CGFloat(size))
            
        case .InterExtraLight(let size):
            return UIFont(name: FontFamilyName.inter.rawValue + FontType.extraLight.rawValue, size: CGFloat(size))
            
        case .InterExtraLightItalic(let size):
            return UIFont(name: FontFamilyName.inter.rawValue + FontType.extraLightItalic.rawValue, size: CGFloat(size))
            
        case .InterItalic(let size):
            return UIFont(name: FontFamilyName.inter.rawValue + FontType.italic.rawValue, size: CGFloat(size))
            
        case .InterLight(let size):
            return UIFont(name: FontFamilyName.inter.rawValue + FontType.light.rawValue, size: CGFloat(size))
            
        case .InterLightItalic(let size):
            return UIFont(name: FontFamilyName.inter.rawValue + FontType.lightItalic.rawValue, size: CGFloat(size))
            
        case .InterMedium(let size):
            return UIFont(name: FontFamilyName.inter.rawValue + FontType.medium.rawValue, size: CGFloat(size))
            
        case .InterMediumItalic(let size):
            return UIFont(name: FontFamilyName.inter.rawValue + FontType.mediumItalic.rawValue, size: CGFloat(size))
            
        case .InterRegular(let size):
            return UIFont(name: FontFamilyName.inter.rawValue + FontType.regular.rawValue, size: CGFloat(size))
            
        case .InterSemiBold(let size):
            return UIFont(name: FontFamilyName.inter.rawValue + FontType.semiBold.rawValue, size: CGFloat(size))
            
        case .InterSemiBoldItalic(let size):
            return UIFont(name: FontFamilyName.inter.rawValue + FontType.semiBoldItalic.rawValue, size: CGFloat(size))
            
        // MARK: - Niramit Section
        case .NiramitBold(let size):
            return UIFont(name: FontFamilyName.niramit.rawValue + FontType.bold.rawValue, size: CGFloat(size))
            
        case .NiramitBoldItalic(let size):
            return UIFont(name: FontFamilyName.niramit.rawValue + FontType.boldItalic.rawValue, size: CGFloat(size))
            
        case .NiramitExtraLight(let size):
            return UIFont(name: FontFamilyName.niramit.rawValue + FontType.extraLight.rawValue, size: CGFloat(size))
            
        case .NiramitExtraLightItalic(let size):
            return UIFont(name: FontFamilyName.niramit.rawValue + FontType.extraLightItalic.rawValue, size: CGFloat(size))
            
        case .NiramitItalic(let size):
            return UIFont(name: FontFamilyName.niramit.rawValue + FontType.italic.rawValue, size: CGFloat(size))
            
        case .NiramitLight(let size):
            return UIFont(name: FontFamilyName.niramit.rawValue + FontType.light.rawValue, size: CGFloat(size))
            
        case .NiramitLightItalic(let size):
            return UIFont(name: FontFamilyName.niramit.rawValue + FontType.lightItalic.rawValue, size: CGFloat(size))
            
        case .NiramitMedium(let size):
            return UIFont(name: FontFamilyName.niramit.rawValue + FontType.medium.rawValue, size: CGFloat(size))
            
        case .NiramitMediumItalic(let size):
            return UIFont(name: FontFamilyName.niramit.rawValue + FontType.mediumItalic.rawValue, size: CGFloat(size))
            
        case .NiramitRegular(let size):
            return UIFont(name: FontFamilyName.niramit.rawValue + FontType.regular.rawValue, size: CGFloat(size))
            
        case .NiramitSemiBold(let size):
            return UIFont(name: FontFamilyName.niramit.rawValue + FontType.semiBold.rawValue, size: CGFloat(size))
            
        case .NiramitSemiBoldItalic(let size):
            return UIFont(name: FontFamilyName.niramit.rawValue + FontType.semiBoldItalic.rawValue, size: CGFloat(size))
        }
    }
}
