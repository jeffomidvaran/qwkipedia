//
//  TopicVideoCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicVideoCollectionViewCell: UICollectionViewCell {
    public static let identifier = "topicPageVideoCell"

    fileprivate let myLabel: UILabel = {
        let _label = UILabel()
        _label.text = "video"
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myLabel)
        
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
        contentView.layer.borderWidth = 0.5
        
        NSLayoutConstraint.activate([
            myLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
        
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
}
