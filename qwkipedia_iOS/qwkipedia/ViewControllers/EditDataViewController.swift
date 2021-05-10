//
//  EditDataViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/9/21.
//

import UIKit

class EditDataViewController: UIViewController {

    
    var viewType: TopicCellType = .qwkDescription
    /*
        uitextfield
        uiLabel
        delete button
        collectionView with suggestions
     */
    
    
    let urlEntryField: UITextField = {
        var tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        tf.placeholder = "Enter URL to Video"
        return tf
    }()
    
    let label: UILabel = {
        var l = UILabel()
        l.text = "Edit Qwk Description"
        l.translatesAutoresizingMaskIntoConstraints = false
//        l.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        return l
    }()
     
    let suggestionsLabel: UILabel = {
        var l = UILabel()
        l.text = "Suggestions"
        l.translatesAutoresizingMaskIntoConstraints = false
//        l.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        return l
    }()
   
    let deletePostButton: UIButton = {
        var b = UIButton()
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("Delete Post", for: .normal)
        b.setTitleColor(QwkColors.deletebuttonColor, for: .normal)
        return b
    }()
    
    let spacer: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
  

    fileprivate let suggestionsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(SuggestionCellCollectionViewCell.self, forCellWithReuseIdentifier: SuggestionCellCollectionViewCell.identifier)
        cv.backgroundColor = QwkColors.backgroundColor
        return cv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        suggestionsCollectionView.dataSource = self
        suggestionsCollectionView.delegate = self
        
        super.view.addSubview(urlEntryField)
        super.view.addSubview(deletePostButton)
        super.view.addSubview(label)
        super.view.addSubview(spacer)
        super.view.addSubview(suggestionsLabel)
        super.view.addSubview(suggestionsCollectionView)
        
        
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),

            urlEntryField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            urlEntryField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            urlEntryField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),

            deletePostButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            deletePostButton.topAnchor.constraint(equalTo: urlEntryField.bottomAnchor, constant: 8),
            
            spacer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            spacer.trailingAnchor.constraint(equalTo: deletePostButton.leadingAnchor, constant: -8),
            spacer.topAnchor.constraint(equalTo: urlEntryField.bottomAnchor, constant: 8),
            spacer.heightAnchor.constraint(equalTo: deletePostButton.heightAnchor),
            
            
            suggestionsLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            suggestionsLabel.topAnchor.constraint(equalTo: spacer.bottomAnchor, constant: 8),
            
            suggestionsCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            suggestionsCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            suggestionsCollectionView.topAnchor.constraint(equalTo: suggestionsLabel.bottomAnchor, constant: 8),
            suggestionsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
        ])
    }
}


extension EditDataViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SuggestionCellCollectionViewCell.identifier, for: indexPath) as! SuggestionCellCollectionViewCell
//        cell.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.safeAreaLayoutGuide.layoutFrame.width-16.0
        let height: CGFloat =  100.0
        return CGSize(width: width, height: height)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showPageSegue" {
//            let controller = segue.destination as! MorePageViewController
//            controller.value = "from topic vc"
//            controller.cellType = viewType
//        } else if segue.identifier == "discussionPageSegue" {
//            let controller = segue.destination as! DiscussionViewController
//            controller.value = "chat from topic vc"
//        }
    }
}
