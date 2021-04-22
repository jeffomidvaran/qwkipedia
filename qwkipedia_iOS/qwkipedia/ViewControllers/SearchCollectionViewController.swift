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
    
    let allData = ["Animals", "Apples", "Puppies", "Cats", "Guitars", "Basketball", "Irvine, California"]
    var filteredSearchResults = [String]()

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
        cell?.textLabel?.text = filteredSearchResults[indexPath.row]
        return cell!
    }



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = searchResultsTableView.indexPathForSelectedRow
        let topicViewController = segue.destination as! TopicPageViewController
        topicViewController.text = filteredSearchResults[indexPath!.row]
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredSearchResults = allData.filter({
            $0.prefix(searchText.count).lowercased() == searchText.lowercased()
            
        })
        searchResultsTableView.reloadData()
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = "Search"
        filteredSearchResults = allData
        searchResultsTableView.reloadData()
    }
    
    
}
