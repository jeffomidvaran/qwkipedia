//
//  QwkDescriptionCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit


class TopicQwkDescriptionCollectionViewCell: UICollectionViewCell {

    public static let identifier = "topicPageQwkDescriptionCell"

    fileprivate let qwkDescriptionLabel: UILabel = {
        let _label = UILabel()
        _label.text = DummyData.qwkDescription
        _label.numberOfLines = 0
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(qwkDescriptionLabel)
        
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
        contentView.layer.borderWidth = 0.5
        
        NSLayoutConstraint.activate([
            qwkDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            qwkDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            qwkDescriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            qwkDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }

}
