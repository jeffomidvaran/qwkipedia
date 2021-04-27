//
//  QwkDescriptionCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit


class TopicQwkDescriptionCollectionViewCell: UICollectionViewCell {

    public static let identifier = "topicPageQwkDescriptionCell"

    fileprivate let titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Qwk Description"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    fileprivate let qwkDescriptionLabel: UITextView = {
        let tw = UITextView()
        tw.text = DummyData.qwkDescription
        tw.translatesAutoresizingMaskIntoConstraints = false
        return tw
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(qwkDescriptionLabel)
        contentView.addSubview(titleLabel)
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
        contentView.layer.borderWidth = 0.5
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: qwkDescriptionLabel.topAnchor),
            qwkDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            qwkDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            qwkDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }

}
