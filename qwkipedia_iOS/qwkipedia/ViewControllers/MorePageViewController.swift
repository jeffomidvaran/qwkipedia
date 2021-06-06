//
//  MorePageViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/2/21.
//

import UIKit
import youtube_ios_player_helper
import Firebase
import FirebaseUI
import FirebaseStorage

class MorePageViewController: UIViewController {
 
    var cellType: TopicCellType = .qwkDescription
    var topic = ""
    let db = Firestore.firestore()
    let storage = Storage.storage()
    
    @IBOutlet weak var addNewEntryButtonObject: UIBarButtonItem!
    var qwkDataArray: [QwkDataFromServer] = []
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MoreMediaCollectionViewCell.self, forCellWithReuseIdentifier: MoreMediaCollectionViewCell.identifier)
        return cv
    }()
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        view.addSubview(collectionView)
//        collectionView.backgroundColor = .systemBackground
//        addNewEntryButtonObject.tintColor = QwkColors.buttonColor
//        self.qwkDataArray = []
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
//        ])
//    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.qwkDataArray = []
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        addNewEntryButtonObject.tintColor = QwkColors.buttonColor
        self.qwkDataArray = []
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
        
        // DATA Load Data for more page
        let docRef = db.collection("topics-v2").document(topic)
        let descriptionCollection = docRef.collection("descriptions")
        let videoCollection = docRef.collection("videos")
        let imageCollection = docRef.collection("images")
        
        switch cellType {
        
        case .qwkDescription:
            // // loop through revieved entries in database
            // qwkDataArray = [
            //     QwkDataFromServer(
            //         authorImage: #imageLiteral(resourceName: "janeDoe"),
            //         authorFirstName: "Jane",
            //         authorLastName: "Doe",
            //         qwkDescriptionText:DummyData.qwkDescription,
            //         voteCount: 10),
            //     QwkDataFromServer(
            //         authorImage: #imageLiteral(resourceName: "profileImage3"),
            //         authorFirstName: "Bob",
            //         authorLastName: "Smith",
            //         qwkDescriptionText:"This article is about the domestic dog. For other uses, see Puppy (disambiguation).Golden Retriever puppy Basset Hound Newborn Welsh Springer Spaniels A puppy is a juvenile dog. Some puppies can weigh 1–1.5 kg (1-3 lb), while larger ones can weigh up to 7–11 kg (15-23 lb). All healthy puppies grow quickly after birth. A puppy's coat color may change as the puppy grows older, as is commonly seen in breeds such as the Yorkshire Terrier. Puppy refers specifically to young dogs",
            //         voteCount: 10),
            //     QwkDataFromServer(
            //         authorImage: #imageLiteral(resourceName: "profileImage2"),
            //         authorFirstName: "John",
            //         authorLastName: "Davis",
            //         qwkDescriptionText:"Puppies are best animals. I like the way that they howl! It is very very cool",
            //         voteCount: -5),
            // ]
            
        descriptionCollection.order(by: "voteSum", descending: true)
                .addSnapshotListener { (querySnapshot, error) in
                    self.qwkDataArray = []
                    if let e = error {
                         print("There was an issue retrieving data. \(e)")
                    } else {
                        if let snapShotDocuments = querySnapshot?.documents {

                        for doc in snapShotDocuments {
                            let data = doc.data()

                            if let ownerName = data["ownerName"] as? String,
                               let body = data["body"] as? String,
                               let ownerEmail = data["owner"] as? String,
                               let pathRef = data["ownerImageRef"] as? String,
                               let voteSum = data["voteSum"] as? Int {
                               let imageData = self.storage.reference(forURL: pathRef)
                                
                                imageData.getData(maxSize: 1 * 2048 * 2048) { data, error in
                                if let error = error {
                                    print(error)
                                  } else {
                                    // image data is returned
                                    let image = UIImage(data: data!)
                                    let newDesc = QwkDataFromServer(authorImage: image,authorFirstName: ownerName, itemID:  doc.documentID,authorEmail: ownerEmail, qwkDescriptionText: body,voteCount: voteSum)

                                self.qwkDataArray.append(newDesc)
                                    
                                DispatchQueue.main.async {
                                self.collectionView.reloadData()
                          }
                                   
                        }
                      }
                   }
               }
            }
          }
        }
            
        case .video:
            videoCollection.order(by: "voteSum", descending: true)
                    .addSnapshotListener { (querySnapshot, error) in
                        self.qwkDataArray = []
                        if let e = error {
                             print("There was an issue retrieving data. \(e)")
                        } else {
                            if let snapShotDocuments = querySnapshot?.documents {

                            for doc in snapShotDocuments {
                                let data = doc.data()
                                
                                if let ownerName = data["ownerName"] as? String,
                                   let body = data["body"] as? String,
                                   
                                   let ownerEmail = data["owner"] as? String,
                                   let voteSum = data["voteSum"] as? Int {
                                    let newVideo = QwkDataFromServer(authorFirstName: ownerName, itemID:  doc.documentID, authorEmail: ownerEmail, videoURL: body,voteCount: voteSum)

                                    self.qwkDataArray.append(newVideo)
                                    DispatchQueue.main.async {
                                    self.collectionView.reloadData()
                           }
                        }
                    }
                }
              }
            }
        case .image:
            imageCollection.order(by: "voteSum", descending: true)
                    .addSnapshotListener { (querySnapshot, error) in
                        self.qwkDataArray = []
                        if let e = error {
                             print("There was an issue retrieving data. \(e)")
                        } else {
                            if let snapShotDocuments = querySnapshot?.documents {

                            for doc in snapShotDocuments {
                                let data = doc.data()

                                if let ownerName = data["ownerName"] as? String,
                                   let body = data["body"] as? String,
                                   let ownerEmail = data["owner"] as? String,
                                   let voteSum = data["voteSum"] as? Int {
                                    let imageData = self.storage.reference(forURL: body)
                                     print(imageData)
                                     imageData.getData(maxSize: 1 * 2048 * 2048) { data, error in
                                     if let error = error {
                                         print(error)
                                       } else {
                                         // image data is returned
                                         let image = UIImage(data: data!)
                                    
                                        let newImage = QwkDataFromServer(authorFirstName: ownerName, itemID:  doc.documentID, authorEmail: ownerEmail, qwkImage: image,voteCount: voteSum)

                                    self.qwkDataArray.append(newImage)
                                    DispatchQueue.main.async {
                                    self.collectionView.reloadData()
                              }
                            }
                          }
                       }
                    }
                }
            }
       }
        case .externalLink:
            qwkDataArray = [
                QwkDataFromServer(
                    authorImage: #imageLiteral(resourceName: "janeDoe"),
                    authorFirstName: "Jane",
                    
                    singleExternalLink: QwkExternalLink(url: "https://www.petfinder.com/pet-adoption/dog-adoption/puppies-for-adoption/",
                                                        title: "PetFinder.com"),
                    voteCount: 9),
                QwkDataFromServer(
                    authorImage: #imageLiteral(resourceName: "profileImage2"),
                    authorFirstName: "Bob",
                    
                    singleExternalLink: QwkExternalLink(url: "https://www.thesprucepets.com/puppies-4162145",
                                                        title: "TheSprucePets.com"),
                    voteCount: 2),
                QwkDataFromServer(
                    authorImage: #imageLiteral(resourceName: "profileImage3"),
                    authorFirstName: "John",
                    
                    singleExternalLink: QwkExternalLink(url: "https://www.puppyspot.com",
                                                        title: "ThePuppySpot.com"),
                    voteCount: -5),
            ]
        default:
            fatalError()
        }
    }
    
    @IBAction func newQwkEntryButtonAction(_ sender: UIBarButtonItem) {
        switch cellType {
        case .qwkDescription:
            performSegue(withIdentifier: "moreToEditQwkDescriptionSegue", sender: self)
        case .video:
            performSegue(withIdentifier: "moreToEditVideoSegue", sender: self)
        case .image:
            performSegue(withIdentifier: "moreToEditImageSegue", sender: self)
        case .externalLink:
            performSegue(withIdentifier: "moreToEditExternalLinkSegue", sender: self)
        default:
            fatalError()
        }
    }
    
    var websiteURLToSend: String?
    var webSiteTitleToSend = "Empty Title"
    var qwkDescriptionToSend = "Empty Qwk Description"
    var videoURLToSend: String?
    var imageToSend: UIImage = #imageLiteral(resourceName: "Image")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if(segue.identifier == "moreToWebViewSegue") {
            let vc = segue.destination as! ExternalLinkWebViewController
