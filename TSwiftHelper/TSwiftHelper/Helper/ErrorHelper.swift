//
//  ErrorHelper.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

final class ErrorHelper {
    // MARK: showAlertError
    static func showAlertError(title: String?, message: String?, controller: UIViewController, complete: (() -> ())?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK".localized, style: .default) { action in
            guard let complete = complete else {
                return
            }
            
            complete()
        }
        alertController.addAction(okAction)
        
        controller.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: showAlertSetting
    static func showAlertSetting(title: String?, message: String?, controller: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "CANCEL".localized, style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        let settingAction = UIAlertAction(title: "Settings".localized, style: .default) { _ in
            guard let settingURL = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingURL) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(settingURL, options: [:], completionHandler: { _ in
                        controller.dismiss(animated: true, completion: nil)
                    })
                } else {
                    // Fallback on earlier versions
                    UIApplication.shared.openURL(settingURL)
                }
            }
        }
        alertController.addAction(settingAction)
        alertController.preferredAction = settingAction
        
        controller.present(alertController, animated: true, completion: nil)
    }
}
