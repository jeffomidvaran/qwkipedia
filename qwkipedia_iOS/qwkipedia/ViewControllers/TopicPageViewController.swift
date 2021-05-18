//
//  TopicPageViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicPageViewController: UIViewController, UIGestureRecognizerDelegate {
     
    var cellSendType: TopicCellType = .qwkDescription
    var urlStringToSend = ""

    @IBOutlet weak var mainTopicPageHeader: UINavigationItem!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TopicQwkDescriptionCollectionViewCell.self, forCellWithReuseIdentifier: TopicQwkDescriptionCollectionViewCell.identifier)
        cv.register(TopicVideoCollectionViewCell.self, forCellWithReuseIdentifier: TopicVideoCollectionViewCell.identifier)
        cv.register(TopicImageCollectionViewCell.self, forCellWithReuseIdentifier: TopicImageCollectionViewCell.identifier)
        cv.register(TopicAudioCollectionViewCell.self, forCellWithReuseIdentifier: TopicAudioCollectionViewCell.identifier)
        cv.register(TopicDiscussionCollectionViewCell.self, forCellWithReuseIdentifier: TopicDiscussionCollectionViewCell.identifier)
        cv.register(TopicExpertSummaryCollectionViewCell.self, forCellWithReuseIdentifier: TopicExpertSummaryCollectionViewCell.identifier)
        cv.register(TopicExternalLinksCollectionViewCell.self, forCellWithReuseIdentifier: TopicExternalLinksCollectionViewCell.identifier)
        cv.register(TopicQwkRecomendtionsCollectionViewCell.self, forCellWithReuseIdentifier: TopicQwkRecomendtionsCollectionViewCell.identifier)
        cv.backgroundColor = .clear
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
//        collectionView.backgroundColor = QwkColors.backgroundColor
        mainTopicPageHeader.title = "Puppy"
        favoriteButton.tintColor = QwkColors.buttonColor
        
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
    }
    
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
}


extension TopicPageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath[1]{
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicQwkDescriptionCollectionViewCell.identifier , for: indexPath) as! TopicQwkDescriptionCollectionViewCell
            cell.moreButton.addTarget(self, action: #selector(qwkDescriptionMoreButtonPressed), for: .touchUpInside)
            cell.backgroundColor = .clear
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicVideoCollectionViewCell.identifier  , for: indexPath) as! TopicVideoCollectionViewCell
            cell.moreButton.addTarget(self, action: #selector(moreVideoButtonPressed), for: .touchUpInside)
            cell.backgroundColor = .clear
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicImageCollectionViewCell.identifier  , for: indexPath) as! TopicImageCollectionViewCell
            cell.moreButton.addTarget(self, action: #selector(moreImageButtonPressed), for: .touchUpInside)
            cell.imageButtonTapAction = {
                print("this is the closure")
                let newImageView = UIImageView(image: cell.imageView.image)
                newImageView.frame = UIScreen.main.bounds
                newImageView.backgroundColor = .black
                newImageView.contentMode = .scaleAspectFit
                newImageView.isUserInteractionEnabled = true
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissFullscreenImage))
                let swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.dismissFullscreenImage))
                swipe.direction = .down

                newImageView.addGestureRecognizer(tap)
                newImageView.addGestureRecognizer(swipe)
                self.view.addSubview(newImageView)
                self.navigationController?.isNavigationBarHidden = true
                self.tabBarController?.tabBar.isHidden = true
            }

            cell.backgroundColor = .clear
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicDiscussionCollectionViewCell.identifier  , for: indexPath) as! TopicDiscussionCollectionViewCell
            cell.chatButton.addTarget(self, action: #selector(chatButtonPressed), for: .touchUpInside)
            cell.backgroundColor = .clear
            return cell
        case 4 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicExternalLinksCollectionViewCell.identifier  , for: indexPath) as! TopicExternalLinksCollectionViewCell
            cell.moreButton.addTarget(self, action: #selector(moreExternalLinksButtonPressed), for: .touchUpInside)
            let numberOfCells = DummyData.urls.count > 3 ? 3 : DummyData.urls.count
            cell.numberOfCells = numberOfCells
            cell.backgroundColor = .clear
            
        // TODO: potential memory issue
            cell.urlViewButtonTapAction = { (url:String) in
                self.urlStringToSend = url
                self.performSegue(withIdentifier: "externalLinkWebViewSegue", sender: self)
            }
            
            if(numberOfCells > 0) {
                cell.urlView1.url = DummyData.urls[0][1]
                cell.label1.text = DummyData.urls[0][0]
            }
            if(numberOfCells > 1) {
                cell.urlView2.url = DummyData.urls[1][1]
                cell.label2.text = DummyData.urls[1][0]
            }
            if(numberOfCells > 2) {
                cell.urlView3.url = DummyData.urls[2][1]
                cell.label3.text = DummyData.urls[2][0]
            }
            return cell
        default:
            fatalError()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.safeAreaLayoutGuide.layoutFrame.width-16
        var height: CGFloat = 200.0
        switch indexPath[1]{
        case 0...3:
            height = 200
        case 4:
            height = 133
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
    
    func recieveDataFromTableViewAndSegue(urlString: String){
        print("recieved by VC \(urlString)")
        performSegue(withIdentifier: "externalLinkWebViewSegue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPageSegue" {
            let controller = segue.destination as! MorePageViewController
            controller.value = "from topic vc"
            controller.cellType = cellSendType
        } else if segue.identifier == "discussionPageSegue" {
            let controller = segue.destination as! DiscussionViewController
            controller.value = "chat from topic vc"
        } else if segue.identifier == "externalLinkWebViewSegue" {
            let vc = segue.destination as! ExternalLinkWebViewController
            vc.sentUrlString = urlStringToSend
        }
    }
    
    
    
}
