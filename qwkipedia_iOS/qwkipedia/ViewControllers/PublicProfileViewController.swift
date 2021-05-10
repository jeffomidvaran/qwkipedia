//
//  PublicProfileViewController.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 5/2/21.
//

import Foundation
import UIKit

class PublicProfileViewController: UIViewController {
    
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
    view.addSubview(Interests)
    Interests.anchor(top:interestLabel.bottomAnchor, left: view.leftAnchor, paddingTop: 5, paddingLeft: 10)
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
    label.text = "Marina"
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
    bio.textColor = .darkGray
    bio.clipsToBounds = true
    bio.layer.borderColor = UIColor.gray.cgColor
    bio.textAlignment = .justified
    bio.text = "Full-time Dentist 🦷, Part-time Dancer 💃, Fitness enthusiast 🧗‍♀️, and traveller 🏕️...as much as work allows!"
    bio.layer.borderWidth = 2
    bio.layer.cornerRadius = 12
    bio.layer.shadowOpacity = 0.5
    return bio
}()

let interestLabel:UILabel = {
    let label = UILabel()
    label.textAlignment = .left
    label.text = "Interests"
    label.font = UIFont.boldSystemFont(ofSize: 18)
    label.textColor = .darkGray
    return label
}()

let Interests:UITextField = {
    let interests = UITextField()
    interests.textColor = .darkGray
    interests.text = "Surfing, Rock Climbing, House plants"
    return interests
}()

// MARK: - Lifecycle

override func viewDidLoad() {
    
    super.viewDidLoad()
    view.backgroundColor = QwkColors.backgroundColor
    
    view.addSubview(profileView)
    profileView.anchor(top: view.topAnchor, left: view.leftAnchor,
                         right: view.rightAnchor, height: 500)
    aboutTextField.textViewDidEndEditing(aboutTextField)
}

}
