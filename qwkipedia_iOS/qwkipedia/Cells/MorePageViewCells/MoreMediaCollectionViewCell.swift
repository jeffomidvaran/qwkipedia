//
//  MoreQwkDescriptionCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/2/21.
//

import UIKit
import youtube_ios_player_helper
import AVFoundation


class MoreMediaCollectionViewCell: UICollectionViewCell {

    public static let identifier = "MoreMediaCollectionViewCellId"
    var player: AVAudioPlayer?
    var surname: String = ""
    var urlString: String = ""

    
    var cellType: TopicCellType = .qwkDescription {
        didSet {
            switch cellType{
            case .qwkDescription:
                print("qwktype called ")
                let qwkDescriptionTextView = UITextView()
                qwkDescriptionTextView.text = DummyData.qwkDescription
                qwkDescriptionTextView.isEditable = false
                qwkDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(qwkDescriptionTextView)
                
                NSLayoutConstraint.activate([
                    qwkDescriptionTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    qwkDescriptionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                    qwkDescriptionTextView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
                    qwkDescriptionTextView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 8),
                    qwkDescriptionTextView.topAnchor.constraint(equalTo: reportButton.bottomAnchor, constant: 8),
                    qwkDescriptionTextView.bottomAnchor.constraint(equalTo: suggestButton.topAnchor, constant: -8),
                ])

            case .video:
                print("video type called")
                let player: YTPlayerView = YTPlayerView()
                player.load(withVideoId: "WDlu1OhvYBM")
                player.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(player)
                
                NSLayoutConstraint.activate([
                    player.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    player.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                    player.heightAnchor.constraint(equalTo: player.widthAnchor, multiplier: 9.0/16.0),
                    player.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
                    player.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 8),
                    player.topAnchor.constraint(equalTo: reportButton.bottomAnchor, constant: 8),
                    player.bottomAnchor.constraint(equalTo: suggestButton.topAnchor, constant: -8),
                ])
            case .image:
                let imageView = UIImageView()
                imageView.image = #imageLiteral(resourceName: "puppy")
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.contentMode = .scaleAspectFit
                contentView.addSubview(imageView)
                NSLayoutConstraint.activate([
                    imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                    imageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
                    imageView.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 8),
                    imageView.topAnchor.constraint(equalTo: reportButton.bottomAnchor, constant: 8),
                    imageView.bottomAnchor.constraint(equalTo: suggestButton.topAnchor, constant: -8),
                ])
            case .audio:
                let playButton = UIButton()
                playButton.setTitle("Play/Stop", for: .normal)
                playButton.setTitleColor(QwkColors.buttonColor, for: .normal)
                playButton.addTarget(self, action: #selector(playAudio(_:)), for: .touchUpInside)
                playButton.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(playButton)
                NSLayoutConstraint.activate([
                    playButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                    playButton.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
                    playButton.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 8),
                    playButton.topAnchor.constraint(equalTo: reportButton.bottomAnchor, constant: 8),
                    playButton.bottomAnchor.constraint(equalTo: suggestButton.topAnchor, constant: -8),
                ])
    
            case .externalLink:
                let tv = UITextView()
                tv.text = "No Link Set"
                tv.isEditable = false
                tv.textAlignment = .center
                tv.translatesAutoresizingMaskIntoConstraints = false
                let attributedString = NSMutableAttributedString(string: surname)
                let url = URL(string: urlString)!
                attributedString.setAttributes([.link: url], range: NSMakeRange(0, surname.count))
                tv.attributedText = attributedString
                tv.isUserInteractionEnabled = true
                tv.isEditable = false
                tv.centerText()
                contentView.addSubview(tv)
                NSLayoutConstraint.activate([
                    tv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    tv.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                    tv.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
                    tv.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 8),
                    tv.topAnchor.constraint(equalTo: reportButton.bottomAnchor, constant: 8),
                    tv.bottomAnchor.constraint(equalTo: suggestButton.topAnchor, constant: -8),
                ])


            default:
                fatalError()
            }
        }
    }
   
    var numberOfVotes = 0 {
        didSet {
            voterButtons.voteCount = numberOfVotes
        }
    }
    var isAuthor = false {
        didSet {
            if(isAuthor) {
                reportButton.isHidden = false
                editButton.isHidden = true
            }else {
                reportButton.isHidden = true
                editButton.isHidden = false
            }
        }
    }

    fileprivate let authorLabel: UILabel = {
        let l = UILabel()
        l.text = "John Doe"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    let reportButton: UIButton = {
        let b = UIButton()
        b.setTitle("Report", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()

    let editButton: UIButton = {
        let b = UIButton()
        b.setTitle("︎Edit", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()

    let suggestButton: UIButton = {
        let b = UIButton()
        b.setTitle("︎Suggest", for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()

    fileprivate let voterButtons: VoterView = {
        let vv = VoterView()
        vv.initilizeCounter()
        vv.translatesAutoresizingMaskIntoConstraints = false
        vv.voterColor = QwkColors.buttonColor
        return vv
    }()
    
    fileprivate let profilePic: UIImageView = {
        let v = UIImageView()
        v.image = #imageLiteral(resourceName: "janeDoe")
        v.contentMode = .scaleToFill
        v.layer.masksToBounds = false
        v.layer.cornerRadius = 25/2
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        print("the init was called")


        contentView.addSubview(profilePic)
        contentView.addSubview(authorLabel)
        contentView.addSubview(reportButton)
        contentView.addSubview(editButton)
        contentView.addSubview(suggestButton)
        contentView.addSubview(voterButtons)
        
        editButton.addTarget(self, action: #selector(editButtonPressed(_:)), for: .touchUpInside)

        
        
        

        
        NSLayoutConstraint.activate([
            profilePic.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            profilePic.centerYAnchor.constraint(equalTo: authorLabel.centerYAnchor),
            profilePic.heightAnchor.constraint(equalToConstant: 25),
            profilePic.widthAnchor.constraint(equalToConstant: 25),
            
            authorLabel.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 8),
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            editButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            reportButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            reportButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            suggestButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            suggestButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            voterButtons.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            voterButtons.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        ])
    }
    
    @objc func editButtonPressed(_ sender: UIButton) {
        print("edit button pressed")
        editButtonTapAction?()
    }

    var editButtonTapAction : (()->())?

    
    
    @objc func playAudio(_ sender: UIButton) {
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
    
    required init?(coder: NSCoder) {
        fatalError("Init coder not implemented")
    }
}


