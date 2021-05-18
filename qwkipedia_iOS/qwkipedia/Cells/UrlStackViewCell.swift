//
//  UrlStackViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/14/21.
//

import UIKit

class UrlStackViewCell: UIView {
    
    var url = "www.google.com"
    
    let urlLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "this is a test"
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    private func setUpView() {
        print("this is stackview cell")
        
    }

}
