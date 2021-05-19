//
//  PublicProfileViewController.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 5/2/21.
//

import Foundation
import UIKit
import Firebase

class PublicProfileViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?
    let db = Firestore.firestore()
    var name = ""
    var bio = ""
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
//    view.addSubview(Interests)
//    Interests.anchor(top:interestLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 5, paddingLeft: 10)
    return view
}()

let profileImageView: UIImageView = {
    let iv = UIImageView()
    iv.image = #imageLiteral(resourceName: "janeDoe")
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.layer.borderWidth = 3
    iv.layer.borderColor = UIColor.white.cgColor
    return iv
}()

let nameLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.text = " "
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.textColor = .darkGray
    return label
}()
    
let editProfile: UIButton = {
        let edit = UIButton()
        edit.titleLabel?.text = "Edit Profile"
        edit.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        edit.titleLabel?.textColor = .darkGray
        return edit;
    }()

let numQwktribution: UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.text = "0 Qwktributions"
    label.font = UIFont.boldSystemFont(ofSize: 15)
    label.textColor = .darkGray
    return label
}()

let bioLabel:UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.text = "About"
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.textColor = .darkGray
    return label
}()

let aboutTextField: UITextView = {
    let bio = UITextView()
    bio.font = UIFont.boldSystemFont(ofSize: 15)
    bio.textColor = .lightGray
    bio.clipsToBounds = true
    bio.textAlignment = .justified
    bio.layer.borderColor = UIColor.gray.cgColor
    bio.layer.borderWidth = 2
    bio.layer.cornerRadius = 12
    bio.layer.shadowOpacity = 0.5
    return bio
}()

let interestLabel:UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.text = "Qwktributions"
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.textColor = .darkGray
    return label
}()

//let Interests:UITextField = {
//    let interests = UITextField()
//    interests.textColor = .darkGray
//    interests.text = "Surfing, Rock Climbing, House plants"
//    return interests
//}()

// MARK: - Lifecycle

override func viewDidLoad() {
    
    super.viewDidLoad()
    
    view.addSubview(profileView)
    profileView.anchor(top: view.topAnchor, left: view.leftAnchor,
                         right: view.rightAnchor, height: 500)
    aboutTextField.textViewDidEndEditing(aboutTextField)
}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        
        //Getting current user data
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.db.collection(Constants.FStore.usersCollection).getDocuments { (querySnapshot, error) in
                    if let e = error {
                        print("Couldn't retrieve name, \(e)")
                    } else {
                        if let snapShotDocs = querySnapshot?.documents {
                            for doc in snapShotDocs {
                                let data = doc.data()
                                if user.email == data[Constants.FStore.email] as? String {
                                    self.name = data[Constants.FStore.username] as! String
                                    self.bio = data["bio"] as! String
                                    self.nameLabel.text = self.name//show name retrieved from DB
                                    self.aboutTextField.text = self.bio //show bio retrieved from DB
                                    self.aboutTextField.textColor = .darkGray
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                self.db.collection(Constants.FStore.usersCollection).getDocuments { (querySnapshot, error) in
                    if let e = error {
                        print("Couldn't save data, \(e)")
                    } else {
                        if let snapShotDocs = querySnapshot?.documents {
                            for doc in snapShotDocs {
                                let data = doc.data()
                                if user.email == data[Constants.FStore.email] as? String {
                                    if let docid = data[Constants.FStore.userid] as? String {
                                        self.db.collection(Constants.FStore.usersCollection).document(docid).updateData(["bio":self.aboutTextField.text ?? ""])}
                                }
                             }
                         }
                    }
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIButton) {
        
        do {
            try Auth.auth().signOut()
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let loginViewController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
                
                // get the SceneDelegate object from your view controller
                // then call the change root view controller function to change to main tab bar to login again
                (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginViewController)
            
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    }
    

}
