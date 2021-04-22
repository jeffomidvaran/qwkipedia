//
//  TopicPageViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    
    let headerReuseIdentifier = "topicPageHeaderCell"
    let qwkDescriptionReuseIdentifier = "qwkDescriptionCell"
    let videoReuseIdentifier = "topicPageVideoCell"
    let imageReuseIdentifier = "topicPageImageCell"
    let audioReuseIdentifier = "topicPageAudioCell"
    let discussionReuseIdentifier = "topicPageDiscussionCell"
    let expertSummaryReuseIdentifier = "topicPageExpertSummaryCell"
    let externalLinksReuseIdentifier = "topicPageExternalLinksCell"
    let qwkRecommendationsReuseIdentifier = "topicPageQwkRecomnedationsCell"
    
    
    @IBOutlet weak var topicPageCollectionView: UICollectionView!
    var text = "Nothing Set"
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = topicPageCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.frame.width - 16, height: 144.5)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath[1]{
        case 0:
            print("Header")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerReuseIdentifier , for: indexPath) as! UICollectionViewCell
            return cell
        case 1:
            print("QwkDescription")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: qwkDescriptionReuseIdentifier , for: indexPath) as! UICollectionViewCell
            return cell
        case 2:
            print("Video")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: videoReuseIdentifier , for: indexPath) as! UICollectionViewCell
            return cell
        case 3:
            print("Image")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageReuseIdentifier , for: indexPath) as! UICollectionViewCell
            return cell
        case 4:
            print("Audio")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: audioReuseIdentifier , for: indexPath) as! UICollectionViewCell
            return cell
        case 5:
            print("Discussion")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: discussionReuseIdentifier , for: indexPath) as! UICollectionViewCell
            return cell
        case 6:
            print("Expert Summary")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: expertSummaryReuseIdentifier , for: indexPath) as! UICollectionViewCell
            return cell
        case 7:
            print("External Links")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: externalLinksReuseIdentifier , for: indexPath) as! UICollectionViewCell
            return cell
        case 8:
            print("Qwk Recommendations")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: qwkDescriptionReuseIdentifier , for: indexPath) as! UICollectionViewCell
            return cell
        default:
            fatalError()

        }
        // This line will never be reached
//        return UICollectionViewCell()
        
    }
    

    

}
