//
//  Date+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

open enum TimePassed {
    case year(Int)
    case month(Int)
    case day(Int)
    case hour(Int)
    case minute(Int)
    case second(Int)
    case now
}

extension TimePassed: Equatable {
    open static func ==(lhs: TimePassed, rhs: TimePassed) -> Bool {
        
        switch(lhs, rhs) {
            
        case (.year(let a), .year(let b)):
            return a == b
            
        case (.month(let a), .month(let b)):
            return a == b
            
        case (.day(let a), .day(let b)):
            return a == b
            
        case (.hour(let a), .hour(let b)):
            return a == b
            
        case (.minute(let a), .minute(let b)):
            return a == b
            
        case (.second(let a), .second(let b)):
            return a == b
            
        case (.now, .now):
            return true
            
        default:
            return false
        }
    }
}

// MARK: - Initialize
extension Date {
    // MARK: Init
    open init?(fromString string: String, format: String, timezone: TimeZone = TimeZone.autoupdatingCurrent, locale: Locale = Locale.current) {
        let formatter = DateFormatter()
        formatter.timeZone = timezone
        formatter.locale = locale
        formatter.dateFormat = format
        if let date = formatter.date(from: string) {
            self = date
        } else {
            return nil
        }
    }
    
    open init?(httpDateString: String) {
        if let rfc1123 = Date(fromString: httpDateString, format: "EEE',' dd' 'MMM' 'yyyy HH':'mm':'ss zzz") {
            self = rfc1123
            return
        }
        if let rfc850 = Date(fromString: httpDateString, format: "EEEE',' dd'-'MMM'-'yy HH':'mm':'ss z") {
            self = rfc850
            return
        }
        if let asctime = Date(fromString: httpDateString, format: "EEE MMM d HH':'mm':'ss yyyy") {
            self = asctime
            return
        }
        if let iso8601DateOnly = Date(fromString: httpDateString, format: "yyyy-MM-dd") {
            self = iso8601DateOnly
            return
        }
        if let iso8601DateHrMinOnly = Date(fromString: httpDateString, format: "yyyy-MM-dd'T'HH:mmxxxxx") {
            self = iso8601DateHrMinOnly
            return
        }
        if let iso8601DateHrMinSecOnly = Date(fromString: httpDateString, format: "yyyy-MM-dd'T'HH:mm:ssxxxxx") {
            self = iso8601DateHrMinSecOnly
            return
        }
        if let iso8601DateHrMinSecMs = Date(fromString: httpDateString, format: "yyyy-MM-dd'T'HH:mm:ss.SSSxxxxx") {
            self = iso8601DateHrMinSecMs
            return
        }
        //self.init()
        return nil
    }
}

extension Date {
    // MARK: dateByAddingYears
    func dateByAddingYears(_ dYears: Int) -> Date {
        
        var dateComponents = DateComponents()
        dateComponents.year = dYears
        
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
    
    open static let minutesInAWeek = 24 * 60 * 7

    // MARK: toString
    open func toString(dateStyle: DateFormatter.Style = .medium, timeStyle: DateFormatter.Style = .medium) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        return formatter.string(from: self)
    }

    // MARK: toString
    open func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

