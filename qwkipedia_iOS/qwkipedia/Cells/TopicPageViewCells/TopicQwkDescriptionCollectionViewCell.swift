//
//  QwkDescriptionCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit


class TopicQwkDescriptionCollectionViewCell: UICollectionViewCell {

    public static let identifier = "topicPageQwkDescriptionCell"

    fileprivate let qwkDescriptionTextView: UITextView = {
        let tv = UITextView()
        tv.text = DummyData.qwkDescription
        tv.isEditable = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
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
        contentView.addSubview(qwkDescriptionTextView)
        contentView.addSubview(moreButton)
        
        contentView.addBottomBorderWithColor(color: QwkColors.outlineColor, width: 0.5)
        contentView.addShadow(offset: CGSize.init(width: 0, height: 3), color: QwkColors.outlineColor, radius: 2.0, opacity: 0.5)
//        contentView.layer.cornerRadius = 10
//        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
//        contentView.layer.borderWidth = 0.5
//        contentView.layer.masksToBounds = true
        
        
        NSLayoutConstraint.activate([
            qwkDescriptionTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            qwkDescriptionTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            qwkDescriptionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            qwkDescriptionTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
}
