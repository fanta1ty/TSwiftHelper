//
//  UIHelper.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public enum DateTimeFormat: String {
    case dateTime24Long = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case dateTime12Long = "yyyy-MM-dd'T'hh:mm:ss.SSSZ"
    
    case dateTime24VietnameseLong = "HH:mm - dd 'thg' M, yyyy"
    case dateTime12VietnameseLong = "hh:mm a - dd 'thg' M, yyyy"
    
    case fullDate = "yyyy-MM-dd"
}

public final class UIHelper {
    // MARK: convertDateString
    public static func convertDateString(dateStr: String) -> String {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime24Long.rawValue
        let date24 = dateFormatter.date(from: currentDateStr)
        
        if let date24 = date24 {
            dateFormatter.dateFormat = DateTimeFormat.dateTime24VietnameseLong.rawValue
            return dateFormatter.string(from: date24)
        }
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime12Long.rawValue
        let date12 = dateFormatter.date(from: currentDateStr)
        
        if let date12 = date12 {
            dateFormatter.dateFormat = DateTimeFormat.dateTime12VietnameseLong.rawValue
            return dateFormatter.string(from: date12)
        }
        
        return ""
    }
    
    // MARK: convertDateString
    public static func convertDateString(dateStr: String, dateFormat: String) -> String {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime24Long.rawValue
        let date24 = dateFormatter.date(from: currentDateStr)
        
        if let date24 = date24 {
            dateFormatter.dateFormat = dateFormat
            return dateFormatter.string(from: date24)
        }
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime12Long.rawValue
        let date12 = dateFormatter.date(from: currentDateStr)
        
        if let date12 = date12 {
            dateFormatter.dateFormat = dateFormat
            return dateFormatter.string(from: date12)
        }
        
        return ""
    }
    
    // MARK: changeDateFormat
    public static func changeDateFormat(dateStr: String, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateTimeFormat.fullDate.rawValue
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        let date = dateFormatter.date(from: dateStr)
        
        if let date = date {
            dateFormatter.dateFormat = dateFormat
            return dateFormatter.string(from: date)
        } else {
            return "--"
        }
    }
    
    public static func convertUTCDateStr(dateStr: String) -> Date? {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime24Long.rawValue
        let date24 = dateFormatter.date(from: currentDateStr)
        
        if let date24 = date24 {
            return date24
        }
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime12Long.rawValue
        let date12 = dateFormatter.date(from: currentDateStr)
        
        if let date12 = date12 {
            return date12
        }
        
        return nil
    }
    
    // MARK: timePassed
    public static func timePassed(dateStr: String) -> String {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime24Long.rawValue
        let date24 = dateFormatter.date(from: currentDateStr)
        
        if let date24 = date24 {
            return  date24.timePassed()
        }
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime12Long.rawValue
        let date12 = dateFormatter.date(from: currentDateStr)
        
        if let date12 = date12 {
            return  date12.timePassed()
        }
        
        return ""
    }
    
    // MARK: minutesInBetweenDate
    public static func hoursInBetweenDate(dateStr: String) -> String {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime24Long.rawValue
        let date24 = dateFormatter.date(from: currentDateStr)
        if let date24 = date24 {
            return  Date().hoursInBetweenDate(date24).toInt.toString
        }
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime12Long.rawValue
        let date12 = dateFormatter.date(from: currentDateStr)
        if let date12 = date12 {
            return  Date().hoursInBetweenDate(date12).toInt.toString
        }
        
        return ""
    }
    
    // MARK: UTCToLocal
    public static func UTCToLocal(dateStr: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime24Long.rawValue
        let date24 = dateFormatter.date(from: dateStr)
        if let date24 = date24 {
            // 24 hours format
            dateFormatter.timeZone = .current
            dateFormatter.dateFormat = DateTimeFormat.dateTime24Long.rawValue

            return dateFormatter.string(from: date24)
        }
        
        // 12 hours format
        dateFormatter.dateFormat = DateTimeFormat.dateTime12Long.rawValue
        let date12 = dateFormatter.date(from: dateStr)
        if let date12 = date12 {
            // 24 hours format
            dateFormatter.timeZone = .current
            dateFormatter.dateFormat = DateTimeFormat.dateTime12Long.rawValue

            return dateFormatter.string(from: date12)
        }
        
        return ""
    }
    
    // MARK: sinceDate
    public static func sinceDate(dateStr: String) -> String {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime24Long.rawValue
        let date24 = dateFormatter.date(from: currentDateStr)
        if let date24 = date24 {
            return "\(date24.since(Date(), in: .minute))"
        }
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime12Long.rawValue
        let date12 = dateFormatter.date(from: currentDateStr)
        if let date12 = date12 {
            return "\(date12.since(Date(), in: .minute))"
        }
        
        return ""
    }
    
    // MARK: minutesInBetweenDate
    public static func minutesInBetweenDate(dateStr: String) -> String {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime24Long.rawValue
        let date24 = dateFormatter.date(from: currentDateStr)
        if let date24 = date24 {
            return Date().minutesInBetweenDate(date24).toInt.toString
        }
        
        dateFormatter.dateFormat = DateTimeFormat.dateTime12Long.rawValue
        let date12 = dateFormatter.date(from: currentDateStr)
        if let date12 = date12 {
            return Date().minutesInBetweenDate(date12).toInt.toString
        }
        
        return ""
    }
    
    // MARK: minutesInBetweenDate
    public static func minutesInBetweenDate(dateStr: String, dateFormat: String) -> String {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        let date = dateFormatter.date(from: currentDateStr)
        if let date = date {
            return  Date().minutesInBetweenDate(date).toInt.toString
        } else {
            return ""
        }
    }
}
