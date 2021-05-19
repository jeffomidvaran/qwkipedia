//
//  SearchItemCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/20/21.
//

import UIKit

class FavoritesItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var topicNameLabel: UILabel!
    @IBOutlet weak var favoriteBookmarkButtonObject: UIButton!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        
        contentView.addBottomBorderWithColor(color: QwkColors.outlineColor, width: 0.5)
        contentView.addShadow(offset: CGSize.init(width: 0, height: 3), color: QwkColors.outlineColor, radius: 2.0, opacity: 0.5)
//        self.layer.cornerRadius = 10
//        self.layer.borderColor = QwkColors.outlineColor.cgColor
//        self.layer.borderWidth = 0.5
    }
    
    
    
    
    @IBAction func favoriteBookmarkButtonAction(_ sender: Any) {
        print("favorite pressed")
    }
    
}
