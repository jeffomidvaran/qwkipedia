//
//  MorePageViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/2/21.
//

import UIKit

class MorePageViewController: UIViewController {
 
    @IBOutlet weak var addACellButton: UIBarButtonItem!
    
    var cellType: TopicCellType = .qwkDescription
    var value = "empty"
    
    
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
        collectionView.backgroundColor = QwkColors.backgroundColor
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
    
    @IBAction func addANewCellButtonAction(_ sender: Any) {
        print("add button pressed")
//        switch cellType{
//        case .qwkDescription:
//
//        case .video:
//
//        case .image:
//
//        case .audio:
//
//        case .externalLink:
//
//        case .qwkRecommedation:
//
//        default:
//            fatalError()
//        }
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
            cell.isAuthor = false
            return cell
        case .video:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier , for: indexPath) as! MoreMediaCollectionViewCell
            cell.cellType = .video
            cell.isAuthor = false
            return cell
        case .image:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier  , for: indexPath) as! MoreMediaCollectionViewCell
            cell.cellType = .image
            cell.isAuthor = false
            return cell
        case .audio:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier  , for: indexPath) as! MoreMediaCollectionViewCell
            cell.cellType = .audio
            cell.isAuthor = false
            return cell
        case .externalLink:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier  , for: indexPath) as! MoreMediaCollectionViewCell
            cell.surname = DummyData.urls[0][0]
            cell.urlString = DummyData.urls[0][1]
            cell.isAuthor = false
            cell.cellType = .externalLink
            return cell
        case .qwkRecommedation:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreMediaCollectionViewCell.identifier  , for: indexPath) as! MoreMediaCollectionViewCell
            cell.cellType = .qwkRecommedation
            cell.isAuthor = false
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
            height = 300.0
        case .video:
            height = 400.0
        case .image:
            height = 230.0
        case .audio:
            height = 100.0
        case .externalLink:
            height = 130.0
        case .qwkRecommedation:
            height = 240.0
        default:
            fatalError()
        }
        return CGSize(width: width, height: height)
    }
}
