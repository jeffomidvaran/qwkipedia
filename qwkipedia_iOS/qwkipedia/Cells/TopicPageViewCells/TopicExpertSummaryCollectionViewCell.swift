//
//  TopicExpertSummaryCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicExpertSummaryCollectionViewCell: UICollectionViewCell {
    public static let identifier = "topicPageExpertSummaryCell"

    fileprivate let myLabel: UITextView = {
        let _label = UITextView()
        _label.text = DummyData.expertSummary
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
            myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            myLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            myLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),

        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
}
