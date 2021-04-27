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
        self.layer.cornerRadius = 10
        self.layer.borderColor = QwkColors.outlineColor.cgColor
        self.layer.borderWidth = 0.5
    }
}
