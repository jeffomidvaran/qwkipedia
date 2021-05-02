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
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(MoreQwkDescriptionCollectionViewCell.self, forCellWithReuseIdentifier: MoreQwkDescriptionCollectionViewCell.identifier)
        cv.register(MoreVideoCollectionViewCell.self, forCellWithReuseIdentifier: MoreVideoCollectionViewCell.identifier)
        cv.register(MoreImageCollectionViewCell.self, forCellWithReuseIdentifier: MoreImageCollectionViewCell.identifier)
        cv.register(MoreAudioCollectionViewCell.self, forCellWithReuseIdentifier: MoreAudioCollectionViewCell.identifier)
        cv.register(MoreExternalLinkCollectionViewCell.self, forCellWithReuseIdentifier: MoreExternalLinkCollectionViewCell.identifier)
        cv.register(MoreQwkDescriptionCollectionViewCell.self, forCellWithReuseIdentifier: MoreQwkRecommendationsCollectionViewCell.identifier)
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
}

extension MorePageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch cellType{
        case .qwkDescription:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreQwkDescriptionCollectionViewCell.identifier , for: indexPath) as! MoreQwkDescriptionCollectionViewCell
            cell.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            return cell
        case .video:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreVideoCollectionViewCell.identifier , for: indexPath) as! MoreVideoCollectionViewCell
            return cell
        case .image:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreImageCollectionViewCell.identifier  , for: indexPath) as! MoreImageCollectionViewCell
            return cell
        case .audio:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreAudioCollectionViewCell.identifier  , for: indexPath) as! MoreAudioCollectionViewCell
            return cell
        case .externalLink:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreExternalLinkCollectionViewCell.identifier  , for: indexPath) as! MoreExternalLinkCollectionViewCell
            return cell
        case .qwkRecommedation:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoreQwkRecommendationsCollectionViewCell.identifier  , for: indexPath) as! MoreQwkRecommendationsCollectionViewCell
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
            height = 400.0
        case .image:
            height = 230.0
        case .audio:
            height = 100.0
        case .externalLink:
            height = 180.0
        case .qwkRecommedation:
            height = 240.0
        default:
            fatalError()
        }
        return CGSize(width: width, height: height)
    }
}
