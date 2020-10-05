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

public enum FontFamilyName: String, CaseIterable {
    case inter = "Inter"
    case niramit = "Niramit"
    case rta = "RTA"
}

public enum DefaultFontFamilyName: String {
    case copperplate = "Copperplate"
    case appleSDGothicNeo = "AppleSDGothicNeo"
    case thonburi = "Thonburi"
    case gillSans = "GillSans"
    case markerFelt = "MarkerFelt"
    case hiraMaruProN = "HiraMaruProN"
    case courierNewPS = "CourierNewPS"
    case kohinoorTelugu = "KohinoorTelugu"
    case avenirNextCondensed = "AvenirNextCondensed"
    case tamilSangamMN = "TamilSangamMN"
    case helveticaNeue = "HelveticaNeue"
    case timesNewRomanPS = "TimesNewRomanPS"
    case georgia = "Georgia"
    case sinhalaSangamMN = "SinhalaSangamMN"
    case arialRoundedMTBold = "ArialRoundedMTBold"
    case kailasa = "Kailasa"
    case kohinoorDevanagari = "KohinoorDevanagari"
    case kohinoorBangla = "KohinoorBangla"
    case notoSansOriya = "NotoSansOriya"
    case chalkboardSE = "ChalkboardSE"
    case notoSansKannada = "NotoSansKannada"
    case appleColorEmoji = "AppleColorEmoji"
    case pingFangTC = "PingFangTC"
    case geezaPro = "GeezaPro"
    case damascus = "Damascus"
    case noteworthy = "Noteworthy"
    case avenir = "Avenir"
    case kohinoorGujarati = "KohinoorGujarati"
    case diwanMishafi = "DiwanMishafi"
    case academyEngravedLetPlain = "AcademyEngravedLetPlain"
    case partyLetPlain = "PartyLetPlain"
    case futura = "Futura"
    case arialHebrew = "ArialHebrew"
    case farah = "Farah"
    case muktaMahee = "MuktaMahee"
    case notoSansMyanmar = "NotoSansMyanmar"
    case arial = "Arial"
    case chalkduster = "Chalkduster"
    case kefa = "Kefa"
    case hoeflerText = "HoeflerText"
    case optima = "Optima"
    case galvji = "Galvji"
    case palatino = "Palatino"
    case malayalamSangamMN = "MalayalamSangamMN"
    case alNile = "AlNile"
    case laoSangamMN = "LaoSangamMN"
    case bradleyHandITCTT = "BradleyHandITCTT"
    case hiraMinProN = "HiraMinProN"
    case pingFangHK = "PingFangHK"
    case helvetica = "Helvetica"
    case courier = "Courier"
    case cochin = "Cochin"
    case trebuchetMS = "TrebuchetMS"
    case devanagariSangamMN = "DevanagariSangamMN"
    case rockwell = "Rockwell"
    case snellRoundhand = "SnellRoundhand"
    case zapfDingbatsITC = "ZapfDingbatsITC"
    case bodoniSvtyTwoITCTT = "BodoniSvtyTwoITCTT"
    case verdana = "Verdana"
    case americanTypewriter = "AmericanTypewriter"
    case avenirNext = "AvenirNext"
    case baskerville = "Baskerville"
    case khmerSangamMN = "KhmerSangamMN"
    case didot = "Didot"
    case savoyeLetPlain = "SavoyeLetPlain"
    case bodoniOrnamentsITCTT = "BodoniOrnamentsITCTT"
    case symbol = "Symbol"
    case charter = "Charter"
    case menlo = "Menlo"
    case notoNastaliqUrdu = "NotoNastaliqUrdu"
    case bodoniSvtyTwoSCITCTT = "BodoniSvtyTwoSCITCTT"
    case dINAlternate = "DINAlternate"
    case papyrus = "Papyrus"
    case hiraginoSans = "HiraginoSans"
    case pingFangSC = "PingFangSC"
    case myanmarSangamMN = "MyanmarSangamMN"
    case appleSymbols = "AppleSymbols"
    case zapfino = "Zapfino"
    case bodoniSvtyTwoOSITCTT = "BodoniSvtyTwoOSITCTT"
    case euphemiaUCAS = "EuphemiaUCAS"
    case dinCondensed = "DINCondensed"
}

public enum FontType: String, CaseIterable {
    case bold = "-Bold"
    case boldItalic = "-BoldItalic"
    case extraLight = "-ExtraLight"
    case extraLightItalic = "-ExtraLightItalic"
    case italic = "-Italic"
    case light = "-Light"
    case ultraLight = "-UltraLight"
    case lightItalic = "-LightItalic"
    case medium = "-Medium"
    case mediumItalic = "-MediumItalic"
    case regular = "-Regular"
    case semiBold = "-SemiBold"
    case semiBoldItalic = "-SemiBoldItalic"
    case thin = "-Thin"
}

public enum DefinedFonts {
    // MARK: - Default Section
    // MARK: Bold
    case bold(size: Float)
    
    // MARK: Italic
    case italic(size: Float)
    
    // MARK: Regular
    case regular(size: Float)
    
    // MARK: - Copperplate Section
    // MARK: Bold
    case copperplateBold(size: Float)
    
    // MARK: Light
    case copperplateLight(size: Float)
    
    // MARK: Regular
    case copperplateRegular(size: Float)
    
    // MARK: - AppleSDGothicNeo Section
    // MARK: Thin
    case appleSDGothicNeoThin(size: Float)
    
    // MARK: Light
    case appleSDGothicNeoLight(size: Float)
    
