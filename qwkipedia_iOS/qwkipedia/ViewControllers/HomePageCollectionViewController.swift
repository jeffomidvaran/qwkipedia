//
//  HomePageCollectionViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/19/21.
//

import UIKit



class HomePageCollectionViewController: UICollectionViewController {

    let dataSource = ["one", "two", "three", "four", "five"]
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.frame.width - 16, height: 144.5)
    }
    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicPreviewCollectionViewCell.identifier, for: indexPath) as! TopicPreviewCollectionViewCell
        cell.topicNameLabel.text = "Puppy"
        cell.qwkDescriptionLabel.text = "A puppy is a juvenile dog. Some puppies can weigh 1–1.5 kg (1-3 lb), while larger ones can weigh up to 7–11 kg (15-23 lb). All healthy puppies grow quickly after birth. A puppy's coat color may change as the puppy grows older, as is commonly seen in breeds such as the Yorkshire Terrier. Puppy refers specifically to young dogs,[1] while pup may be used for other animals such as wolves, seals, giraffes, guinea pigs, rats or sharks.[2]"
        cell.qwkDescriptionLabel.numberOfLines = 0
        cell.qwkDescriptionLabel.lineBreakMode = .byWordWrapping

        var image: UIImage = #imageLiteral(resourceName: "Image")
        image = image.cropsToSquare()
        cell.previewImageView.image = image
        return cell
    }
  
}





/*
 TODO
    resize and crop image
 */
