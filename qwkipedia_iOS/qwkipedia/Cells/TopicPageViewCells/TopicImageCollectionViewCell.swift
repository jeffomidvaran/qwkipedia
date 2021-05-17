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
        i.image = #imageLiteral(resourceName: "puppyImage")
        i.contentMode = .scaleAspectFit
        i.translatesAutoresizingMaskIntoConstraints = false
        i.isUserInteractionEnabled = true
        return i
    }()

    let moreButton: UIButton = {
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
        contentView.addSubview(imageView)
        contentView.addSubview(moreButton)
        
        contentView.addBottomBorderWithColor(color: QwkColors.outlineColor, width: 0.5)
        contentView.addShadow(offset: CGSize.init(width: 0, height: 3), color: QwkColors.outlineColor, radius: 2.0, opacity: 0.5)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(imagePressedAction))
        imageView.addGestureRecognizer(tap)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            
            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
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
