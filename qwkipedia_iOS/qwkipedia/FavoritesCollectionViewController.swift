//
//  GeneralSearch.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/19/21.
//

import UIKit

private let reuseIdentifier = "FavoritesTopicPreviewCell"
class FavoritesCollectionViewController: UICollectionViewController, UISearchBarDelegate {

    
    @IBOutlet var searchBar: UISearchBar!
    
     let tempData: [tempItem] = [
        tempItem(name: "puppy", image: #imageLiteral(resourceName: "Image")),
        tempItem(name: "Intellijel Rubicon", image: #imageLiteral(resourceName: "synth.jpg")),
        tempItem(name: "Lakers", image: #imageLiteral(resourceName: "lakers")),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchBar
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.frame.width-16, height: 66)
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FavoritesItemCollectionViewCell
        
        cell.topicNameLabel.text = tempData[indexPath.row].name
        cell.previewImageView.image = tempData[indexPath.row].image
        return cell
    }
    
    

}



struct tempItem {
    var name: String
    var image: UIImage
}
