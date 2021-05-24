//
//  TopicPreviewCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/19/21.
//

import UIKit

class TopicPreviewCollectionViewCell: UICollectionViewCell {
    public static let identifier = "homePageTopicPreviewCell"

    @IBOutlet weak var topicNameLabel: UILabel!
    @IBOutlet weak var qwkDescriptionLabel: UILabel!
    @IBOutlet weak var previewImageView: UIImageView!
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.addBottomBorderWithColor(color: QwkColors.outlineColor, width: 0.5)
//        contentView.addShadow(offset: CGSize.init(width: 0, height: 3), color: QwkColors.outlineColor, radius: 2.0, opacity: 0.5)

    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        previewImageView.layer.cornerRadius = 5
        previewImageView.layer.masksToBounds = true
        
    }

    
    
}
