//
//  TopicImageCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicImageCollectionViewCell: UICollectionViewCell {
    public static let identifier = "topicPageImageCell"

    fileprivate let image: UIImageView = {
        let _image = UIImageView()
        _image.image = #imageLiteral(resourceName: "puppy")
        _image.translatesAutoresizingMaskIntoConstraints = false
        return _image
    }()
    fileprivate let titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Top Image"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        contentView.addSubview(titleLabel)
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
        contentView.layer.borderWidth = 0.5
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            // titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: image.topAnchor),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            // image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            // image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            // image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
}