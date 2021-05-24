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

    }
    
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        previewImageView.layer.cornerRadius = 5
        previewImageView.layer.masksToBounds = true
        
    }
    
    @IBAction func favoriteBookmarkButtonAction(_ sender: Any) {
        print("favorite pressed")
    }
    
}
