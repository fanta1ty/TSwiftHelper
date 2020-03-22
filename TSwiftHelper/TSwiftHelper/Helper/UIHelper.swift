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

final class UIHelper {
    // MARK: convertDateString
    static func convertDateString(dateStr: String) -> String {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        let date = dateFormatter.date(from: currentDateStr)
        
        if let date = date {
            dateFormatter.dateFormat = "HH:mm - dd 'thg' M, yyyy"
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
    
    // MARK: convertDateString
    static func convertDateString(dateStr: String, dateFormat: String) -> String {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        let date = dateFormatter.date(from: currentDateStr)
        
        if let date = date {
            dateFormatter.dateFormat = dateFormat
            return dateFormatter.string(from: date)
        } else {
            return ""
        }
    }
    
    // MARK: changeDateFormat
    static func changeDateFormat(dateStr: String, dateFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
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
    
    static func convertUTCDateStr(dateStr: String) -> Date? {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        return dateFormatter.date(from: currentDateStr)
    }
    
    // MARK: timePassed
    static func timePassed(dateStr: String) -> String {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        let date = dateFormatter.date(from: currentDateStr)
        
        if let date = date {
            return  date.timePassed()
        } else {
            return ""
        }
    }
    
    // MARK: minutesInBetweenDate
    static func hoursInBetweenDate(dateStr: String) -> String {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        let date = dateFormatter.date(from: currentDateStr)
        if let date = date {
            return  Date().hoursInBetweenDate(date).toInt.toString
        } else {
            return ""
        }
    }
    
    // MARK: UTCToLocal
    static func UTCToLocal(dateStr: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        if let dt = dateFormatter.date(from: dateStr) {
            dateFormatter.timeZone = .current
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

            return dateFormatter.string(from: dt)
        } else {
            return ""
        }
    }
    
    // MARK: sinceDate
    static func sinceDate(dateStr: String) -> String {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        if let date = dateFormatter.date(from: currentDateStr) {
            return "\(date.since(Date(), in: .minute))"
        } else {
            return ""
        }
    }
    
    // MARK: minutesInBetweenDate
    static func minutesInBetweenDate(dateStr: String) -> String {
        let currentDateStr = UTCToLocal(dateStr: dateStr)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        dateFormatter.locale = .current
        dateFormatter.timeZone = .current
        
        if let date = dateFormatter.date(from: currentDateStr) {
            return Date().minutesInBetweenDate(date).toInt.toString
        } else {
            return ""
        }
    }
    
    // MARK: minutesInBetweenDate
    static func minutesInBetweenDate(dateStr: String, dateFormat: String) -> String {
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
