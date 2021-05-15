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
        let l = UILabel()
        l.text = "Discussion"
//        l.textColor = QwkColors.highlightColorGreen
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    let chatButton: UIButton = {
        let b = UIButton()
        let rightArrow = UIImage(systemName: "arrow.right")
        b.setImage(rightArrow, for: .normal)
        b.tintColor = QwkColors.buttonColor
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myLabel)
        contentView.addSubview(chatButton)
        
        
        contentView.addBottomBorderWithColor(color: QwkColors.outlineColor, width: 0.5)
        contentView.addShadow(offset: CGSize.init(width: 0, height: 3), color: QwkColors.outlineColor, radius: 2.0, opacity: 0.5)

//        contentView.layer.cornerRadius = 10
//        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
//        contentView.layer.borderWidth = 0.5
//        contentView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 8),
            chatButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8), 
            chatButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8), 
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
}
