//
//  UIViewController+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public extension UIViewController {
    // MARK: - Notifications
    
    // MARK: Adds an NotificationCenter with name and Selector
    func addNotificationObserver(_ name: String, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: NSNotification.Name(rawValue: name), object: nil)
    }
    
    // MARK: Removes an NSNotificationCenter for name
    func removeNotificationObserver(_ name: String) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: name), object: nil)
    }
    
    // MARK: Removes NotificationCenter'd observer
    func removeNotificationObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    #if os(iOS)
    
    // MARK: Adds a NotificationCenter Observer for keyboardWillShowNotification()
    ///
    /// ⚠️ You also need to implement ```keyboardWillShowNotification(_ notification: Notification)```
    func addKeyboardWillShowNotification() {
        self.addNotificationObserver(UIResponder.keyboardWillShowNotification.rawValue, selector: #selector(UIViewController.keyboardWillShowNotification(_:)))
    }
    
    // MARK: Adds a NotificationCenter Observer for keyboardDidShowNotification()
    ///
    /// ⚠️ You also need to implement ```keyboardDidShowNotification(_ notification: Notification)```
    func addKeyboardDidShowNotification() {
        self.addNotificationObserver(UIResponder.keyboardDidShowNotification.rawValue, selector: #selector(UIViewController.keyboardDidShowNotification(_:)))
    }
    
    // MARK: Adds a NotificationCenter Observer for keyboardWillHideNotification()
    ///
    /// ⚠️ You also need to implement ```keyboardWillHideNotification(_ notification: Notification)```
    func addKeyboardWillHideNotification() {
        self.addNotificationObserver(UIResponder.keyboardWillHideNotification.rawValue, selector: #selector(UIViewController.keyboardWillHideNotification(_:)))
    }
    
    // MARK: Adds a NotificationCenter Observer for keyboardDidHideNotification()
    ///
    /// ⚠️ You also need to implement ```keyboardDidHideNotification(_ notification: Notification)```
    func addKeyboardDidHideNotification() {
        self.addNotificationObserver(UIResponder.keyboardDidHideNotification.rawValue, selector: #selector(UIViewController.keyboardDidHideNotification(_:)))
    }
    
    // MARK: Removes keyboardWillShowNotification()'s NotificationCenter Observer
    func removeKeyboardWillShowNotification() {
        self.removeNotificationObserver(UIResponder.keyboardWillShowNotification.rawValue)
    }
    
    // MARK: Removes keyboardDidShowNotification()'s NotificationCenter Observer
    func removeKeyboardDidShowNotification() {
        self.removeNotificationObserver(UIResponder.keyboardDidShowNotification.rawValue)
    }
    
    // MARK: Removes keyboardWillHideNotification()'s NotificationCenter Observer
    func removeKeyboardWillHideNotification() {
        self.removeNotificationObserver(UIResponder.keyboardWillHideNotification.rawValue)
    }
    
    // MARK: Removes keyboardDidHideNotification()'s NotificationCenter Observer
    func removeKeyboardDidHideNotification() {
        self.removeNotificationObserver(UIResponder.keyboardDidHideNotification.rawValue)
    }
    
    @objc func keyboardDidShowNotification(_ notification: Notification) {
        if let nInfo = (notification as NSNotification).userInfo, let value = nInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            
            let frame = value.cgRectValue
            keyboardDidShowWithFrame(frame)
        }
    }
    
    @objc func keyboardWillShowNotification(_ notification: Notification) {
        if let nInfo = (notification as NSNotification).userInfo, let value = nInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            
            let frame = value.cgRectValue
            keyboardWillShowWithFrame(frame)
        }
    }
    
    @objc func keyboardWillHideNotification(_ notification: Notification) {
        if let nInfo = (notification as NSNotification).userInfo, let value = nInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            
            let frame = value.cgRectValue
            keyboardWillHideWithFrame(frame)
        }
    }
    
    @objc func keyboardDidHideNotification(_ notification: Notification) {
        if let nInfo = (notification as NSNotification).userInfo, let value = nInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            
            let frame = value.cgRectValue
            keyboardDidHideWithFrame(frame)
        }
    }
    
    func keyboardWillShowWithFrame(_ frame: CGRect) {
        
    }
    
    func keyboardDidShowWithFrame(_ frame: CGRect) {
        
    }
    
    func keyboardWillHideWithFrame(_ frame: CGRect) {
        
    }
    
    func keyboardDidHideWithFrame(_ frame: CGRect) {
        
    }
    
    //MARK: : Makes the UIViewController register tap events and hides keyboard when clicked somewhere in the ViewController.
    func hideKeyboardWhenTappedAround(cancelTouches: Bool = false) {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = cancelTouches
        view.addGestureRecognizer(tap)
    }
    
    #endif
    
    //MARK: : Dismisses keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - VC Container
    
    // MARK: Returns maximum y of the ViewController
    var top: CGFloat {
        if let me = self as? UINavigationController, let visibleViewController = me.visibleViewController {
            return visibleViewController.top
        }
        if let nav = self.navigationController {
            if nav.isNavigationBarHidden {
                return view.top
            } else {
                return nav.navigationBar.bottom
            }
        } else {
            return view.top
        }
    }
    
    // MARK: Returns minimum y of the ViewController
    var bottom: CGFloat {
        if let me = self as? UINavigationController, let visibleViewController = me.visibleViewController {
            return visibleViewController.bottom
        }
        if let tab = tabBarController {
            if tab.tabBar.isHidden {
                return view.bottom
            } else {
                return tab.tabBar.top
            }
        } else {
            return view.bottom
        }
    }
    
    // MARK: Returns Tab Bar's height
    var tabBarHeight: CGFloat {
        if let me = self as? UINavigationController, let visibleViewController = me.visibleViewController {
            return visibleViewController.tabBarHeight
        }
        if let tab = self.tabBarController {
            return tab.tabBar.frame.size.height
        }
        return 0
    }
    
    // MARK: Returns Navigation Bar's height
    var navigationBarHeight: CGFloat {
        if let me = self as? UINavigationController, let visibleViewController = me.visibleViewController {
            return visibleViewController.navigationBarHeight
        }
        if let nav = self.navigationController {
            return nav.navigationBar.h
        }
        return 0
    }
    
    // MARK: Returns Navigation Bar's color
    var navigationBarColor: UIColor? {
        get {
            if let me = self as? UINavigationController, let visibleViewController = me.visibleViewController {
                return visibleViewController.navigationBarColor
            }
            return navigationController?.navigationBar.tintColor
        } set(value) {
            navigationController?.navigationBar.barTintColor = value
        }
    }
    
    // MARK: Returns current Navigation Bar
    var navBar: UINavigationBar? {
        return navigationController?.navigationBar
    }
    
    /// 
    var applicationFrame: CGRect {
        return CGRect(x: view.x, y: top, width: view.w, height: bottom - top)
    }
    
    // MARK: - VC Flow
    
    // MARK: Pushes a view controller onto the receiver’s stack and updates the display.
    func pushVC(_ vc: UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: Pops the top view controller from the navigation stack and updates the display.
    func popVC() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: Hide or show navigation bar
    var isNavBarHidden: Bool {
        get {
            return (navigationController?.isNavigationBarHidden)!
        }
        set {
            navigationController?.isNavigationBarHidden = newValue
        }
    }
    
    // MARK: Added extension for popToRootViewController
    func popToRootVC() {
        _ = navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: Presents a view controller modally.
    func presentVC(_ vc: UIViewController) {
        present(vc, animated: true, completion: nil)
    }
    
    // MARK: Dismisses the view controller that was presented modally by the view controller.
    func dismissVC(completion: (() -> Void)? ) {
        dismiss(animated: true, completion: completion)
    }
    
    // MARK: Adds the specified view controller as a child of the current view controller.
    func addAsChildViewController(_ vc: UIViewController, toView: UIView) {
        self.addChild(vc)
        toView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
    // MARK: Adds image named: as a UIImageView in the Background
    func setBackgroundImage(_ named: String) {
        let image = UIImage(named: named)
        let imageView = UIImageView(frame: view.frame)
        imageView.image = image
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }
    
    // MARK: Adds UIImage as a UIImageView in the Background
    @nonobjc func setBackgroundImage(_ image: UIImage) {
        let imageView = UIImageView(frame: view.frame)
        imageView.image = image
        view.addSubview(imageView)
        view.sendSubviewToBack(imageView)
    }
    
    #if os(iOS)
    
    @available(*, deprecated)
    func hideKeyboardWhenTappedAroundAndCancelsTouchesInView() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    #endif
}
