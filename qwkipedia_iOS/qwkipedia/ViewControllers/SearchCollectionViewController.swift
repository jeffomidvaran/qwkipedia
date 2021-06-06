//
//  FavoritesViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/19/21.
//

import UIKit
import Firebase
import FirebaseStorage
class SearchCollectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let tableViewCellReuseIdentifier = "SearchResultTableViewCell"
    let createNewPageTableViewCellID = "CreateNewPageTableViewCell"

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var searchResultsTableView: UITableView!
    
    var allData = [Utilities.HomePageData]()

    var filteredSearchResults = [Utilities.HomePageData]()
    let db = Firestore.firestore()
    let storage = Storage.storage().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
        navigationItem.titleView = searchBar
        filteredSearchResults = loadData()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let indexPath = searchResultsTableView.indexPathForSelectedRow
//        let topicViewController = segue.destination as! TopicPageViewController
//        topicViewController.text = filteredSearchResults[indexPath!.row].name
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? TopicPageViewController,
//           let index = searchResultsTableView.indexPathsForSelectedRows?.first {
//                vc.topic = filteredSearchResults[index.row].title
//            }
//
//    }
//        let indexPath = searchResultsTableView.indexPathForSelectedRow
//        let topicViewController = segue.destination as! TopicPageViewController
//        topicViewController.text = filteredSearchResults[indexPath!.row].name
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSearchResults.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath[1] != filteredSearchResults.count){
            let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultTableViewCell")
            cell?.textLabel?.text = filteredSearchResults[indexPath.row].title
            cell?.imageView?.image = filteredSearchResults[indexPath.row].image?.cropsToSquare()
            return cell!
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CreateNewPageTableViewCell")
            cell?.textLabel?.text = "Add New Topic Page"
            cell?.textLabel?.textColor = QwkColors.buttonColor
            
            return cell!
        }
        
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellReuseIdentifier)
//
//        cell?.textLabel?.text = filteredSearchResults[indexPath.row].title
//        cell?.imageView?.image = filteredSearchResults[indexPath.row].image?.cropsToSquare()
//        return cell!
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
                        DispatchQueue.main.async {
                           self.searchResultsTableView.reloadData()

                        }
                    }
                }
            }
        }
        return self.allData
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
        searchResultsTableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = "Search"
        filteredSearchResults = allData
        searchResultsTableView.reloadData()
    }
}




//struct TempData {
//    var name: String
//    var image: UIImage?
//}
