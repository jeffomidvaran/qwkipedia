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
    
    let allData: [TempItem] = [
        TempItem(name: "puppy", image: #imageLiteral(resourceName: "Image")),
        TempItem(name: "Intellijel Rubicon", image: #imageLiteral(resourceName: "synth.jpg")),
        TempItem(name: "Lakers", image: #imageLiteral(resourceName: "lakers")),
    ]
    
    var filteredSearchResults = [TempItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchBar
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.frame.width-16, height: 66)
        filteredSearchResults = allData
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredSearchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FavoritesItemCollectionViewCell
        cell.topicNameLabel.text = filteredSearchResults[indexPath.row].name
        cell.previewImageView.image = filteredSearchResults[indexPath.row].image
        return cell
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredSearchResults = allData.filter({
            let tokens = $0.name.components(separatedBy: CharacterSet(charactersIn: " ,;:()&^%$#@!<>?/.*~`\\|{}[]"))
            for token in tokens {
                let result = token.prefix(searchText.count).lowercased() == searchText.lowercased()
                if result == true {
                    return true
                }
            }
            return false
        })
        collectionView.reloadData()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = "Search"
        filteredSearchResults = allData
        collectionView.reloadData()
    }


}

struct TempItem {
    var name: String
    var image: UIImage?
}
