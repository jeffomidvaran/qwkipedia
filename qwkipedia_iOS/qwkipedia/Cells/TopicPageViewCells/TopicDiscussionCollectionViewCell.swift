//
//  TopicDiscussionCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicDiscussionCollectionViewCell: UICollectionViewCell {
    public static let identifier = "topicPageDiscussionCell"

    fileprivate let myLabel: UILabel = {
        let _label = UILabel()
        _label.text = "Discussion"
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()
    
    fileprivate let moreButton: UIButton = {
        let b = UIButton()
        b.setTitle("Chat", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myLabel)
        contentView.addSubview(moreButton)
        moreButton.addTarget(self, action: #selector(moreButtonPressed), for: .touchUpInside)
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
        contentView.layer.borderWidth = 0.5
        
        NSLayoutConstraint.activate([
            myLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8), 
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8), 
        ])
        
    }

    @objc func moreButtonPressed(sender: UIButton!) {
        print("discuss chat pressed")
    }

    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
}
