//
//  TopicHeaderCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicHeaderCollectionViewCell: UICollectionViewCell {
    
    public static let identifier = "topicPageHeaderCell"

    
    fileprivate let myLabel: UILabel = {
        let _label = UILabel()
        _label.text = "Puppies"
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myLabel)
        
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
