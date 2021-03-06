//
//  MoreQwkDescriptionCollectionViewCell.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/2/21.
//

import UIKit
import youtube_ios_player_helper
import AVFoundation


class MoreMediaCollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {

    public static let identifier = "MoreMediaCollectionViewCellId"
    var player: AVAudioPlayer?
//    var webSiteName: String?
    var webSiteURL: String?
    var youTubeVideoURL: String?
    var qwkImage: UIImage?
    var qwkDescriptionTextView = UITextView()
    let youTubeVideoPlayer: YTPlayerView = YTPlayerView()
    let imageView = UIImageView()
//    imageView.image = #imageLiteral(resourceName: "Image")
    
    
    var urlLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = "Label Not Set"
        l.textColor = QwkColors.buttonColor
        return l
    }()
    
    let urlView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let urlImage: UIImageView = {
        let iv = UIImageView()
        let globeImage = UIImage(systemName: "globe")
        iv.image = globeImage
        iv.tintColor = QwkColors.buttonColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    
    var cellType: TopicCellType = .qwkDescription {
        didSet {
            switch cellType{
            case .qwkDescription:
                qwkDescriptionTextView.isEditable = false
                qwkDescriptionTextView.translatesAutoresizingMaskIntoConstraints = false
                qwkDescriptionTextView.isScrollEnabled = false
                contentView.addSubview(qwkDescriptionTextView)
                
                NSLayoutConstraint.activate([
                    qwkDescriptionTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    qwkDescriptionTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                    qwkDescriptionTextView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 0),
                    qwkDescriptionTextView.topAnchor.constraint(equalTo: voterButtons.bottomAnchor, constant: 0),
                    qwkDescriptionTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                ])

            case .video:
                youTubeVideoPlayer.translatesAutoresizingMaskIntoConstraints = false
                contentView.addSubview(youTubeVideoPlayer)

                NSLayoutConstraint.activate([
                    youTubeVideoPlayer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    youTubeVideoPlayer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                    youTubeVideoPlayer.heightAnchor.constraint(equalTo: youTubeVideoPlayer.widthAnchor, multiplier: 9.0/16.0),
                    youTubeVideoPlayer.topAnchor.constraint(equalTo: voterButtons.bottomAnchor, constant: 8),
                    
                ])
            case .image:
                
                imageView.translatesAutoresizingMaskIntoConstraints = false
                imageView.contentMode = .scaleAspectFit
                contentView.addSubview(imageView)
                NSLayoutConstraint.activate([
                    imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                    imageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
                    imageView.topAnchor.constraint(equalTo: voterButtons.bottomAnchor, constant: 8),
                    imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                ])
//            case .audio:
//                let playButton = UIButton()
//                playButton.setTitle("Play/Stop", for: .normal)
//                playButton.setTitleColor(QwkColors.buttonColor, for: .normal)
//                playButton.addTarget(self, action: #selector(playAudio(_:)), for: .touchUpInside)
//                playButton.translatesAutoresizingMaskIntoConstraints = false
//                contentView.addSubview(playButton)
//                NSLayoutConstraint.activate([
//                    playButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
//                    playButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
//                    playButton.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
//                    playButton.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 8),
//                    playButton.topAnchor.constraint(equalTo: reportButton.bottomAnchor, constant: 8),
//                    playButton.bottomAnchor.constraint(equalTo: suggestButton.topAnchor, constant: -8),
//                ])
//
            case .externalLink:
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(url1Clicked(_:)))
                tapGesture.delegate = self
                urlView.addGestureRecognizer(tapGesture)
        
                let sizeOfConstantAroundGlobe: CGFloat = 12.0
                contentView.addSubview(urlView)
                contentView.addSubview(urlLabel)
                contentView.addSubview(urlImage)
                
                NSLayoutConstraint.activate([
                    urlView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
                    urlView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
                    urlView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 8),
                    urlView.topAnchor.constraint(equalTo: voterButtons.bottomAnchor, constant: 8),
                    urlView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                    
                    
                    urlImage.leadingAnchor.constraint(equalTo: urlView.leadingAnchor, constant: sizeOfConstantAroundGlobe),
                    urlImage.topAnchor.constraint(equalTo: urlView.topAnchor, constant: sizeOfConstantAroundGlobe),
                    urlImage.bottomAnchor.constraint(equalTo: urlView.bottomAnchor, constant: -sizeOfConstantAroundGlobe),
                    urlImage.heightAnchor.constraint(equalTo: urlImage.widthAnchor),
                    
                    urlLabel.leadingAnchor.constraint(equalTo: urlImage.trailingAnchor, constant: sizeOfConstantAroundGlobe),
                    urlLabel.centerYAnchor.constraint(equalTo: urlView.centerYAnchor),
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

    let authorLabel: UILabel = {
        let l = UILabel()
        l.text = "Jane Doe"
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

    var isCurrentUsersPost = true {
        didSet {
            editButton.isHidden = !isCurrentUsersPost
            voterButtons.isHidden = isCurrentUsersPost
        }
    }
    
    let editButton: UIButton = {
        let b = UIButton()
        let squareAndPencil = UIImage(systemName: "square.and.pencil")
        b.setImage(squareAndPencil, for: .normal)
        b.tintColor = QwkColors.buttonColor
        b.translatesAutoresizingMaskIntoConstraints = false
        b.isHidden = true
        b.setTitleColor(QwkColors.buttonColor, for: .normal)
        return b
    }()
    

    let suggestButton: UIButton = {
        let b = UIButton()
        b.setTitle("???Suggest", for: .normal)
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
    
    let profilePic: UIImageView = {
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

        contentView.addSubview(profilePic)
        contentView.addSubview(authorLabel)
        contentView.addSubview(editButton)
        contentView.addSubview(voterButtons)
        
        contentView.addBottomBorderWithColor(color: QwkColors.outlineColor, width: 0.5)
//        contentView.addShadow(offset: CGSize.init(width: 0, height: 3), color: QwkColors.outlineColor, radius: 2.0, opacity: 0.5)
        
        
        editButton.addTarget(self, action: #selector(editButtonPressed(_:)), for: .touchUpInside)
        
        
        
        NSLayoutConstraint.activate([
            authorLabel.leadingAnchor.constraint(equalTo: profilePic.trailingAnchor, constant: 8),
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            profilePic.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            profilePic.centerYAnchor.constraint(equalTo: authorLabel.centerYAnchor),
            
            profilePic.heightAnchor.constraint(equalToConstant: 25),
            profilePic.widthAnchor.constraint(equalToConstant: 25),
            
            voterButtons.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            voterButtons.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            editButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            editButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
        
    }
   
    
    var editButtonTapActionQwkDescription : ((String)->())?
    var editButtonTapActionVideo : ((String)->())?
    var editButtonTapActionImage : ((UIImage)->())?
    var editButtonTapActionExternalLink : ((String, String)->())?
    @objc func editButtonPressed(_ sender: UIButton) {
        switch cellType {
        case .qwkDescription:
            editButtonTapActionQwkDescription!(qwkDescriptionTextView.text)
        case .video:
            editButtonTapActionVideo!(youTubeVideoURL!)
        case .image:
            editButtonTapActionImage!(imageView.image!)
        case .externalLink:
            editButtonTapActionExternalLink!(webSiteURL!, urlLabel.text!)
        default:
            fatalError()
        }
        

    }

    var externalURLViewButtonTapAction : ((String, String)->())?
    @objc func url1Clicked(_ sender: UITapGestureRecognizer) {
        externalURLViewButtonTapAction!(webSiteURL!, urlLabel.text!)
    }
    
    
    @objc func playAudio(_ sender: UIButton) {
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


