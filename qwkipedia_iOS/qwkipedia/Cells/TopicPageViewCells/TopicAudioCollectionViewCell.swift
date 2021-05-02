//
//  TopicAudioCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit
import AVFoundation

class TopicAudioCollectionViewCell: UICollectionViewCell {
    public static let identifier = "topicPageAudioCell"
    var player: AVAudioPlayer?



    fileprivate let titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Top Audio"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    fileprivate let playButton: UIButton = {
        let _button = UIButton()
        _button.setTitle("Play/Stop", for: .normal)
        _button.setTitleColor(QwkColors.buttonColor, for: .normal)
        _button.translatesAutoresizingMaskIntoConstraints = false
        return _button
    }()

    fileprivate let moreButton: UIButton = {
        let b = UIButton()
        b.setTitle("More", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(playButton)
        contentView.addSubview(titleLabel)
        contentView.addSubview(moreButton)
        playButton.addTarget(self, action: #selector(touchUpInsideAction(_:)), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(moreButtonPressed), for: .touchUpInside)

        
        contentView.layer.cornerRadius = 10
        contentView.layer.borderColor = QwkColors.outlineColor.cgColor
        contentView.layer.borderWidth = 0.5
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: playButton.topAnchor),

            // playButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            // playButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            playButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            playButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8), 
            moreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8), 
        ])
    }


    @objc func touchUpInsideAction(_ sender: UIButton) {
        print("audio button was pressed")
        let path = Bundle.main.path(forResource: "puppySound", ofType: "wav")!
        let url  = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("cannot play sound")
        }
    }
    
    @objc func moreButtonPressed(sender: UIButton!) {
        print("audio more pressed")
    }

    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
}
