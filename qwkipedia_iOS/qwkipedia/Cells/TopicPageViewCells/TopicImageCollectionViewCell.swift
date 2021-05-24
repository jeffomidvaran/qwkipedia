//
//  TopicImageCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicImageCollectionViewCell: UICollectionViewCell {
    public static let identifier = "topicPageImageCell"

    let imageView: UIImageView = {
        let i = UIImageView()
//        i.image = #imageLiteral(resourceName: "puppyImage")
        i.contentMode = .scaleAspectFit
        i.translatesAutoresizingMaskIntoConstraints = false
        i.isUserInteractionEnabled = true
        i.backgroundColor = .systemBackground
        i.layer.cornerRadius = 5
        i.layer.masksToBounds = true
        
        return i
    }()

    let moreButton: UIButton = {
        let b = UIButton()
        let rightArrow = UIImage(systemName: "arrow.right")
//        let rightArrow = #imageLiteral(resourceName: "qwkArrow")
        b.setImage(rightArrow, for: .normal)
        b.tintColor = QwkColors.buttonColor
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(moreButton)
        contentView.bringSubviewToFront(moreButton)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(imagePressedAction))
        imageView.addGestureRecognizer(tap)
        
        
        NSLayoutConstraint.activate([
            moreButton.heightAnchor.constraint(equalToConstant: 25),
            moreButton.widthAnchor.constraint(equalToConstant: 25),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant:0 ),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant:0),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -(25+16)),
        ])
    }
    
    var imageButtonTapAction : (()->())?

    @objc func imagePressedAction() {
        print("testing pressed in topic image")
        imageButtonTapAction!()
    }

    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
}
