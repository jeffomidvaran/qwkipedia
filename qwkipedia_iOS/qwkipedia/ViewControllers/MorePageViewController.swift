//
//  MorePageViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/2/21.
//

import UIKit

class MorePageViewController: UIViewController {
 
    var cellType: TopicCellType = .qwkDescription
    var value = "empty"
    var urlToSend = "https://www.google.com"
    
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
        collectionView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
        ])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "moreToEditSeque") {
            let vc = segue.destination as! EditDataViewController
            vc.viewType = cellType
            vc.videoURL = "https://www.youtube.com/watch?v=JJunp9xo4uA"
        } else if(segue.identifier == "moreToWebViewSegue") {
            let vc = segue.destination as! ExternalLinkWebViewController
            vc.sentUrlString = urlToSend
        }
    }
    
    @IBAction func newQwkEntryButtonAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "moreToNewQwkEEntrySegue", sender: self)
    }
    
    

    

}

extension MorePageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch cellType{
        case .qwkDescription:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier , for: indexPath) as! MoreMediaCollectionViewCell
            cell.cellType = .qwkDescription
            cell.editButtonTapAction = {
                self.performSegue(withIdentifier: "moreToEditSeque", sender: self)
            }
            
            if(indexPath[1] == 0) {
                cell.isCurrentUsersPost = true
            } else {
                cell.isCurrentUsersPost = false
            }
            return cell
        case .video:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier , for: indexPath) as! MoreMediaCollectionViewCell
            cell.cellType = .video
//            cell.isCurrentUsersPost = false
            cell.editButtonTapAction = {
                self.performSegue(withIdentifier: "moreToEditSeque", sender: self)
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

            cell.editButtonTapAction = {
                self.performSegue(withIdentifier: "moreToEditSeque", sender: self)
            }
            if(indexPath[1] == 0) {
                cell.isCurrentUsersPost = true
            } else {
                cell.isCurrentUsersPost = false
            }
            return cell
        case .externalLink:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier  , for: indexPath) as! MoreMediaCollectionViewCell
            cell.surname = DummyData.urls[0][0]
            cell.urlString = DummyData.urls[0][1]
            cell.isCurrentUsersPost = false
            cell.cellType = .externalLink
            cell.editButtonTapAction = {
                self.performSegue(withIdentifier: "moreToEditSeque", sender: self)
            }
            
            cell.urlViewButtonTapAction = { (url:String) in
                self.urlToSend = url
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
        let width: CGFloat = view.safeAreaLayoutGuide.layoutFrame.width
        var height: CGFloat =  0.0

        switch cellType{
        case .qwkDescription:
            height = 200.0
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



// moreToWebViewSegue