//            vc.sentUrlString = urlToSend
        } else if(segue.identifier == "moreToEditQwkDescriptionSegue"){
            let vc = segue.destination as! EditQwkDescriptionViewController
            vc.currentQwkDescription = qwkDescriptionToSend
            vc.topic = topic
        } else if(segue.identifier == "moreToEditVideoSegue"){
            let vc = segue.destination as! EditVideoViewController
            vc.currentVideoURL = videoURLToSend
        } else if(segue.identifier == "moreToEditImageSegue"){
            let vc = segue.destination as! EditImageViewController
            vc.currentImage = imageToSend
        } else if(segue.identifier == "moreToEditExternalLinkSegue"){
            let vc = segue.destination as! EditExternalLinkViewController
//            vc.currentRecievedURL = urlToSend
//            vc.currentRecivedWebsiteTitle = urlTitleToSend
        }
    }
}

extension MorePageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return qwkDataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch cellType{
        case .qwkDescription:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier , for: indexPath) as! MoreMediaCollectionViewCell
            cell.cellType = .qwkDescription
            cell.qwkDescriptionTextView.text = qwkDataArray[indexPath.row].qwkDescriptionText
           
            let firstName = qwkDataArray[indexPath.row].authorFirstName
            cell.authorLabel.text = firstName
            cell.profilePic.image = qwkDataArray[indexPath.row].authorImage
            
            cell.editButtonTapActionQwkDescription = { (qwkDescription: String) in
                self.qwkDescriptionToSend = qwkDescription
                self.performSegue(withIdentifier: "moreToEditQwkDescriptionSegue", sender: self)
            }
            
            // if Author in the database is the same as the current User (for edit button)
            if(Auth.auth().currentUser?.email == qwkDataArray[indexPath.row].authorEmail) {
                cell.isCurrentUsersPost = true
            } else {
                cell.isCurrentUsersPost = false
                cell.numberOfVotes = qwkDataArray[indexPath[1]].voteCount!
            }
            return cell
            
        case .video:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier , for: indexPath) as! MoreMediaCollectionViewCell
            cell.cellType = .video
            
            if let _ = qwkDataArray[indexPath[1]].videoURL {
                let youTubeID = qwkDataArray[indexPath[1]].videoURL!.deletingPrefix("https://www.youtube.com/watch?v=")
                cell.youTubeVideoURL = qwkDataArray[indexPath[1]].videoURL
                cell.youTubeVideoPlayer.load(withVideoId: youTubeID)
            }
            
            let firstName = qwkDataArray[indexPath[1]].authorFirstName ?? "First Name"
            //let lastName = qwkDataArray[indexPath[1]].authorLastName ?? "Last Name"
            cell.authorLabel.text = firstName
            cell.profilePic.image = qwkDataArray[indexPath[1]].authorImage
            
            cell.editButtonTapActionVideo = { (videoURL: String) in
                self.videoURLToSend = videoURL
                self.performSegue(withIdentifier: "moreToEditVideoSegue", sender: self)
            }
            
            // Check if Author in the database is the same as the current User (for edit button)
            if(Auth.auth().currentUser?.email == qwkDataArray[indexPath.row].authorEmail) {
                cell.isCurrentUsersPost = true
            } else {
                cell.isCurrentUsersPost = false
                cell.numberOfVotes = qwkDataArray[indexPath[1]].voteCount!
            }
            return cell
        case .image:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier  , for: indexPath) as! MoreMediaCollectionViewCell
            cell.cellType = .image

            cell.editButtonTapActionImage = { (image: UIImage) in
                self.imageToSend = image
                self.performSegue(withIdentifier: "moreToEditImageSegue", sender: self)
            }
            
            if let imageFromDB = qwkDataArray[indexPath[1]].qwkImage {
                cell.imageView.image = imageFromDB
            }
            
            let firstName = qwkDataArray[indexPath[1]].authorFirstName ?? "First Name"
            cell.authorLabel.text = firstName
            cell.profilePic.image = qwkDataArray[indexPath[1]].authorImage
            
            
            // MARK: DATA: Check if Author in the database is the same as the current User (for edit button)
            if(Auth.auth().currentUser?.email == qwkDataArray[indexPath.row].authorEmail) {
                cell.isCurrentUsersPost = true
            } else {
                cell.isCurrentUsersPost = false
                cell.numberOfVotes = qwkDataArray[indexPath[1]].voteCount!
            }
            return cell
        case .externalLink:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier  , for: indexPath) as! MoreMediaCollectionViewCell
            
            cell.cellType = .externalLink
            if let _ = qwkDataArray[indexPath[1]].singleExternalLink  {
                cell.urlLabel.text = qwkDataArray[indexPath[1]].singleExternalLink!.title
                cell.webSiteURL = qwkDataArray[indexPath[1]].singleExternalLink!.url
            }
            
            let firstName = qwkDataArray[indexPath[1]].authorFirstName ?? "First Name"
            //let lastName = qwkDataArray[indexPath[1]].authorLastName ?? "Last Name"
            cell.authorLabel.text = firstName
            cell.profilePic.image = qwkDataArray[indexPath[1]].authorImage
            
            cell.editButtonTapActionExternalLink = { (url: String, webSiteTitle: String) in
                self.webSiteTitleToSend = webSiteTitle
                self.websiteURLToSend = url
                self.performSegue(withIdentifier: "moreToEditExternalLinkSegue", sender: self)
            }
            
            cell.externalURLViewButtonTapAction = { (url: String, title: String) in
                self.websiteURLToSend = url
                self.webSiteTitleToSend = title
                self.performSegue(withIdentifier: "moreToWebViewSegue", sender: self)
            }
            
            // MARK: DATA: Check if Author in the database is the same as the current User (for edit button)
            if(indexPath[1] == 0) {
                cell.isCurrentUsersPost = true
            } else {
                cell.isCurrentUsersPost = false
                cell.numberOfVotes = qwkDataArray[indexPath[1]].voteCount!
            }
            return cell
