//
//  PublicProfileViewController.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 5/2/21.
//

import Foundation
import UIKit
import Firebase
import FirebaseStorage
import FirebaseUI

class PublicProfileViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?
    let db = Firestore.firestore()
    let storage = Storage.storage().reference()
    let user = Auth.auth().currentUser?.email

    @IBOutlet weak var collectionview: UICollectionView!
    
    lazy var profileView: UIView = {
        
        let view = UIView()
        
        view.addSubview(profileImageView)
        profileImageView.anchor(top:view.topAnchor, left:view.leftAnchor, paddingTop: 95, paddingLeft: 8,
                                width: 100,height: 100)
        profileImageView.layer.cornerRadius = 100 / 2
        
        
        view.addSubview(nameLabel)
        nameLabel.anchor(top: view.topAnchor, left: profileImageView.rightAnchor, paddingTop: 105, paddingLeft: 5)
        
        view.addSubview(numQwktribution)
        numQwktribution.anchor(top: nameLabel.bottomAnchor, left: profileImageView.rightAnchor, paddingTop: 5, paddingLeft: 5)
        
        view.addSubview(editProfile)
        editProfile.anchor(top: view.topAnchor,right: view.rightAnchor, paddingTop: 105,
                           paddingRight: 8)
        
        
        view.addSubview(bioLabel)
        bioLabel.anchor(top:profileImageView.bottomAnchor, left: view.leftAnchor, paddingTop: 5, paddingLeft: 10)
        
        view.addSubview(aboutTextField)
        aboutTextField.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive=true
        aboutTextField.anchor(top:bioLabel.bottomAnchor, left:view.leftAnchor, paddingTop:5, paddingLeft: 8,
                              width: 150,height: 150)
        aboutTextField.delegate = aboutTextField
        
        view.addSubview(interestLabel)
        interestLabel.anchor(top:aboutTextField.bottomAnchor, left: view.leftAnchor, paddingTop: 10, paddingLeft: 10)
        return view
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "janeDoe")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 0.5
        //iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderColor = QwkColors.outlineColor.cgColor
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = " "
        label.font = UIFont.boldSystemFont(ofSize: 18)
        //label.textColor = .darkGray
        label.textColor = QwkColors.textColor
        return label
    }()
    
    let editProfile: UIButton = {
        let edit = UIButton()
        edit.titleLabel?.text = "Edit Profile"
        edit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        // edit.titleLabel?.textColor = .darkGray
        edit.titleLabel?.textColor = QwkColors.textColor
        return edit;
    }()
    
    let numQwktribution: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "0 Qwktributions"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        // label.textColor = .darkGray
        label.textColor = QwkColors.textColor
        return label
    }()
    
    let bioLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "About"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = QwkColors.textColor
        //label.textColor = .darkGray
        return label
    }()
    
    let aboutTextField: UITextView = {
        let bio = UITextView()
        bio.font = UIFont.boldSystemFont(ofSize: 15)
        bio.textColor = .lightGray
        bio.clipsToBounds = true
        bio.textAlignment = .justified
        //bio.layer.borderColor = UIColor.gray.cgColor
        bio.layer.borderColor = QwkColors.outlineColor.cgColor
        bio.layer.borderWidth = 0.5
        bio.layer.cornerRadius = 12
        bio.layer.shadowOpacity = 0.5
        return bio
    }()
    
    let interestLabel:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Qwktributions"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        //label.textColor = .darkGray
        label.textColor = QwkColors.textColor
        return label
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(profileView)
        profileView.anchor(top: view.topAnchor, left: view.leftAnchor,
                           right: view.rightAnchor, height: 500)
        aboutTextField.textViewDidEndEditing(aboutTextField)
        
        let ref = storage.child("profileimages").child(Auth.auth().currentUser?.uid ?? "image.png")
        profileImageView.sd_setImage(with: ref, placeholderImage: UIImage(named: "profile-pic"))
        
        //qwktributioncell
        //collectionview.register(UINib(nibName: "QwktributionCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "QwktributionCollectionViewCell")
        //collectionview.dataSource = self
        //collectionview.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        loadUserData()
        //Getting current user data to show on profile
        let docid = (Auth.auth().currentUser?.email!.lowercased())!
        let docRef = db.collection("users").document(docid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                self.nameLabel.text = (document["name"] as! String)
                self.aboutTextField.text = (document["bio"] as! String)
                let count = document["qwktributionCount"] as? NSNumber
                self.numQwktribution.text = (count?.stringValue)! + " Qwktributions"
                self.aboutTextField.textColor = QwkColors.textColor
                
            } else {
                print("User does not exist")
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
         self.db.collection(Constants.FStore.usersCollection).document((Auth.auth().currentUser!.email?.lowercased())!).updateData(["bio":self.aboutTextField.text ?? ""])
      
    }
    
    //MARK: Load data
    func loadUserData() {
        db.collection("users").document(user!).getDocument { document, error in
            if let document = document, document.exists {
                    let dataDescription = document.get("qwktributionRefs")
                    print("Document data:")
                } else {
                    print("Document does not exist")
                }
        }
    }
}

extension PublicProfileViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QwktributionCollectionViewCell", for: indexPath as IndexPath) as! QwktributionCollectionViewCell
        
        cell.text.text = InterestChoices.interestsToChoose[indexPath[1]].title
        return cell
    }
}

