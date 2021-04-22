//
//  FavoritesViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/19/21.
//

import UIKit

class SearchCollectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var searchResultsTableView: UITableView!
    let tableViewCellReuseIdentifier = "SearchResultTableViewCell"
    
    var allData = ["Animals", "Puppies", "Cats", "Guitars", "Basketball", "Irvine, California"]
    var filteredSearchResults = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultsTableView.delegate = self
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
