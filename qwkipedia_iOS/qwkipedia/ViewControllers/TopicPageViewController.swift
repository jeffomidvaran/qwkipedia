//
//  TopicPageViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicPageViewController: UIViewController {
     
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(TopicHeaderCollectionViewCell.self, forCellWithReuseIdentifier: TopicHeaderCollectionViewCell.identifier)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
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
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath[1]{
        case 0:
            print("in the zero case")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicHeaderCollectionViewCell.identifier , for: indexPath) as! TopicHeaderCollectionViewCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicQwkDescriptionCollectionViewCell.identifier , for: indexPath) as! TopicQwkDescriptionCollectionViewCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicVideoCollectionViewCell.identifier  , for: indexPath) as! TopicVideoCollectionViewCell
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicImageCollectionViewCell.identifier  , for: indexPath) as! TopicImageCollectionViewCell
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicAudioCollectionViewCell.identifier  , for: indexPath) as! TopicAudioCollectionViewCell
            return cell
        case 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicDiscussionCollectionViewCell.identifier  , for: indexPath) as! TopicDiscussionCollectionViewCell
            return cell
        case 6:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicExpertSummaryCollectionViewCell.identifier  , for: indexPath) as! TopicExpertSummaryCollectionViewCell
            return cell
        case 7:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicExternalLinksCollectionViewCell.identifier  , for: indexPath) as! TopicExternalLinksCollectionViewCell
            return cell
        case 8:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicQwkRecomendtionsCollectionViewCell.identifier , for: indexPath) as! TopicQwkRecomendtionsCollectionViewCell
            return cell
        default:
            fatalError()

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        
        let width: CGFloat = view.safeAreaLayoutGuide.layoutFrame.width
        var height: CGFloat =  0.0
        
        switch indexPath[1]{
        case 0:
            height = 30.0
        case 1:
            height = 200.0
        case 2:
            height = 400.0
        case 3:
            height = 400.0
        case 4:
            height = 100.0
        case 5:
            height = 400.0
        case 6:
            height = 600.0
        case 7:
            height = 200.0
        case 8:
            height = 100.0
        default:
            fatalError()
        }
        return CGSize(width: width, height: height)
    }

}
