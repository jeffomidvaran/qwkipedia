//
//  HomePageCollectionViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 4/19/21.
//

import UIKit
import Firebase
import FirebaseStorage

class HomePageCollectionViewController: UICollectionViewController {
    
    let db = Firestore.firestore()
    let storage = Storage.storage().reference()
    
    var pageData : [Utilities.HomePageData] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let logo = #imageLiteral(resourceName: "searchGlassNoBackground")
//        let imageView = UIImageView(image: logo)
//        self.navigationItem.titleView = imageView
        
        collectionView.dataSource = self
                
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: view.frame.width - 16, height: 144.5)
        loadData()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicPreviewCollectionViewCell.identifier, for: indexPath) as! TopicPreviewCollectionViewCell
        
        cell.topicNameLabel.text = pageData[indexPath.row].title
        cell.qwkDescriptionLabel.text = pageData[indexPath.row].text
        
        cell.qwkDescriptionLabel.numberOfLines = 0
        cell.qwkDescriptionLabel.lineBreakMode = .byWordWrapping
        cell.previewImageView.image = pageData[indexPath[1]].image?.cropsToSquare()
        return cell
    }
    
    func loadData() {
        
        db.collection("topics-v2").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    if let text = data["topDesc"] as? String {
                    let path = data["title"]as!String + ".png"
                    let imageRef = self.storage.child("topicImages").child(path)
                        imageRef.getData(maxSize: 1 * 5000 * 5000) { data, error in
                        if let error = error {
                            print(error)
                          } else {
                            // image data is returned
                            let image = UIImage(data: data!)
                            
                            let newData = Utilities.HomePageData(title: document.documentID , text:text, image:image ?? #imageLiteral(resourceName: "puppy"))
                            
                            self.pageData.append(newData)
                          }
                            DispatchQueue.main.async {
                                self.collectionView.reloadData()}
                          }
                    }
                    
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TopicPageViewController,
           let index = collectionView.indexPathsForSelectedItems?.first {
                vc.topic = pageData[index.row].title
            }
            
        }
}





