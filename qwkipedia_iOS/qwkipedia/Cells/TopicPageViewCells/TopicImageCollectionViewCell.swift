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
        _image.contentMode = .scaleAspectFit
        _image.translatesAutoresizingMaskIntoConstraints = false
        return _image
    }()

    let moreButton: UIButton = {
        let b = UIButton()
        b.setTitle("More", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        contentView.addSubview(moreButton)
        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
        contentView.layer.borderWidth = 0.5
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            image.bottomAnchor.constraint(equalTo: moreButton.topAnchor, constant: 8),
            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
}
