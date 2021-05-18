//
//  EditDataViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/9/21.
//

import UIKit
import youtube_ios_player_helper


class EditDataViewController: UIViewController{
    var viewType: TopicCellType = .video
    var videoURL: String = ""
    var viewHasContent = false {
        didSet {
            deletePostButton.isHidden = !viewHasContent
            suggestionsCollectionView.isHidden = !viewHasContent
            suggestionsLabel.isHidden = !viewHasContent
        }
    }
    
    
    /*
        uitextfield
        uiLabel
        delete button
        collectionView with suggestions
     */
    
    let textView: UITextView = {
        let v = UITextView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        v.text = "This is a qwk description of why puppies are cool!!!"
        return v
    }()
    
    let urlEntryField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.clearsOnInsertion = true
        tf.returnKeyType = .done
        tf.autocorrectionType = .no
        return tf
    }()
    
    let videoPlayer: YTPlayerView = {
        let vp = YTPlayerView()
        vp.translatesAutoresizingMaskIntoConstraints = false
        vp.load(withVideoId: "WDlu1OhvYBM")
        return vp
    }()
     
    let suggestionsLabel: UILabel = {
        var l = UILabel()
        l.text = "Suggestions"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
   
    let deletePostButton: UIButton = {
        var b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Delete Post", for: .normal)
        b.setTitleColor(QwkColors.deletebuttonColor, for: .normal)
        return b
    }()
    
    let spacer: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
  

    fileprivate let suggestionsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(SuggestionCellCollectionViewCell.self, forCellWithReuseIdentifier: SuggestionCellCollectionViewCell.identifier)
//        cv.backgroundColor = QwkColors.backgroundColor
        return cv
    }()
    
    var videoHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        suggestionsCollectionView.dataSource = self
        suggestionsCollectionView.delegate = self
        urlEntryField.delegate = self
        
        deletePostButton.addTarget(self, action: #selector(deletePostPressed), for: .touchUpInside)

        
        super.view.addSubview(urlEntryField)
        super.view.addSubview(textView)
        super.view.addSubview(deletePostButton)
        super.view.addSubview(spacer)
        super.view.addSubview(suggestionsLabel)
        super.view.addSubview(suggestionsCollectionView)
        super.view.addSubview(videoPlayer)
        
        if(videoURL != "") {
            
            videoHeightConstraint = NSLayoutConstraint(item: videoPlayer,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: videoPlayer,
                                                       attribute: .width,
                                                       multiplier: 9.0/16.0,
                                                       constant: 0.0)
            videoHeightConstraint.isActive = true
            videoPlayer.load(withVideoId: videoURL)
            viewHasContent = true
        } else {
            videoHeightConstraint = NSLayoutConstraint(item: videoPlayer,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: videoPlayer,
                                                       attribute: .height,
                                                       multiplier: 0,
                                                       constant: 0.0)
            videoHeightConstraint.isActive = true
        }
        

        
        
        
        NSLayoutConstraint.activate([
            urlEntryField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            urlEntryField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            urlEntryField.heightAnchor.constraint(equalToConstant: 50),
            urlEntryField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),

            videoPlayer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            videoPlayer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            videoPlayer.topAnchor.constraint(equalTo: urlEntryField.bottomAnchor, constant: 8),

            deletePostButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            deletePostButton.topAnchor.constraint(equalTo: videoPlayer.bottomAnchor, constant: 8),
            
            spacer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            spacer.trailingAnchor.constraint(equalTo: deletePostButton.leadingAnchor, constant: -8),
            spacer.topAnchor.constraint(equalTo: videoPlayer.bottomAnchor, constant: 8),
            spacer.heightAnchor.constraint(equalTo: deletePostButton.heightAnchor),
            
            suggestionsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            suggestionsLabel.topAnchor.constraint(equalTo: spacer.bottomAnchor, constant: 8),
            
            suggestionsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            suggestionsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            suggestionsCollectionView.topAnchor.constraint(equalTo: suggestionsLabel.bottomAnchor, constant: 8),
            suggestionsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
        ])
        
        if(viewHasContent == false) {
            deletePostButton.isHidden = true
            suggestionsLabel.isHidden = true
            suggestionsCollectionView.isHidden = true
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        switch viewType {
        case .qwkDescription:
            urlEntryField.placeholder = "Enter 1000 Word Description"
        case .video:
            urlEntryField.placeholder = "Enter New YouTube Link"
        case .audio:
            urlEntryField.placeholder = "Upload Audiofile"
        case .externalLink:
            urlEntryField.placeholder = "Enter Link"
        case .image:
            urlEntryField.placeholder = "Upload Image"
        default:
            fatalError()
        }
    }
    
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
    

    @objc func deletePostPressed(sender: UIButton!) {
        viewHasContent = false
        suggestionsCollectionView.reloadData()
        videoHeightConstraint.isActive = false
        videoHeightConstraint = NSLayoutConstraint(item: videoPlayer,
                                                   attribute: .height,
                                                   relatedBy: .equal,
                                                   toItem: videoPlayer,
                                                   attribute: .height,
                                                   multiplier: 0,
                                                   constant: 0.0)
        videoHeightConstraint.isActive = true
    }
    
    
    func setVideoGivenURL(url:String) {
        let youTubePrefix = "https://www.youtube.com/watch?v="
        if(verifyUrl(urlString: url) && url.starts(with: youTubePrefix)) {
            let videoId = String(url.dropFirst(youTubePrefix.count))
            videoPlayer.load(withVideoId: videoId)
            urlEntryField.text?.removeAll()
            viewHasContent = true
        }
    }
}

extension EditDataViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        urlEntryField.resignFirstResponder()
        if let urlEntry = urlEntryField.text {
            let youTubePrefix = "https://www.youtube.com/watch?v="
            if(verifyUrl(urlString: urlEntry) && urlEntry.starts(with: youTubePrefix)) {
                setVideoGivenURL(url: urlEntry)

                videoHeightConstraint.isActive = false
                videoHeightConstraint = NSLayoutConstraint(item: videoPlayer,
                                                           attribute: .height,
                                                           relatedBy: .equal,
                                                           toItem: videoPlayer,
                                                           attribute: .width,
                                                           multiplier: 9.0/16.0,
                                                           constant: 0.0)
                videoHeightConstraint.isActive = true
                viewHasContent = true
            } else {
                urlEntryField.text?.removeAll()
            }
        }
        return true
    }
}


extension EditDataViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggestionCellCollectionViewCell.identifier, for: indexPath) as! SuggestionCellCollectionViewCell
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.safeAreaLayoutGuide.layoutFrame.width-16.0
        let height: CGFloat =  100.0
        return CGSize(width: width, height: height)
    }
}



/*
    https://www.youtube.com/watch?v=JJunp9xo4uA
*/



