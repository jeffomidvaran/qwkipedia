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


//    fileprivate let titleLabel: UILabel = {
//        let l = UILabel()
//        l.text = "Top Video"
//        l.translatesAutoresizingMaskIntoConstraints = false
//        return l
//    }()

    let moreButton: UIButton = {
        let b = UIButton()
        b.setTitle("More", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()
    
    
    let player: YTPlayerView = {
        let p = YTPlayerView()
        p.translatesAutoresizingMaskIntoConstraints = false
        p.load(withVideoId: "JJunp9xo4uA")
        return p
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(player)
        contentView.addSubview(moreButton)
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
        contentView.layer.borderWidth = 0.5

        NSLayoutConstraint.activate([
            player.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 0),
            player.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            player.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            player.heightAnchor.constraint(equalTo: player.widthAnchor, multiplier: 9.0/16.0),

            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
    
    
}
