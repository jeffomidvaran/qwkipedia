//
//  UIViewExtensions.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 4/25/21.
//

import Foundation
import UIKit

public extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat? = 0,
                paddingLeft: CGFloat? = 0, paddingBottom: CGFloat? = 0, paddingRight: CGFloat? = 0, width: CGFloat? = nil, height: CGFloat? = nil) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop!).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft!).isActive = true
        }
        
        if let bottom = bottom {
            if let paddingBottom = paddingBottom {
                bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
            }
        }
        
        if let right = right {
            if let paddingRight = paddingRight {
                rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
            }
        }
        
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }

    
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    
    func addShadow(offset: CGSize, color: UIColor, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
    
    func setGreenCircularShadow() {
        let greenGradient = [UIColor(red: 13/255.0, green: 160/255.0, blue: 110/255.0, alpha: 0.8),UIColor(red: 7/255.0, green: 200/255.0, blue: 128/255.0, alpha: 1.0),UIColor(red: 7/255.0, green: 200/255.0, blue: 128/255.0, alpha: 1.0), UIColor(red: 13/255.0, green: 160/255.0, blue: 110/255.0, alpha: 0.8)]
        self.backgroundColor        = UIColor().colorWithRadialGradient(frame: self.bounds, colors: greenGradient)
        self.layer.shadowColor      = UIColor(red: 7.0/255.0, green: 200.0/255.0, blue: 128.0/255.0, alpha: 1.0).cgColor
        self.layer.shadowOpacity    = 0.33
        self.layer.shadowOffset     = CGSize(width: 0, height: 5.0)
        self.layer.shadowRadius     = 10
        self.layer.shadowPath       = UIBezierPath(rect: self.bounds).cgPath
       }
}



public extension UIColor {
func colorWithRadialGradient(frame: CGRect, colors: [UIColor]) -> UIColor {
    if frame.width != 0.0 && frame.height != 0.0 {
        let backgroundGradientLayer = CAGradientLayer()
        backgroundGradientLayer.frame = frame
        let cgColors = colors.map({$0.cgColor})
        backgroundGradientLayer.colors = cgColors
        backgroundGradientLayer.type = CAGradientLayerType.radial
        backgroundGradientLayer.startPoint = CGPoint(x: 0.5, y: 0.1)
        UIGraphicsBeginImageContext(backgroundGradientLayer.bounds.size)
        backgroundGradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let backgroundColorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return UIColor(patternImage: backgroundColorImage!)
    }
    return .clear
    }
}
