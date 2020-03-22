//
//  BaseVC.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public class BaseVC: UIViewController {
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupRx()
    }
    
    deinit {
        print(level: .debug, message: self.nameOfClass + " " + "deinit")
    }
}

// MARK: - Base Function
extension BaseVC {
    func setupUI() {
        
    }
    
    func setupRx() {
        
    }
}
