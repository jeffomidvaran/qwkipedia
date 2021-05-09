//
//  LaunchScreenViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/9/21.
//

import UIKit

class GradientBackgroundUIView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setGradientBackground()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setGradientBackground()
    }
    
    
    func setGradientBackground() {
        // 37 38 177
        let colorBottom =  UIColor(red: 37.0/255.0, green: 37.0/255.0, blue: 177.0/255.0, alpha: 1.0).cgColor
        //58 230 255
        let colorTop = UIColor(red: 58.0/255.0, green: 230.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.bounds
                
        self.layer.insertSublayer(gradientLayer, at:0)
    }
}
