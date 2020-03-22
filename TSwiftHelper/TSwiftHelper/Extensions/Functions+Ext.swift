//
//  Functions+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public struct TSwiftHelper {
    // MARK: Returns app's name
    public static var appDisplayName: String? {
        if let bundleDisplayName = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String {
            return bundleDisplayName
        } else if let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String {
            return bundleName
        }

        return nil
    }

    // MARK: Returns app's version number
    public static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }

    // MARK: Return app's build number
    public static var appBuild: String? {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String
    }

    // MARK: Return app's bundle ID
    public static var appBundleID: String? {
        return Bundle.main.bundleIdentifier
    }

    // MARK: Returns both app's version and build numbers "v0.3(7)"
    public static var appVersionAndBuild: String? {
        if appVersion != nil && appBuild != nil {
            if appVersion == appBuild {
                return "v\(appVersion!)"
            } else {
                return "v\(appVersion!)(\(appBuild!))"
            }
        }
        return nil
    }

    // MARK: Return device version ""
    public static var deviceVersion: String {
        var size: Int = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine = [CChar](repeating: 0, count: Int(size))
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String(cString: machine)
    }

    // MARK: Returns true if DEBUG mode is active //TODO: Add to readme
    public static var isDebug: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }

    // MARK: Returns true if RELEASE mode is active //TODO: Add to readme
    public static var isRelease: Bool {
        #if DEBUG
        return false
        #else
        return true
        #endif
    }

    // MARK: Returns true if its simulator and not a device //TODO: Add to readme
    public static var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }

    // MARK: Returns true if its on a device and not a simulator //TODO: Add to readme
    public static var isDevice: Bool {
        #if targetEnvironment(simulator)
        return false
        #else
        return true
        #endif
    }

    #if !os(macOS)
    // MARK: Returns true if app is running in test flight mode
    /// Acquired from : http://stackoverflow.com/questions/12431994/detect-testflight
    public static var isInTestFlight: Bool {
        return Bundle.main.appStoreReceiptURL?.path.contains("sandboxReceipt") == true
    }
    #endif

    #if os(iOS) || os(tvOS)

    // MARK: Returns the top ViewController
    public static var topMostVC: UIViewController? {
        let topVC = UIApplication.topViewController()
        if topVC == nil {
            print(" Error: You don't have any views set. You may be calling them in viewDidLoad. Try viewDidAppear instead.")
        }
        return topVC
    }

    #if os(iOS)

    // MARK: Returns current screen orientation
    public static var screenOrientation: UIInterfaceOrientation {
        return UIApplication.shared.statusBarOrientation
    }

    #endif

    /// 
    public static var horizontalSizeClass: UIUserInterfaceSizeClass {
        return self.topMostVC?.traitCollection.horizontalSizeClass ?? UIUserInterfaceSizeClass.unspecified
    }

    /// 
    public static var verticalSizeClass: UIUserInterfaceSizeClass {
        return self.topMostVC?.traitCollection.verticalSizeClass ?? UIUserInterfaceSizeClass.unspecified
    }

    #endif

    #if os(iOS) || os(tvOS)

    // MARK: Returns screen width
    public static var screenWidth: CGFloat {

        #if os(iOS)

        if screenOrientation == .portrait || screenOrientation == .portraitUpsideDown {
            return UIScreen.main.bounds.size.width
        } else {
            return UIScreen.main.bounds.size.height
        }

        #elseif os(tvOS)

        return UIScreen.main.bounds.size.width

        #endif
    }

    // MARK: Returns screen height
    public static var screenHeight: CGFloat {

        #if os(iOS)

        if screenOrientation == .portrait || screenOrientation == .portraitUpsideDown {
            return UIScreen.main.bounds.size.height
        } else {
            return UIScreen.main.bounds.size.width
        }

        #elseif os(tvOS)

        return UIScreen.main.bounds.size.height

        #endif
    }

    #endif

    #if os(iOS)

    // MARK: Returns StatusBar height
    public static var screenStatusBarHeight: CGFloat {
        return UIApplication.shared.statusBarFrame.height
    }

    // MARK: Return screen's height without StatusBar
    public static var screenHeightWithoutStatusBar: CGFloat {
        if screenOrientation == .portrait || screenOrientation == .portraitUpsideDown {
            return UIScreen.main.bounds.size.height - screenStatusBarHeight
        } else {
            return UIScreen.main.bounds.size.width - screenStatusBarHeight
        }
    }

    #endif

    // MARK: Returns the locale country code. An example value might be "ES". //TODO: Add to readme
    public static var currentRegion: String? {
        return (Locale.current as NSLocale).object(forKey: NSLocale.Key.countryCode) as? String
    }

    #if os(iOS) || os(tvOS)

    // MARK: Calls action when a screen shot is taken
    public static func detectScreenShot(_ action: @escaping () -> Void) {
        let mainQueue = OperationQueue.main
        _ = NotificationCenter.default.addObserver(forName: UIApplication.userDidTakeScreenshotNotification, object: nil, queue: mainQueue) { _ in
            // executes after screenshot
            action()
        }
    }

    #endif

    //TODO: Document this, add tests to this
    // MARK: Iterates through enum elements, use with (for element in ez.iterateEnum(myEnum))
    /// http://stackoverflow.com/questions/24007461/how-to-enumerate-an-enum-with-string-type
    public static func iterateEnum<T: Hashable>(_: T.Type) -> AnyIterator<T> {
        var i = 0
        return AnyIterator {
            let next = withUnsafePointer(to: &i) { $0.withMemoryRebound(to: T.self, capacity: 1) { $0.pointee } }
            if next.hashValue != i { return nil }
            i += 1
            return next
        }
    }

    // MARK: - Dispatch
    // MARK: Runs the function after x seconds
    public static func dispatchDelay(_ second: Double, closure:@escaping () -> Void) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(second * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }

    // MARK: Runs function after x seconds
    public static func runThisAfterDelay(seconds: Double, after: @escaping () -> Void) {
        runThisAfterDelay(seconds: seconds, queue: DispatchQueue.main, after: after)
    }

    //TODO: Make this easier
    // MARK: Runs function after x seconds with dispatch_queue, use this syntax: dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
    public static func runThisAfterDelay(seconds: Double, queue: DispatchQueue, after: @escaping () -> Void) {
        let time = DispatchTime.now() + Double(Int64(seconds * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        queue.asyncAfter(deadline: time, execute: after)
    }

    // MARK: Submits a block for asynchronous execution on the main queue
    public static func runThisInMainThread(_ block: @escaping () -> Void) {
        DispatchQueue.main.async(execute: block)
    }

    // MARK: Runs in Default priority queue
    public static func runThisInBackground(_ block: @escaping () -> Void) {
        DispatchQueue.global(qos: .default).async(execute: block)
    }

    // MARK: Runs every second, to cancel use: timer.invalidate()
    @discardableResult public static func runThisEvery(
        seconds: TimeInterval,
        startAfterSeconds: TimeInterval,
        handler: @escaping (CFRunLoopTimer?) -> Void) -> Timer {
        let fireDate = startAfterSeconds + CFAbsoluteTimeGetCurrent()
        let timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, fireDate, seconds, 0, 0, handler)
        CFRunLoopAddTimer(CFRunLoopGetCurrent(), timer, CFRunLoopMode.commonModes)
        return timer!
    }

    // MARK: Gobal main queue
    @available(*, deprecated, renamed: "DispatchQueue.main")
    public var globalMainQueue: DispatchQueue {
        return DispatchQueue.main
    }

    // MARK: Gobal queue with user interactive priority
    @available(*, deprecated, renamed: "DispatchQueue.main")

    public var globalUserInteractiveQueue: DispatchQueue {
        return DispatchQueue.global(qos: .userInteractive)
    }

    // MARK: Gobal queue with user initiated priority
    @available(*, deprecated, renamed: "DispatchQueue.global()")
    public var globalUserInitiatedQueue: DispatchQueue {
        return DispatchQueue.global(qos: .userInitiated)
    }

    // MARK: Gobal queue with utility priority
    @available(*, deprecated, renamed: "DispatchQueue.global()")
    public var globalUtilityQueue: DispatchQueue {
        return DispatchQueue.global(qos: .utility)
    }

    // MARK: Gobal queue with background priority
    @available(*, deprecated, renamed: "DispatchQueue.global()")
    public var globalBackgroundQueue: DispatchQueue {
        return DispatchQueue.global(qos: .background)
    }

    // MARK: Gobal queue with default priority
    @available(*, deprecated, renamed: "DispatchQueue.global()")
    public var globalQueue: DispatchQueue {
        return DispatchQueue.global(qos: .default)
    }

    // MARK: - DownloadTask

    #if os(iOS) || os(tvOS)

    // MARK: Downloads image from url string
    public static func requestImage(_ url: String, success: @escaping (UIImage?) -> Void) {
        requestURL(url, success: { (data) -> Void in
            if let d = data {
                success(UIImage(data: d))
            }
        })
    }

    #endif

    // MARK: Downloads JSON from url string
    public static func requestJSON(_ url: String, success: @escaping ((Any?) -> Void), error: ((NSError) -> Void)?) {
        requestURL(url,
                   success: { (data) -> Void in
                    let json = self.dataToJsonDict(data)
                    success(json)
        },
                   error: { (err) -> Void in
                    if let e = error {
                        e(err)
                    }
        })
    }

    // MARK: converts NSData to JSON dictionary
    fileprivate static func dataToJsonDict(_ data: Data?) -> Any? {
        if let d = data {
            var error: NSError?
            let json: Any?
            do {
                json = try JSONSerialization.jsonObject(
                    with: d,
                    options: JSONSerialization.ReadingOptions.allowFragments)
            } catch let error1 as NSError {
                error = error1
                json = nil
            }

            if error != nil {
                return nil
            } else {
                return json
            }
        } else {
            return nil
        }
    }

    // MARK: 
    fileprivate static func requestURL(_ url: String, success: @escaping (Data?) -> Void, error: ((NSError) -> Void)? = nil) {
        guard let requestURL = URL(string: url) else {
            assertionFailure(" Error: Invalid URL")
            return
        }

        URLSession.shared.dataTask(
            with: URLRequest(url: requestURL),
            completionHandler: { data, _, err in
                if let e = err {
                    error?(e as NSError)
                } else {
                    success(data)
                }
        }).resume()
    }
}
