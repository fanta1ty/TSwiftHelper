//
//  BlockWebView.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

///Make sure you use  `[weak self] (NSURLRequest) in` if you are using the keyword `self` inside the closure or there might be a memory leak
public class BlockWebView: UIWebView, UIWebViewDelegate {
    public var didStartLoad: ((URLRequest) -> Void)?
    public var didFinishLoad: ((URLRequest) -> Void)?
    public var didFailLoad: ((URLRequest, Error) -> Void)?

    public var shouldStartLoadingRequest: ((URLRequest) -> (Bool))?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public func webViewDidStartLoad(_ webView: UIWebView) {
        didStartLoad? (webView.request!)
    }

    public func webViewDidFinishLoad(_ webView: UIWebView) {
        didFinishLoad? (webView.request!)
    }

    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        didFailLoad? (webView.request!, error)
    }

    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        if let should = shouldStartLoadingRequest {
            return should (request)
        } else {
            return true
        }
    }
}
