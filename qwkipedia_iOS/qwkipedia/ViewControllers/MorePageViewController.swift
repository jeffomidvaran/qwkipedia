//
//  MorePageViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/2/21.
//

import UIKit

class MorePageViewController: UIViewController {
 
    var cellType: TopicCellType = .qwkDescription
    
    @IBOutlet weak var addNewEntryButtonObject: UIBarButtonItem!
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MoreMediaCollectionViewCell.self, forCellWithReuseIdentifier: MoreMediaCollectionViewCell.identifier)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        addNewEntryButtonObject.tintColor = QwkColors.buttonColor
    
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
    }
    
    var qwkDataArray: [QwkDataFromServer] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // MARK: DATA Load Data for more page
        // use variable "cellType" in a switch statment to know which type of data to bring in
        
        switch cellType {
        case .qwkDescription:
            // loop through revieved entries in database
            
            qwkDataArray = [
                QwkDataFromServer(
                      authorImage: #imageLiteral(resourceName: "janeDoe"),
                      authorFirstName: "Jane",
                      authorLastName: "Doe",
                      qwkDescriptionText:DummyData.qwkDescription,
                      voteCount: 10),
                QwkDataFromServer(
                      authorImage: #imageLiteral(resourceName: "profileImage3"),
                      authorFirstName: "Bob",
                      authorLastName: "Smith",
                    qwkDescriptionText:"This article is about the domestic dog. For other uses, see Puppy (disambiguation).Golden Retriever puppy Basset Hound Newborn Welsh Springer Spaniels A puppy is a juvenile dog. Some puppies can weigh 1–1.5 kg (1-3 lb), while larger ones can weigh up to 7–11 kg (15-23 lb). All healthy puppies grow quickly after birth. A puppy's coat color may change as the puppy grows older, as is commonly seen in breeds such as the Yorkshire Terrier. Puppy refers specifically to young dogs",
                      voteCount: 10),
                QwkDataFromServer(
                      authorImage: #imageLiteral(resourceName: "profileImage2"),
                      authorFirstName: "John",
                      authorLastName: "Davis",
                      qwkDescriptionText:"Puppies are best animals. I like the way that they howl! It is very very cool",
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
    
    var websiteURLToSend: URL?
    var webSiteTitleToSend = "Empty Title"
    var qwkDescriptionToSend = "Empty Qwk Description"
    var videoURLToSend: URL?
    var imageToSend: UIImage = #imageLiteral(resourceName: "Image")
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if(segue.identifier == "moreToWebViewSegue") {
            let vc = segue.destination as! ExternalLinkWebViewController
//            vc.sentUrlString = urlToSend
        } else if(segue.identifier == "moreToEditQwkDescriptionSegue"){
            let vc = segue.destination as! EditQwkDescriptionViewController
            vc.currentQwkDescription = qwkDescriptionToSend
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
            cell.qwkDescriptionTextView.text = qwkDataArray[indexPath[1]].qwkDescriptionText!
           
            let firstName = qwkDataArray[indexPath[1]].authorFirstName ?? "First Name"
            let lastName = qwkDataArray[indexPath[1]].authorLastName ?? "Last Name"
            cell.authorLabel.text = firstName + " " + lastName
            
            cell.profilePic.image = qwkDataArray[indexPath[1]].authorImage
            
            cell.editButtonTapActionQwkDescription = { (qwkDescription: String) in
                self.qwkDescriptionToSend = qwkDescription
                self.performSegue(withIdentifier: "moreToEditQwkDescriptionSegue", sender: self)
            }
            
            // MARK: DATA: Check if Author in the database is the same as the current User (for edit button)
            if(indexPath[1] == 0) {
                cell.isCurrentUsersPost = true
            } else {
                cell.isCurrentUsersPost = false
                cell.numberOfVotes = qwkDataArray[indexPath[1]].voteCount!
            }
            return cell
        case .video:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier , for: indexPath) as! MoreMediaCollectionViewCell
            cell.cellType = .video
            cell.editButtonTapActionVideo = { (videoURL: URL) in
                self.videoURLToSend = videoURL
                self.performSegue(withIdentifier: "moreToEditVideoSegue", sender: self)
            }
            if(indexPath[1] == 0) {
                cell.isCurrentUsersPost = true
            } else {
                cell.isCurrentUsersPost = false
            }
            return cell
        case .image:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier  , for: indexPath) as! MoreMediaCollectionViewCell
            cell.cellType = .image

            cell.editButtonTapActionImage = { (image: UIImage) in
                self.imageToSend = image
                self.performSegue(withIdentifier: "moreToEditImageSegue", sender: self)
            }
            if(indexPath[1] == 0) {
                cell.isCurrentUsersPost = true
            } else {
                cell.isCurrentUsersPost = false
            }
            return cell
        case .externalLink:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier  , for: indexPath) as! MoreMediaCollectionViewCell
//            cell.webSiteName = DummyData.urls[0][0]
//            cell.urlString = DummyData.urls[0][1]
            cell.isCurrentUsersPost = false
            cell.cellType = .externalLink
            cell.editButtonTapActionExternalLink = { (url: URL, webSiteTitle: String) in
                self.webSiteTitleToSend = webSiteTitle
                self.websiteURLToSend = url
                self.performSegue(withIdentifier: "moreToEditExternalLinkSegue", sender: self)
            }
            
            cell.externalURLViewButtonTapAction = { (url: URL) in
                self.websiteURLToSend = url
                self.performSegue(withIdentifier: "moreToWebViewSegue", sender: self)
            }
            
            if(indexPath[1] == 0) {
                cell.isCurrentUsersPost = true
            } else {
                cell.isCurrentUsersPost = false
            }
            return cell
        case .qwkRecommedation:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier  , for: indexPath) as! MoreMediaCollectionViewCell
            cell.cellType = .qwkRecommedation
            cell.isCurrentUsersPost = false
            return cell
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
            height = 260.0
        case .image:
            height = 230.0
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
