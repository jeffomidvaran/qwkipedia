//
//  SetInterestsViewController.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 4/18/21.
//

import UIKit
import Firebase

class SetProfileViewController: UIViewController {
    
    lazy var containerView: UIView = {
        let view = UIView()
        
        view.addSubview(profileImageView)
        profileImageView.anchor(top:view.topAnchor, left:view.leftAnchor, paddingTop: 95, paddingLeft: 8,
                                width: 100,height: 100)
        profileImageView.layer.cornerRadius = 100 / 2
        
        let tapGesture = UITapGestureRecognizer(target:self, action:#selector(presentPicker))
        profileImageView.addGestureRecognizer(tapGesture)
        
        view.addSubview(nameLabel)
        nameLabel.anchor(top: view.topAnchor, left: profileImageView.rightAnchor, paddingTop: 105, paddingLeft: 5)
        
        view.addSubview(numQwktribution)
        numQwktribution.anchor(top: nameLabel.bottomAnchor, left: profileImageView.rightAnchor, paddingTop: 5, paddingLeft: 5)
        
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
        iv.image = #imageLiteral(resourceName: "profile-pic")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 3
        iv.layer.borderColor = UIColor.white.cgColor
        iv.isUserInteractionEnabled = true
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
        label.text = "Interests"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()
    
    let Interests:UITextField = {
        let interests = UITextField()
        interests.placeholder = "Tap to add your topics of interest ..."
        interests.textColor = .darkGray
        return interests
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor,
                             right: view.rightAnchor, height: 500)
        aboutTextField.textViewDidEndEditing(aboutTextField)
    }
    
    //MARK: -Selectors
    @objc func presentPicker(){
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
}

extension SetProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as?
            UIImage {
            profileImageView.image = imageSelected
        }
        
        if let imageOriginal = info[UIImagePickerController.InfoKey.editedImage] as?
            UIImage {
            profileImageView.image = imageOriginal
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}


