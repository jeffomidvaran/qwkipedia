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


    fileprivate let titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Top Video"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    let moreButton: UIButton = {
        let b = UIButton()
        b.setTitle("More", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
        contentView.layer.borderWidth = 0.5
        
    
        let player: YTPlayerView = YTPlayerView()
        player.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(player)
        contentView.addSubview(titleLabel)
        contentView.addSubview(moreButton)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: player.topAnchor, constant: -8),

            player.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            player.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            player.bottomAnchor.constraint(equalTo: moreButton.topAnchor, constant: 8),

            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),

        ])
        player.load(withVideoId: "WDlu1OhvYBM")
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
    
}
