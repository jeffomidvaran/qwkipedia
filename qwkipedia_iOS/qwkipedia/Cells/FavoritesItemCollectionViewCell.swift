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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.layer.cornerRadius = 10
        self.layer.borderColor = QwkColors.outlineColor.cgColor
        self.layer.borderWidth = 0.5
    }
    
    
    
}
