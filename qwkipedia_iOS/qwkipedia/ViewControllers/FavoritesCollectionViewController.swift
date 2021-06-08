//
//  GeneralSearch.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/19/21.
//

import UIKit
import Firebase
import FirebaseStorage
private let reuseIdentifier = "FavoritesTopicPreviewCell"
class FavoritesCollectionViewController: UICollectionViewController, UISearchBarDelegate {


    @IBOutlet var searchBar: UISearchBar!
  
    
    var allData = [Utilities.HomePageData]()
    
    var filteredSearchResults = [Utilities.HomePageData]()
    let db = Firestore.firestore()
    let storage = Storage.storage().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = searchBar
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.frame.width-16, height: 66)
        
        filteredSearchResults = loadData()
        collectionView.reloadData()
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredSearchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FavoritesItemCollectionViewCell
        cell.topicNameLabel.text = filteredSearchResults[indexPath.row].title
        cell.previewImageView.image = filteredSearchResults[indexPath.row].image
        cell.favoriteBookmarkButtonObject.tintColor = QwkColors.buttonColor
        return cell
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredSearchResults = allData.filter({
            let tokens = $0.title.components(separatedBy: CharacterSet(charactersIn: " ,;:()&^%$#@!<>?/.*~`\\|{}[]"))
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
    
    func loadData() -> [Utilities.HomePageData] {
        db.collection("topics-v2").addSnapshotListener { (querySnapshot, error) in
            //self.allData = []
            
            if let e = error {
                 print("There was an issue retrieving data. \(e)")
            } else {
                if let snapShotDocuments = querySnapshot?.documents {
                
                for doc in snapShotDocuments {
                    let data = doc.data()
                    let path = data["title"]as!String + ".png"
                    let title = doc.documentID
                       
                    let imageRef = self.storage.child("topicImages").child(path)
                           imageRef.getData(maxSize: 1 * 5000 * 5000) { data, error in
                           if let error = error {
                               print(error)
                             } else {
                               // image data is returned
                                let image = UIImage(data: data!)
                        
                                let newTopic = Utilities.HomePageData(title: title, text: "", image: image)
                        
                        self.allData.append(newTopic)
                               }
                             }
//                        DispatchQueue.main.async {
//                           self.collectionView.reloadData()
//
//                        }
                    }
                }
            }
        }
        print("all data is being printed now")
        print(self.allData)
        
        return self.allData
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TopicPageViewController,
           let index = collectionView.indexPathsForSelectedItems?.first{
                vc.topic = filteredSearchResults[index.row].title
            }

    }


}