    // MARK: Regular
    case appleSDGothicNeoRegular(size: Float)
    
    // MARK: Bold
    case appleSDGothicNeoBold(size: Float)
    
    // MARK: SemiBold
    case appleSDGothicNeoSemiBold(size: Float)
    
    // MARK: UltraLight
    case appleSDGothicNeoSemiUltraLight(size: Float)
    
    // MARK: Medium
    case appleSDGothicNeoMedium(size: Float)
    
    // MARK: - Inter Section
    // MARK: Bold
    case InterBold(size: Float)
    
    // MARK: BoldItalic
    case InterBoldItalic(size: Float)
    
    // MARK: SemiBold
    case InterSemiBold(size: Float)
    
    // MARK: SemiBoldItalic
    case InterSemiBoldItalic(size: Float)
    
    // MARK: ExtraLight
    case InterExtraLight(size: Float)
    
    // MARK: ExtraLightItalic
    case InterExtraLightItalic(size: Float)
    
    // MARK: Light
    case InterLight(size: Float)
    
    // MARK: LightItalic
    case InterLightItalic(size: Float)
    
    // MARK: Medium
    case InterMedium(size: Float)
    
    // MARK: MediumItalic
    case InterMediumItalic(size: Float)
    
    // MARK: Regular
    case InterRegular(size: Float)
    
    // MARK: Italic
    case InterItalic(size: Float)
    
    // MARK: - Niramit Section
    // MARK: Bold
    case NiramitBold(size: Float)
    
    // MARK: BoldItalic
    case NiramitBoldItalic(size: Float)
    
    // MARK: SemiBold
    case NiramitSemiBold(size: Float)
    
    // MARK: SemiBoldItalic
    case NiramitSemiBoldItalic(size: Float)
    
    // MARK: ExtraLight
    case NiramitExtraLight(size: Float)
    
    // MARK: ExtraLightItalic
    case NiramitExtraLightItalic(size: Float)
    
    // MARK: Light
    case NiramitLight(size: Float)
    
    // MARK: LightItalic
    case NiramitLightItalic(size: Float)
    
    // MARK: Medium
    case NiramitMedium(size: Float)
    
    // MARK: MediumItalic
    case NiramitMediumItalic(size: Float)
    
    // MARK: Regular
    case NiramitRegular(size: Float)
    
    // MARK: Italic
    case NiramitItalic(size: Float)
    
    // MARK: - RTA Section
    // MARK: Bold
    case RTABold(size: Float)
    
    // MARK: Light
    case RTALight(size: Float)
    
    // MARK: Regular
    case RTARegular(size: Float)
}

public extension DefinedFonts {
    var value: UIFont? {
        switch self {
        // MARK: - Default Section
        case .bold(let size):
            return UIFont.boldSystemFont(ofSize: CGFloat(size))
        
        case .italic(let size):
            return UIFont.italicSystemFont(ofSize: CGFloat(size))
            
        case .regular(let size):
            return UIFont.systemFont(ofSize: CGFloat(size))
        
        // MARK: - Copperplate Section
        case .copperplateBold(let size):
            return UIFont(name: DefaultFontFamilyName.copperplate.rawValue + FontType.bold.rawValue, size: CGFloat(size))
            
        case .copperplateLight(let size):
            return UIFont(name: DefaultFontFamilyName.copperplate.rawValue + FontType.light.rawValue, size: CGFloat(size))
            
        case .copperplateRegular(let size):
            return UIFont(name: DefaultFontFamilyName.copperplate.rawValue, size: CGFloat(size))
            
        // MARK: AppleSDGothicNeo
        case .appleSDGothicNeoThin(let size):
            return UIFont(name: DefaultFontFamilyName.appleSDGothicNeo.rawValue + FontType.thin.rawValue, size: CGFloat(size))
            
        case .appleSDGothicNeoLight(let size):
            return UIFont(name: DefaultFontFamilyName.appleSDGothicNeo.rawValue + FontType.light.rawValue, size: CGFloat(size))
            
        case .appleSDGothicNeoRegular(let size):
            return UIFont(name: DefaultFontFamilyName.appleSDGothicNeo.rawValue + FontType.regular.rawValue, size: CGFloat(size))
            
        case .appleSDGothicNeoBold(let size):
            return UIFont(name: DefaultFontFamilyName.appleSDGothicNeo.rawValue + FontType.bold.rawValue, size: CGFloat(size))
            
        case .appleSDGothicNeoSemiBold(let size):
            return UIFont(name: DefaultFontFamilyName.appleSDGothicNeo.rawValue + FontType.semiBold.rawValue, size: CGFloat(size))
            
        case .appleSDGothicNeoSemiUltraLight(let size):
            return UIFont(name: DefaultFontFamilyName.appleSDGothicNeo.rawValue + FontType.ultraLight.rawValue, size: CGFloat(size))
            
        case .appleSDGothicNeoMedium(let size):
            return UIFont(name: DefaultFontFamilyName.appleSDGothicNeo.rawValue + FontType.medium.rawValue, size: CGFloat(size))
            
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
            
        // MARK: - RTA Section
        case .RTABold(let size):
            return UIFont(name: FontFamilyName.rta.rawValue + FontType.bold.rawValue, size: CGFloat(size))
            
        case .RTALight(let size):
            return UIFont(name: FontFamilyName.rta.rawValue + FontType.light.rawValue, size: CGFloat(size))
            
        case .RTARegular(let size):
            return UIFont(name: FontFamilyName.rta.rawValue + FontType.regular.rawValue, size: CGFloat(size))
        }
    }
}
