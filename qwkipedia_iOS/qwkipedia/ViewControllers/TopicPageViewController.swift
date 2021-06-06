//
//  TopicPageViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseUI

class TopicPageViewController: UIViewController, UIGestureRecognizerDelegate {
     
    var topic = ""
    var cellSendType: TopicCellType = .qwkDescription
    var urlStringToSend = ""
    var topDesc = ""
    
    let db = Firestore.firestore()
    let storage = Storage.storage().reference()

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
//        mainTopicPageHeader.backBarButtonItem?.tintColor = QwkColors.buttonColor
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        mainTopicPageHeader.title = topic
        favoriteButton.tintColor = QwkColors.buttonColor
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
        ])
        loadData()
    }
    

    // MARK: DATA load data for database here and put in the qwkDataFromServer
    var qwkDataFromServer = QwkDataFromServer()
    func loadData() {
        let docRef = db.collection("topics-v2").document(topic)
        docRef.getDocument() { (document, error) in
            if let document = document, document.exists {
                
                let dataDescription = document.get("topDesc")
                self.qwkDataFromServer.qwkDescriptionText = (dataDescription as? String)!
                self.qwkDataFromServer.videoURL = (document.get("topURL") as? String)!
                
                
                let path = (document.get("title")as?String)! + ".png"
                let imageRef = self.storage.child("topicImages").child(path)
                    imageRef.getData(maxSize: 1 * 5000 * 5000) { data, error in
                    if let error = error {
                        print(error)
                      } else {
                        // image data is returned
                        let image = UIImage(data: data!)
                        self.qwkDataFromServer.qwkImage = image
                        DispatchQueue.main.async {
                            self.collectionView.reloadData()
                        }
                      }

                    }

                self.qwkDataFromServer.sortedTopExternalLinks = [
                        QwkExternalLink(url: "https://www.petfinder.com/pet-adoption/dog-adoption/puppies-for-adoption/", title: "PetFinder.com"),
                        QwkExternalLink(url: "https://www.thesprucepets.com/puppies-4162145",title: "TheSprucePets.com"),
                        QwkExternalLink(url: "https://www.puppyspot.com",title: "ThePuppySpot.com")
                    ]
                    self.qwkDataFromServer.voteCount = 9
                
                } else {
                    print("Document does not exist")
                }
        }
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        let docRef = db.collection("topics-v2").document(topic)
//        docRef.getDocument() { (document, error) in
//            if let document = document, document.exists {
//
//                let dataDescription = document.get("topDesc")
//                self.qwkDataFromServer.qwkDescriptionText = (dataDescription as? String)!
//                self.qwkDataFromServer.videoURL = (document.get("topURL") as? String)!
//
//
//                let path = (document.get("title")as?String)! + ".png"
//                let imageRef = self.storage.child("topicImages").child(path)
//                    imageRef.getData(maxSize: 1 * 5000 * 5000) { data, error in
//                    if let error = error {
//                        print(error)
//                      } else {
//                        // image data is returned
//                        let image = UIImage(data: data!)
//                        self.qwkDataFromServer.qwkImage = image
//                        DispatchQueue.main.async {
//                            self.collectionView.reloadData()
//                        }
//                      }
//
//                    }
//
//                self.qwkDataFromServer.sortedTopExternalLinks = [
//                        QwkExternalLink(url: "https://www.petfinder.com/pet-adoption/dog-adoption/puppies-for-adoption/", title: "PetFinder.com"),
//                        QwkExternalLink(url: "https://www.thesprucepets.com/puppies-4162145",title: "TheSprucePets.com"),
//                        QwkExternalLink(url: "https://www.puppyspot.com",title: "ThePuppySpot.com")
//                    ]
//                    self.qwkDataFromServer.voteCount = 9
//
//                } else {
//                    print("Document does not exist")
//                }
//        }
//
//    }
    
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
            cell.backgroundColor = .systemBackground
            cell.addLine(position: .bottom, color: QwkColors.outlineColor, width: 0.5)
            cell.qwkDescriptionTextView.text = qwkDataFromServer.qwkDescriptionText
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicVideoCollectionViewCell.identifier  , for: indexPath) as! TopicVideoCollectionViewCell
            cell.moreButton.addTarget(self, action: #selector(moreVideoButtonPressed), for: .touchUpInside)
            cell.backgroundColor = .systemBackground
            cell.addLine(position: .bottom, color: QwkColors.outlineColor, width: 0.5)
            if let fullVideoURL = qwkDataFromServer.videoURL {
                let youTubeVideoTag = fullVideoURL.deletingPrefix("https://www.youtube.com/watch?v=")
                cell.youTubeVideoPlayer.load(withVideoId: youTubeVideoTag)
            }
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
            cell.imageView.image = qwkDataFromServer.qwkImage
            cell.backgroundColor = .systemBackground
            cell.addLine(position: .bottom, color: QwkColors.outlineColor, width: 0.5)
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicDiscussionCollectionViewCell.identifier  , for: indexPath) as! TopicDiscussionCollectionViewCell
            cell.chatButton.addTarget(self, action: #selector(chatButtonPressed), for: .touchUpInside)
            cell.backgroundColor = .systemBackground
            cell.addLine(position: .bottom, color: QwkColors.outlineColor, width: 0.5)
            cell.topic = topic
            return cell
        case 4 :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicExternalLinksCollectionViewCell.identifier  , for: indexPath) as! TopicExternalLinksCollectionViewCell
            cell.moreButton.addTarget(self, action: #selector(moreExternalLinksButtonPressed), for: .touchUpInside)
            
            var numberOfCells = 0
            if let _ = qwkDataFromServer.sortedTopExternalLinks?.count {
                numberOfCells = qwkDataFromServer.sortedTopExternalLinks!.count > 3 ? 3 : qwkDataFromServer.sortedTopExternalLinks!.count
                cell.numberOfCells = numberOfCells

                if(numberOfCells > 0) {
                    cell.urlView1.url = qwkDataFromServer.sortedTopExternalLinks![0].url!
                    cell.label1.text = qwkDataFromServer.sortedTopExternalLinks![0].title ?? "No Title Set"
                }
                if(numberOfCells > 1) {
                    cell.urlView2.url = qwkDataFromServer.sortedTopExternalLinks![1].url!
                    cell.label2.text =  qwkDataFromServer.sortedTopExternalLinks![1].title ?? "No Title Set"
                }
                if(numberOfCells > 2) {
                    cell.urlView3.url = qwkDataFromServer.sortedTopExternalLinks![2].url!
                    cell.label3.text =  qwkDataFromServer.sortedTopExternalLinks![2].title ?? "No Title Set"
                }
            }
            cell.backgroundColor = .systemBackground
            cell.addLine(position: .bottom, color: QwkColors.outlineColor, width: 0.5)

            
        // TODO: potential memory issue
            cell.urlViewButtonTapAction = { (url:String) in
                self.urlStringToSend = url
                self.performSegue(withIdentifier: "externalLinkWebViewSegue", sender: self)
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
        case 0:
            let dummyUITextField = UITextView()
            dummyUITextField.text = qwkDataFromServer.qwkDescriptionText
            dummyUITextField.isScrollEnabled = false
            let newSize = dummyUITextField.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
            if(newSize.height == 0){
                height = 0
            }else {
                height = newSize.height + 20 // extra points for author name and vote count
            }
        case 1:
            height = width == 0 ? 0 : ((width/16) * 9) + 40
        case 2:
            if let _ = qwkDataFromServer.qwkImage {
                let imageRatio =  qwkDataFromServer.qwkImage!.size.width / qwkDataFromServer.qwkImage!.size.height
                height = (width / imageRatio) + 40
            } else {
                height = 0
            }
        case 3:
            height = 300
        case 4:
//            height = 133
            height = 165
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
            controller.cellType = cellSendType
            controller.topic = topic
        } else if segue.identifier == "discussionPageSegue" {
            let controller = segue.destination as! DiscussionViewController
            controller.topic = topic
        } else if segue.identifier == "externalLinkWebViewSegue" {
            let vc = segue.destination as! ExternalLinkWebViewController
            vc.sentUrlString = urlStringToSend
        }
    }

}
