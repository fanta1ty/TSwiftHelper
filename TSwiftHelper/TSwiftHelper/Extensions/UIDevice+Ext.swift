//
//  UIDevice+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public enum Model: String {
    /// Simulator
    case simulator = "simulator/sandbox",
    
    /// iPod
    iPod1              = "iPod 1",
    iPod2              = "iPod 2",
    iPod3              = "iPod 3",
    iPod4              = "iPod 4",
    iPod5              = "iPod 5",

    /// iPad
    iPad2              = "iPad 2",
    iPad3              = "iPad 3",
    iPad4              = "iPad 4",
    iPadAir            = "iPad Air ",
    iPadAir2           = "iPad Air 2",
    iPadAir3           = "iPad Air 3",
    iPad5              = "iPad 2017",
    iPad6              = "iPad 2018",

    /// iPad Mini
    iPadMini           = "iPad Mini",
    iPadMini2          = "iPad Mini 2",
    iPadMini3          = "iPad Mini 3",
    iPadMini4          = "iPad Mini 4",
    iPadMini5          = "iPad Mini 5",

    /// iPad Pro
    iPadPro9_7         = "iPad Pro 9.7\"",
    iPadPro10_5        = "iPad Pro 10.5\"",
    iPadPro11          = "iPad Pro 11\"",
    iPadPro12_9        = "iPad Pro 12.9\"",
    iPadPro2_12_9      = "iPad Pro 2 12.9\"",
    iPadPro3_12_9      = "iPad Pro 3 12.9\"",

    /// iPhone
    iPhone4            = "iPhone 4",
    iPhone4S           = "iPhone 4S",
    iPhone5            = "iPhone 5",
    iPhone5S           = "iPhone 5S",
    iPhone5C           = "iPhone 5C",
    iPhone6            = "iPhone 6",
    iPhone6Plus        = "iPhone 6 Plus",
    iPhone6S           = "iPhone 6S",
    iPhone6SPlus       = "iPhone 6S Plus",
    iPhoneSE           = "iPhone SE",
    iPhone7            = "iPhone 7",
    iPhone7Plus        = "iPhone 7 Plus",
    iPhone8            = "iPhone 8",
    iPhone8Plus        = "iPhone 8 Plus",
    iPhoneX            = "iPhone X",
    iPhoneXS           = "iPhone XS",
    iPhoneXSMax        = "iPhone XS Max",
    iPhoneXR           = "iPhone XR",
    iPhone11           = "iPhone 11",
    iPhone11Pro        = "iPhone 11 Pro",
    iPhone11ProMax     = "iPhone 11 Pro Max",

    //Apple TV
    AppleTV            = "Apple TV",
    AppleTV_4K         = "Apple TV 4K",
    unrecognized       = "?unrecognized?"
}

