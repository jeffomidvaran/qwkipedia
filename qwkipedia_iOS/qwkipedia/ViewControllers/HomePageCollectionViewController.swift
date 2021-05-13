//
//  HomePageCollectionViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/19/21.
//

import UIKit



class HomePageCollectionViewController: UICollectionViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.frame.width - 16, height: 144.5)
        
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DummyData.previewData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicPreviewCollectionViewCell.identifier, for: indexPath) as! TopicPreviewCollectionViewCell
        cell.topicNameLabel.text = DummyData.previewData[indexPath[1]].name
        cell.qwkDescriptionLabel.text = DummyData.previewData[indexPath[1]].description
        cell.qwkDescriptionLabel.numberOfLines = 0
        cell.qwkDescriptionLabel.lineBreakMode = .byWordWrapping

        cell.previewImageView.image = DummyData.previewData[indexPath[1]].image?.cropsToSquare()
        return cell
    }
  
}





/*
 TODO
    resize and crop image
 */
