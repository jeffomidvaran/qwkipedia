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


    let moreButton: UIButton = {
        let b = UIButton()
        let rightArrow = UIImage(systemName: "arrow.right")
//        let rightArrow = #imageLiteral(resourceName: "qwkArrow")
        b.setImage(rightArrow, for: .normal)
        b.tintColor = QwkColors.buttonColor
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()
    
    
    let youTubeVideoPlayer: YTPlayerView = {
        let p = YTPlayerView()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.layer.cornerRadius = 5
        p.layer.masksToBounds = true
        p.backgroundColor = .clear
        return p
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(youTubeVideoPlayer)
        contentView.addSubview(moreButton)

        NSLayoutConstraint.activate([
            youTubeVideoPlayer.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 0),
            youTubeVideoPlayer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            youTubeVideoPlayer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            youTubeVideoPlayer.heightAnchor.constraint(equalTo: youTubeVideoPlayer.widthAnchor, multiplier: 9.0/16.0),
            
            moreButton.topAnchor.constraint(equalTo: youTubeVideoPlayer.bottomAnchor, constant: 8),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            moreButton.heightAnchor.constraint(equalToConstant: 25),
            moreButton.widthAnchor.constraint(equalToConstant: 25),
        ])
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
    
}
