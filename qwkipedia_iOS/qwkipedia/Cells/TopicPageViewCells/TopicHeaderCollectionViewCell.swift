//
//  TopicHeaderCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicHeaderCollectionViewCell: UICollectionViewCell {
    
    public static let identifier = "topicPageHeaderCell"

    
    fileprivate let myLabel: UILabel = {
        let _label = UILabel()
        _label.text = DummyData.title
        _label.translatesAutoresizingMaskIntoConstraints = false
        return _label
    }()
    
    
    var favorited: Bool = false {
        didSet {
            if (favorited) {
                let bookmark = UIImage(systemName: "bookmark")
                favoriteButton.setImage(bookmark, for: .normal)
            } else {
                let bookmark = UIImage(systemName: "bookmark.fill")
                favoriteButton.setImage(bookmark, for: .normal)
            }
        }
    }
    
    fileprivate let favoriteButton: UIButton = {
        let b = UIButton()
        let bookmark = UIImage(systemName: "bookmark")
        b.setImage(bookmark, for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        favoriteButton.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        
        contentView.addSubview(myLabel)
        contentView.addSubview(favoriteButton)
        
        NSLayoutConstraint.activate([
            favoriteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            myLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            myLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
    @objc func favoriteButtonPressed(sender: UIButton!) {
        favorited = !favorited
        print("favorited pressed")
    }
    
}
