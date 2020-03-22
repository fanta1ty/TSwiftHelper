//
//  UIImageView+Ext.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

extension UIImageView {
    
    // MARK: Convenince init that takes coordinates of bottom left corner, height width and image name.
    open convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, imageName: String? = nil) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        if let name = imageName {
            self.image = UIImage(named: name)
        }
    }

    // MARK: Convenience init that takes coordinates of bottom left corner, image name and scales image frame to width.
    open convenience init(x: CGFloat, y: CGFloat, imageName: String, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        image = UIImage(named: imageName)
        if image != nil {
            scaleImageFrameToWidth(width: scaleToWidth)
        } else {
            assertionFailure(" Error: The imageName: '\(imageName)' is invalid!!!")
        }
    }

    // MARK: Convenience init that takes coordinates of bottom left corner, width height and an UIImage Object.
    open convenience init(x: CGFloat, y: CGFloat, w: CGFloat, h: CGFloat, image: UIImage) {
        self.init(frame: CGRect(x: x, y: y, width: w, height: h))
        self.image = image
    }

    // MARK: Convenience init that coordinates of bottom left corner, an UIImage object and scales image from to width.
    open convenience init(x: CGFloat, y: CGFloat, image: UIImage, scaleToWidth: CGFloat) {
        self.init(frame: CGRect(x: x, y: y, width: 0, height: 0))
        self.image = image
        scaleImageFrameToWidth(width: scaleToWidth)
    }

    // MARK: scales this ImageView size to fit the given width
    open func scaleImageFrameToWidth(width: CGFloat) {
        guard let image = image else {
            print(" Error: The image is not set yet!")
            return
        }
        let widthRatio = image.size.width / width
        let newWidth = image.size.width / widthRatio
        let newHeigth = image.size.height / widthRatio
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeigth)
    }

    // MARK: scales this ImageView size to fit the given height
    open func scaleImageFrameToHeight(height: CGFloat) {
        guard let image = image else {
            print(" Error: The image is not set yet!")
            return
        }
        let heightRatio = image.size.height / height
        let newHeight = image.size.height / heightRatio
        let newWidth = image.size.width / heightRatio
        frame = CGRect(x: frame.origin.x, y: frame.origin.y, width: newWidth, height: newHeight)
    }

    // MARK: Rounds up an image by clipping the corner radius to one half the frame width.
    open func roundSquareImage() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }

    // MARK: Initializes an UIImage from URL and adds into current ImageView
    open func image(url: String) {
        TSwiftHelper.requestImage(url, success: { (image) -> Void in
            if let img = image {
                DispatchQueue.main.async {
                    self.image = img
                }
            }
        })
    }

    // MARK: Initializes an UIImage from URL and adds into current ImageView with placeholder
    open func image(url: String, placeholder: UIImage) {
        self.image = placeholder
        image(url: url)
    }

    // MARK: Initializes an UIImage from URL and adds into current ImageView with placeholder
    open func image(url: String, placeholderNamed: String) {
        if let image = UIImage(named: placeholderNamed) {
            self.image(url: url, placeholder: image)
        } else {
            image(url: url)
        }
    }

    // MARK: Deprecated 1.8

    /// 
    @available(*, deprecated, renamed: "image(url:)")
    open func imageWithUrl(url: String) {
        TSwiftHelper.requestImage(url, success: { (image) -> Void in
            if let img = image {
                DispatchQueue.main.async {
                    self.image = img
                }
            }
        })
    }

    /// 
    @available(*, deprecated, renamed: "image(url:placeholder:)")
    open func imageWithUrl(url: String, placeholder: UIImage) {
        self.image = placeholder
        imageWithUrl(url: url)
    }

    /// 
    @available(*, deprecated, renamed: "image(url:placeholderNamed:)")
    open func imageWithUrl(url: String, placeholderNamed: String) {
        if let image = UIImage(named: placeholderNamed) {
            imageWithUrl(url: url, placeholder: image)
        } else {
            imageWithUrl(url: url)
        }
    }
}
