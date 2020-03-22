//
//  GradientViewHelperHelper.swift
//  TSwiftHelper
//
//  Created by User on 3/22/20.
//  Copyright © 2020 ThinhNguyen. All rights reserved.
//  Email: thinhnguyen12389@gmail.com
//

import Foundation
import UIKit

public final class GradientViewHelper: UIView {
    // MARK: Types
    public enum GradientMode: Int {
        case linear
        case radial
    }
    
    public enum GradientDirection: Int {
        case vertical
        case horizontal
    }
    
    // MARK: Properties
    public var colors:[DefinedColors]? {
        didSet {
            updateGradient()
        }
    }
    
    public var dimmedColors: [DefinedColors]? {
        didSet {
            updateGradient()
        }
    }
    
    public var locations: [CGFloat]? {
        didSet {
            updateGradient()
        }
    }
    
    public var gradientMode: GradientMode = .linear {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var gradientDirection: GradientDirection = .vertical {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var drawsThinBorders: Bool = true {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var topBorderColor: DefinedColors? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var rightBorderColor: DefinedColors? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var bottomBorderColor: DefinedColors? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var leftBorderColor: DefinedColors? {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var automaticallyDims = true
    
    // MARK: Private
    private var gradient: CGGradient?
    
    // MARK: - Override
    // MARK: draw
    override public func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let size = bounds.size
        
        /// Gradient
        if let gradient = gradient {
            let options: CGGradientDrawingOptions = [.drawsAfterEndLocation]
            
            if gradientMode == .linear {
                let startPoint = CGPoint.zero
                let endPoint = gradientDirection == .vertical ? CGPoint(x: 0, y: size.height) : CGPoint(x: size.width, y: 0)
                
                context?.drawLinearGradient(gradient,
                                            start: startPoint,
                                            end: endPoint,
                                            options: options)
                
            } else {
                let center = CGPoint(x: bounds.midX, y: bounds.midY)
                
                context?.drawRadialGradient(gradient,
                                            startCenter: center,
                                            startRadius: 0,
                                            endCenter: center,
                                            endRadius: min(size.width, size.height) / 2,
                                            options: options)
            }
            
            let screen: UIScreen = window?.screen ?? UIScreen.main
            let borderWidth: CGFloat = drawsThinBorders ? 1.0 / screen.scale : 1.0
            
            // Top border
            if let color = topBorderColor {
                context?.setFillColor(color.value.cgColor)
                context?.fill(CGRect(x: 0, y: 0, width: size.width, height: borderWidth))
            }

            let sideY: CGFloat = topBorderColor != nil ? borderWidth : 0
            let sideHeight: CGFloat = size.height - sideY - (bottomBorderColor != nil ? borderWidth : 0)

            // Right border
            if let color = rightBorderColor {
                context?.setFillColor(color.value.cgColor)
                context?.fill(CGRect(x: size.width - borderWidth, y: sideY, width: borderWidth, height: sideHeight))
            }

            // Bottom border
            if let color = bottomBorderColor {
                context?.setFillColor(color.value.cgColor)
                context?.fill(CGRect(x: 0, y: size.height - borderWidth, width: size.width, height: borderWidth))
            }

            // Left border
            if let color = leftBorderColor {
                context?.setFillColor(color.value.cgColor)
                context?.fill(CGRect(x: 0, y: sideY, width: borderWidth, height: sideHeight))
            }
        }
    }
    
    // MARK: tintColorDidChange
    override public func tintColorDidChange() {
        super.tintColorDidChange()

        if automaticallyDims {
            updateGradient()
        }
    }
    
    // MARK: didMoveToWindow
    override public func didMoveToWindow() {
        super.didMoveToWindow()
        contentMode = .redraw
    }
}

// MARK: - Private Functions
extension GradientViewHelper {
    // MARK: updateGradient
    final private func updateGradient() {
        gradient = nil
        setNeedsDisplay()
        
        let colors = gradientColors()
        if let colors = colors {
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            let colorSpaceModel = colorSpace.model

            let gradientColors = colors.map { (color: UIColor) -> AnyObject in
                let cgColor = color.cgColor
                let cgColorSpace = cgColor.colorSpace ?? colorSpace

                // The color's color space is RGB, simply add it.
                if cgColorSpace.model == colorSpaceModel {
                    return cgColor as AnyObject
                }

                // Convert to RGB. There may be a more efficient way to do this.
                var red: CGFloat = 0
                var blue: CGFloat = 0
                var green: CGFloat = 0
                var alpha: CGFloat = 0
                
                color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
                
                return UIColor(red: red, green: green, blue: blue, alpha: alpha).cgColor as AnyObject
            } as NSArray

            gradient = CGGradient(colorsSpace: colorSpace, colors: gradientColors, locations: locations)
        }
    }
    
    // MARK: gradientColors
    final private func gradientColors() -> [UIColor]? {
        if tintAdjustmentMode == .dimmed {
            if let dimmedColors = dimmedColors {
                return dimmedColors.map { $0.value }
            }

            if automaticallyDims {
                if let colors = colors {
                    return colors.map {
                        var hue: CGFloat = 0
                        var brightness: CGFloat = 0
                        var alpha: CGFloat = 0

                        $0.value.getHue(&hue, saturation: nil, brightness: &brightness, alpha: &alpha)

                        return UIColor(hue: hue, saturation: 0, brightness: brightness, alpha: alpha)
                    }
                }
            }
        }

        return colors?.map({ $0.value })
    }
}
