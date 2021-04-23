//
//  TopicPageViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/22/21.
//

import UIKit

class TopicPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
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
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath[1]{
        case 0:
            print("Header")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: headerReuseIdentifier , for: indexPath) as! TopicHeaderCollectionViewCell
            return cell
        case 1:
            print("QwkDescription")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: qwkDescriptionReuseIdentifier , for: indexPath) as! TopicQwkDescriptionCollectionViewCell
            return cell
        case 2:
            print("Video")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: videoReuseIdentifier , for: indexPath) as! TopicVideoCollectionViewCell
            return cell
        case 3:
            print("Image")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageReuseIdentifier , for: indexPath) as! TopicImageCollectionViewCell
            return cell
        case 4:
            print("Audio")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: audioReuseIdentifier , for: indexPath) as! TopicAudioCollectionViewCell
            return cell
        case 5:
            print("Discussion")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: discussionReuseIdentifier , for: indexPath) as! TopicDiscussionCollectionViewCell
            return cell
        case 6:
            print("Expert Summary")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: expertSummaryReuseIdentifier , for: indexPath) as! TopicExpertSummaryCollectionViewCell
            return cell
        case 7:
            print("External Links")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: externalLinksReuseIdentifier , for: indexPath) as! TopicExternalLinksCollectionViewCell
            return cell
        case 8:
            print("Qwk Recommendations")
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: qwkRecommendationsReuseIdentifier , for: indexPath) as! TopicQwkRecomendtionsCollectionViewCell
            return cell
        default:
            fatalError()

        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let frameWidth = view.safeAreaLayoutGuide.layoutFrame.width
        let frameHeight = view.safeAreaLayoutGuide.layoutFrame.height
        
        var width: CGFloat = frameWidth
        var height: CGFloat = 10.0
        
        switch indexPath[1]{
        case 0:
            print("Header")
            height = 50.0
        case 1:
            print("QwkDescription")
            height = 200.0
        case 2:
            print("Video")
            height = 400.0
        case 3:
            print("Image")
            height = 400.0
        case 4:
            print("Audio")
            height = 100.0
        case 5:
            print("Discussion")
            height = 400.0
        case 6:
            print("Expert Summary")
            height = 600.0
        case 7:
            print("External Links")
            height = 200.0
        case 8:
            print("Qwk Recommendations")
            height = 100.0
        default:
            fatalError()
        }
        return CGSize(width: width, height: height)
    }
    
    
}