    // MARK: daysInBetweenDate
    open func daysInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSince1970 - date.timeIntervalSince1970
        diff = fabs(diff/86400)
        return diff
    }

    // MARK: hoursInBetweenDate
    open func hoursInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSince1970 - date.timeIntervalSince1970
        diff = fabs(diff/3600)
        return diff
    }

    // MARK: minutesInBetweenDate
    open func minutesInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSince1970 - date.timeIntervalSince1970
        diff = fabs(diff/60)
        return diff
    }

    // MARK: secondsInBetweenDate
    open func secondsInBetweenDate(_ date: Date) -> Double {
        var diff = self.timeIntervalSince1970 - date.timeIntervalSince1970
        diff = fabs(diff)
        return diff
    }

    // MARK: timePassed
    open func timePassed() -> String {
        let date = Date()
        let calendar = Calendar.autoupdatingCurrent
        let components = (calendar as NSCalendar).components([.year, .month, .day, .hour, .minute, .second], from: self, to: date, options: [])
        var str: String
        
        if components.year! >= 1 {
            components.year == 1 ? (str = "year".localized) : (str = "years".localized)
            return "\(components.year!) \(str) " + "ago".localized
            
        } else if components.month! >= 1 {
            components.month == 1 ? (str = "month".localized) : (str = "months".localized)
            return "\(components.month!) \(str) " + "ago".localized
            
        } else if components.day! >= 1 {
            components.day == 1 ? (str = "day".localized) : (str = "days".localized)
            return "\(components.day!) \(str) " + "ago".localized
            
        } else if components.hour! >= 1 {
            components.hour == 1 ? (str = "hour".localized) : (str = "hours".localized)
            return "\(components.hour!) \(str) " + "ago".localized
            
        } else if components.minute! >= 1 {
            components.minute == 1 ? (str = "minute".localized) : (str = "minutes".localized)
            return "\(components.minute!) \(str) " + "ago".localized
            
        } else if components.second! >= 1 {
            components.second == 1 ? (str = "second".localized) : (str = "seconds".localized)
            return "\(components.second!) \(str) " + "ago".localized
            
        } else {
            return "Just now".localized
            
        }
    }
    
    // MARK: timePassed
    open func timePassed() -> TimePassed {
        
        let date = Date()
        let calendar = Calendar.autoupdatingCurrent
        let components = (calendar as NSCalendar).components([.year, .month, .day, .hour, .minute, .second], from: self, to: date, options: [])
        
        if components.year! >= 1 {
            return TimePassed.year(components.year!)
        } else if components.month! >= 1 {
            return TimePassed.month(components.month!)
        } else if components.day! >= 1 {
            return TimePassed.day(components.day!)
        } else if components.hour! >= 1 {
            return TimePassed.hour(components.hour!)
        } else if components.minute! >= 1 {
            return TimePassed.minute(components.minute!)
        } else if components.second! >= 1 {
            return TimePassed.second(components.second!)
        } else {
            return TimePassed.now
        }
    }
    
    // MARK: isFuture
    open var isFuture: Bool {
        return self > Date()
    }
    
    // MARK: isPast
    open var isPast: Bool {
        return self < Date()
    }

    // MARK: isToday
    open var isToday: Bool {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        return format.string(from: self) == format.string(from: Date())
    }

    // MARK: isYesterday
    open var isYesterday: Bool {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let yesterDay = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        return format.string(from: self) == format.string(from: yesterDay!)
    }

    // MARK: isTomorrow
    open var isTomorrow: Bool {
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd"
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        return format.string(from: self) == format.string(from: tomorrow!)
    }

    // MARK: isThisMonth
    open var isThisMonth: Bool {
        let today = Date()
        return self.month == today.month && self.year == today.year
    }

    // MARK: isThisWeek
    open var isThisWeek: Bool {
        return self.minutesInBetweenDate(Date()) <= Double(Date.minutesInAWeek)
    }

    // MARK: era
    open var era: Int {
        return Calendar.current.component(Calendar.Component.era, from: self)
    }
    
    // MARK: year
    open var year: Int {
        return Calendar.current.component(Calendar.Component.year, from: self)
    }

    // MARK: month
    open var month: Int {
        return Calendar.current.component(Calendar.Component.month, from: self)
    }

    // MARK: weekday
    open var weekday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }

    // MARK: monthAsString
    open var monthAsString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }

    // MARK: day
    open var day: Int {
        return Calendar.current.component(.day, from: self)
    }

    // MARK: hour
    open var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }

    // MARK: minute
    open var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }

    // MARK: second
    open var second: Int {
        return Calendar.current.component(.second, from: self)
    }
    
    // MARK: nanosecond
    open var nanosecond: Int {
        return Calendar.current.component(.nanosecond, from: self)
    }
    
    #if os(iOS) || os(tvOS)
    
    // MARK: Gets the international standard(ISO8601) representation of date
    @available(iOS 10.0, *)
    @available(tvOS 10.0, *)
    open var iso8601: String {
        let formatter = ISO8601DateFormatter()
        return formatter.string(from: self)
    }
    
    #endif
}