//        case .qwkRecommedation:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier  , for: indexPath) as! MoreMediaCollectionViewCell
//            cell.cellType = .qwkRecommedation
//            cell.isCurrentUsersPost = false
//            return cell
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.safeAreaLayoutGuide.layoutFrame.width-16
        var height: CGFloat =  0.0
        
        switch cellType{
        case .qwkDescription:
            // This UItextfield is used to generate the size of the CollectionView Cell
            let dummyUITextField = UITextView()
            dummyUITextField.text = qwkDataArray[indexPath[1]].qwkDescriptionText
            dummyUITextField.isScrollEnabled = false
            let newSize = dummyUITextField.sizeThatFits(CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))
            height = newSize.height + 40 // extra points for author name and vote count
        case .video:
            height = ((width/16) * 9) + 40
        case .image:
            if let _ = qwkDataArray[indexPath[1]].qwkImage {
                let imageRatio =  qwkDataArray[indexPath[1]].qwkImage!.size.width / qwkDataArray[indexPath[1]].qwkImage!.size.height
                height = (width / imageRatio) + 40
            } else {
                height = 0
            }
        case .audio:
            height = 100.0
        case .externalLink:
            height = 100.0
        case .qwkRecommedation:
            height = 240.0
        default:
            fatalError()
        }
        return CGSize(width: width, height: height)
    }
}

/*
  moreToEditQwkDescriptionSegue
 moreToEditVideoSegue
 moreToEditImageSegue
 moreToEditExternalLinkSegue
*/
