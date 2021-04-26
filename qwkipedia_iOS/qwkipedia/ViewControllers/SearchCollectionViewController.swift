//
//  FavoritesViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/19/21.
//

import UIKit

class SearchCollectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    let tableViewCellReuseIdentifier = "SearchResultTableViewCell"

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var searchResultsTableView: UITableView!
    
    let allData = [
        TempData(name: "Animals",image: #imageLiteral(resourceName: "animals")),
        TempData(name: "Apples", image: #imageLiteral(resourceName: "apples")),
        TempData(name: "Puppy", image: #imageLiteral(resourceName: "puppy") ),
        TempData(name: "Cats", image: #imageLiteral(resourceName: "cats")),
        TempData(name: "Guitars",image: #imageLiteral(resourceName: "guitar") ),
        TempData(name: "Basketball", image: #imageLiteral(resourceName: "basketball")),
        TempData(name: "Irvine, California", image: #imageLiteral(resourceName: "irvine")),
    ]
    var filteredSearchResults = [TempData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
        navigationItem.titleView = searchBar
        filteredSearchResults = allData
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSearchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellReuseIdentifier)
        cell?.textLabel?.text = filteredSearchResults[indexPath.row].name
        cell?.imageView?.image = filteredSearchResults[indexPath.row].image?.cropsToSquare()
        return cell!
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let indexPath = searchResultsTableView.indexPathForSelectedRow
//        let topicViewController = segue.destination as! TopicPageViewController
//        topicViewController.text = filteredSearchResults[indexPath!.row].name
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
        searchResultsTableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = "Search"
        filteredSearchResults = allData
        searchResultsTableView.reloadData()
    }
    
    
}


struct TempData {
    var name: String
    var image: UIImage?
}
