//
//  TopicExpertSummaryCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicExpertSummaryCollectionViewCell: UICollectionViewCell {
    public static let identifier = "topicPageExpertSummaryCell"

    fileprivate let expertSummaryText: UITextView = {
        let tv = UITextView()
        tv.text = DummyData.expertSummary
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.isEditable = false
        return tv
    }()
    
    fileprivate let titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Expert Summary"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(expertSummaryText)
        contentView.addSubview(titleLabel)
        
        
//        contentView.layer.cornerRadius = 10
//        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
//        contentView.layer.borderWidth = 0.5
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: expertSummaryText.topAnchor),

            expertSummaryText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            expertSummaryText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            // expertSummaryText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            expertSummaryText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),

        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
}