public extension UIDevice {
    var type: Model {
    var systemInfo = utsname()
    uname(&systemInfo)
    let modelCode = withUnsafePointer(to: &systemInfo.machine) {
        $0.withMemoryRebound(to: CChar.self, capacity: 1) {
            ptr in String.init(validatingUTF8: ptr)
        }
    }

    let modelMap : [String: Model] = [

        /// Simulator
        "i386"      : .simulator,
        "x86_64"    : .simulator,

        /// iPod
        "iPod1,1"   : .iPod1,
        "iPod2,1"   : .iPod2,
        "iPod3,1"   : .iPod3,
        "iPod4,1"   : .iPod4,
        "iPod5,1"   : .iPod5,

        /// iPad
        "iPad2,1"   : .iPad2,
        "iPad2,2"   : .iPad2,
        "iPad2,3"   : .iPad2,
        "iPad2,4"   : .iPad2,
        "iPad3,1"   : .iPad3,
        "iPad3,2"   : .iPad3,
        "iPad3,3"   : .iPad3,
        "iPad3,4"   : .iPad4,
        "iPad3,5"   : .iPad4,
        "iPad3,6"   : .iPad4,
        "iPad4,1"   : .iPadAir,
        "iPad4,2"   : .iPadAir,
        "iPad4,3"   : .iPadAir,
        "iPad5,3"   : .iPadAir2,
        "iPad5,4"   : .iPadAir2,
        "iPad6,11"  : .iPad5, /// iPad 2017
        "iPad6,12"  : .iPad5,
        "iPad7,5"   : .iPad6, /// iPad 2018
        "iPad7,6"   : .iPad6,

        /// iPad Mini
        "iPad2,5"   : .iPadMini,
        "iPad2,6"   : .iPadMini,
        "iPad2,7"   : .iPadMini,
        "iPad4,4"   : .iPadMini2,
        "iPad4,5"   : .iPadMini2,
        "iPad4,6"   : .iPadMini2,
        "iPad4,7"   : .iPadMini3,
        "iPad4,8"   : .iPadMini3,
        "iPad4,9"   : .iPadMini3,
        "iPad5,1"   : .iPadMini4,
        "iPad5,2"   : .iPadMini4,
        "iPad11,1"  : .iPadMini5,
        "iPad11,2"  : .iPadMini5,

        /// iPad Pro
        "iPad6,3"   : .iPadPro9_7,
        "iPad6,4"   : .iPadPro9_7,
        "iPad7,3"   : .iPadPro10_5,
        "iPad7,4"   : .iPadPro10_5,
        "iPad6,7"   : .iPadPro12_9,
        "iPad6,8"   : .iPadPro12_9,
        "iPad7,1"   : .iPadPro2_12_9,
        "iPad7,2"   : .iPadPro2_12_9,
        "iPad8,1"   : .iPadPro11,
        "iPad8,2"   : .iPadPro11,
        "iPad8,3"   : .iPadPro11,
        "iPad8,4"   : .iPadPro11,
        "iPad8,5"   : .iPadPro3_12_9,
        "iPad8,6"   : .iPadPro3_12_9,
        "iPad8,7"   : .iPadPro3_12_9,
        "iPad8,8"   : .iPadPro3_12_9,

        /// iPad Air
        "iPad11,3"  : .iPadAir3,
        "iPad11,4"  : .iPadAir3,

        /// iPhone
        "iPhone3,1" : .iPhone4,
        "iPhone3,2" : .iPhone4,
        "iPhone3,3" : .iPhone4,
        "iPhone4,1" : .iPhone4S,
        "iPhone5,1" : .iPhone5,
        "iPhone5,2" : .iPhone5,
        "iPhone5,3" : .iPhone5C,
        "iPhone5,4" : .iPhone5C,
        "iPhone6,1" : .iPhone5S,
        "iPhone6,2" : .iPhone5S,
        "iPhone7,1" : .iPhone6Plus,
        "iPhone7,2" : .iPhone6,
        "iPhone8,1" : .iPhone6S,
        "iPhone8,2" : .iPhone6SPlus,
        "iPhone8,4" : .iPhoneSE,
        "iPhone9,1" : .iPhone7,
        "iPhone9,3" : .iPhone7,
        "iPhone9,2" : .iPhone7Plus,
        "iPhone9,4" : .iPhone7Plus,
        "iPhone10,1" : .iPhone8,
        "iPhone10,4" : .iPhone8,
        "iPhone10,2" : .iPhone8Plus,
        "iPhone10,5" : .iPhone8Plus,
        "iPhone10,3" : .iPhoneX,
        "iPhone10,6" : .iPhoneX,
        "iPhone11,2" : .iPhoneXS,
        "iPhone11,4" : .iPhoneXSMax,
        "iPhone11,6" : .iPhoneXSMax,
        "iPhone11,8" : .iPhoneXR,
        "iPhone12,1" : .iPhone11,
        "iPhone12,3" : .iPhone11Pro,
        "iPhone12,5" : .iPhone11ProMax,

        //Apple TV
        "AppleTV5,3" : .AppleTV,
        "AppleTV6,2" : .AppleTV_4K
        ]
        
        if let model = modelMap[String.init(validatingUTF8: modelCode!)!] {
            if model == .simulator {
                if let simModelCode = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                    if let simModel = modelMap[String.init(validatingUTF8: simModelCode)!] {
                        return simModel
                    }
                }
            }
            return model
        }
        return Model.unrecognized
    }
    
    class func idForVendor() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }

    /// EZSwiftExtensions - Operating system name
    class func systemName() -> String {
        return UIDevice.current.systemName
    }

    /// EZSwiftExtensions - Operating system version
    class func systemVersion() -> String {
        return UIDevice.current.systemVersion
    }

    /// EZSwiftExtensions - Operating system version
    class func systemFloatVersion() -> Float {
        return (systemVersion() as NSString).floatValue
    }

    /// EZSwiftExtensions
    class func deviceName() -> String {
        return UIDevice.current.name
    }

    /// EZSwiftExtensions
    class func deviceLanguage() -> String {
        return Bundle.main.preferredLocalizations[0]
    }

    /// EZSE: Returns true if the device is iPhone //TODO: Add to readme
    class func isPhone() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }

    /// EZSE: Returns true if the device is iPad //TODO: Add to readme
    class func isPad() -> Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }

    /// EZSwiftExtensions
    class func deviceModel() -> String {
        var systemInfo = utsname()
        uname(&systemInfo)

        let machine = systemInfo.machine
        var identifier = ""
        let mirror = Mirror(reflecting: machine)

        for child in mirror.children {
            let value = child.value

            if let value = value as? Int8, value != 0 {
                identifier.append(String(UnicodeScalar(UInt8(value))))
            }
        }

        return identifier
    }

    //TODO: Fix syntax, add docs and readme for these methods:
    //TODO: Delete isSystemVersionOver()
    // MARK: - Device Version Checks

    enum Versions: Float {
        case five = 5.0
        case six = 6.0
        case seven = 7.0
        case eight = 8.0
        case nine = 9.0
        case ten = 10.0
        case eleven = 11.0
        case twelve = 12.0
    }

    class func isVersion(_ version: Versions) -> Bool {
        return systemFloatVersion() >= version.rawValue && systemFloatVersion() < (version.rawValue + 1.0)
    }

    class func isVersionOrLater(_ version: Versions) -> Bool {
        return systemFloatVersion() >= version.rawValue
    }

    class func isVersionOrEarlier(_ version: Versions) -> Bool {
        return systemFloatVersion() < (version.rawValue + 1.0)
    }

    class var CURRENT_VERSION: String {
        return "\(systemFloatVersion())"
    }

    // MARK: iOS 5 Checks

    class func IS_OS_5() -> Bool {
        return isVersion(.five)
    }

    class func IS_OS_5_OR_LATER() -> Bool {
        return isVersionOrLater(.five)
    }

    class func IS_OS_5_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.five)
    }

    // MARK: iOS 6 Checks

    class func IS_OS_6() -> Bool {
        return isVersion(.six)
    }

    class func IS_OS_6_OR_LATER() -> Bool {
        return isVersionOrLater(.six)
    }

    class func IS_OS_6_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.six)
    }

    // MARK: iOS 7 Checks

    class func IS_OS_7() -> Bool {
        return isVersion(.seven)
    }

    class func IS_OS_7_OR_LATER() -> Bool {
        return isVersionOrLater(.seven)
    }

    class func IS_OS_7_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.seven)
    }

    // MARK: iOS 8 Checks

    class func IS_OS_8() -> Bool {
        return isVersion(.eight)
    }

    class func IS_OS_8_OR_LATER() -> Bool {
        return isVersionOrLater(.eight)
    }

    class func IS_OS_8_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.eight)
    }

    // MARK: iOS 9 Checks

    class func IS_OS_9() -> Bool {
        return isVersion(.nine)
    }

    class func IS_OS_9_OR_LATER() -> Bool {
        return isVersionOrLater(.nine)
    }

    class func IS_OS_9_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.nine)
    }

    // MARK: iOS 10 Checks

    class func IS_OS_10() -> Bool {
        return isVersion(.ten)
    }

    class func IS_OS_10_OR_LATER() -> Bool {
        return isVersionOrLater(.ten)
    }

    class func IS_OS_10_OR_EARLIER() -> Bool {
        return isVersionOrEarlier(.ten)
    }

    /// EZSwiftExtensions
    class func isSystemVersionOver(_ requiredVersion: String) -> Bool {
        switch systemVersion().compare(requiredVersion, options: NSString.CompareOptions.numeric) {
        case .orderedSame, .orderedDescending:
            //println("iOS >= 8.0")
            return true
        case .orderedAscending:
            //println("iOS < 8.0")
            return false
        }
    }
}
