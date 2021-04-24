//
//  TopicVideoCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit
import AVKit
import AVFoundation
import youtube_ios_player_helper

class TopicVideoCollectionViewCell: UICollectionViewCell {
    public static let identifier = "topicPageVideoCell"

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
        contentView.layer.borderWidth = 0.5
        
        let player: YTPlayerView = YTPlayerView()
        contentView.addSubview(player)
        player.translatesAutoresizingMaskIntoConstraints = false
        player.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        NSLayoutConstraint.activate([
            player.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            player.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            player.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            player.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
        player.load(withVideoId: "WDlu1OhvYBM")
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
}
