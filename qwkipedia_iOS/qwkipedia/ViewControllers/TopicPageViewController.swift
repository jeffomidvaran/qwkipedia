//
//  TopicPageViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicPageViewController: UIViewController {
     
    var cellSendType: TopicCellType = .qwkDescription
    @IBOutlet weak var mainTopicPageHeader: UINavigationItem!
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
//        cv.register(TopicHeaderCollectionViewCell.self, forCellWithReuseIdentifier: TopicHeaderCollectionViewCell.identifier)
        cv.register(TopicQwkDescriptionCollectionViewCell.self, forCellWithReuseIdentifier: TopicQwkDescriptionCollectionViewCell.identifier)
        cv.register(TopicVideoCollectionViewCell.self, forCellWithReuseIdentifier: TopicVideoCollectionViewCell.identifier)
        cv.register(TopicImageCollectionViewCell.self, forCellWithReuseIdentifier: TopicImageCollectionViewCell.identifier)
        cv.register(TopicAudioCollectionViewCell.self, forCellWithReuseIdentifier: TopicAudioCollectionViewCell.identifier)
        cv.register(TopicDiscussionCollectionViewCell.self, forCellWithReuseIdentifier: TopicDiscussionCollectionViewCell.identifier)
        cv.register(TopicExpertSummaryCollectionViewCell.self, forCellWithReuseIdentifier: TopicExpertSummaryCollectionViewCell.identifier)
        cv.register(TopicExternalLinksCollectionViewCell.self, forCellWithReuseIdentifier: TopicExternalLinksCollectionViewCell.identifier)
        cv.register(TopicQwkRecomendtionsCollectionViewCell.self, forCellWithReuseIdentifier: TopicQwkRecomendtionsCollectionViewCell.identifier)
        return cv
    }()
    
   
    @IBOutlet weak var setAsFavoriteButtonObject: UIBarButtonItem!
    @IBAction func setAsFavoriteButtonAction(_ sender: Any) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = QwkColors.backgroundColor
        mainTopicPageHeader.title = "Puppy"
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
}


extension TopicPageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath[1]{
//        case 0:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicHeaderCollectionViewCell.identifier , for: indexPath) as! TopicHeaderCollectionViewCell
//            return cell
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicQwkDescriptionCollectionViewCell.identifier , for: indexPath) as! TopicQwkDescriptionCollectionViewCell
            cell.moreButton.addTarget(self, action: #selector(qwkDescriptionMoreButtonPressed), for: .touchUpInside)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicVideoCollectionViewCell.identifier  , for: indexPath) as! TopicVideoCollectionViewCell
            cell.moreButton.addTarget(self, action: #selector(moreVideoButtonPressed), for: .touchUpInside)

            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicImageCollectionViewCell.identifier  , for: indexPath) as! TopicImageCollectionViewCell
            cell.moreButton.addTarget(self, action: #selector(moreImageButtonPressed), for: .touchUpInside)

            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicAudioCollectionViewCell.identifier  , for: indexPath) as! TopicAudioCollectionViewCell
            cell.moreButton.addTarget(self, action: #selector(moreAudioButtonPressed), for: .touchUpInside)
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicDiscussionCollectionViewCell.identifier  , for: indexPath) as! TopicDiscussionCollectionViewCell
            cell.chatButton.addTarget(self, action: #selector(chatButtonPressed), for: .touchUpInside)
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicExpertSummaryCollectionViewCell.identifier  , for: indexPath) as! TopicExpertSummaryCollectionViewCell
            return cell
        case 6:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicExternalLinksCollectionViewCell.identifier  , for: indexPath) as! TopicExternalLinksCollectionViewCell
            cell.moreButton.addTarget(self, action: #selector(moreExternalLinksButtonPressed), for: .touchUpInside)
            return cell
        case 7:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicQwkRecomendtionsCollectionViewCell.identifier , for: indexPath) as! TopicQwkRecomendtionsCollectionViewCell
            cell.moreButton.addTarget(self, action: #selector(moreQwkRecomendationsButtonPressed), for: .touchUpInside)
            return cell
        default:
            fatalError()

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        
        let width: CGFloat = view.safeAreaLayoutGuide.layoutFrame.width
        var height: CGFloat =  0.0
        
        switch indexPath[1]{
//        case 0:
//            height = 30.0
        case 0: // qwk description
            height = 190.0
        case 1: // video
            height = 250.0
        case 2: // image
            height = 200.0
        case 3: // audio
            height = 100.0
        case 4: // discussion
            height = 100.0
        case 5: // expert summary
            height = 600.0
        case 6: // external Links
            height = 145.0
        case 7: // qwk recommedations
            height = 205.0
        default:
            fatalError()
        }
        return CGSize(width: width, height: height)
    }
    
    @objc func qwkDescriptionMoreButtonPressed(sender: UIButton!) {
        cellSendType = .qwkDescription
        performSegue(withIdentifier: "showPageSegue", sender: self)
    }
    @objc func moreVideoButtonPressed(sender: UIButton!) {
        cellSendType = .video
        performSegue(withIdentifier: "showPageSegue", sender: self)
    }
    @objc func moreImageButtonPressed(sender: UIButton!) {
        cellSendType = .image
        performSegue(withIdentifier: "showPageSegue", sender: self)
    }
    @objc func moreAudioButtonPressed(sender: UIButton!) {
        cellSendType = .audio
        performSegue(withIdentifier: "showPageSegue", sender: self)
    }
    @objc func moreExternalLinksButtonPressed(sender: UIButton!) {
        cellSendType = .externalLink
        performSegue(withIdentifier: "showPageSegue", sender: self)
    }
    @objc func moreQwkRecomendationsButtonPressed(sender: UIButton!) {
        cellSendType = .qwkRecommedation
        performSegue(withIdentifier: "showPageSegue", sender: self)
    }

    @objc func chatButtonPressed(sender: UIButton!) {
        cellSendType = .discussion
        performSegue(withIdentifier: "discussionPageSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPageSegue" {
            let controller = segue.destination as! MorePageViewController
            controller.value = "from topic vc"
            controller.cellType = cellSendType
        } else if segue.identifier == "discussionPageSegue" {
            let controller = segue.destination as! DiscussionViewController
            controller.value = "chat from topic vc"
        }
    }
}
