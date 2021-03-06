//
//  SetInterestsViewController.swift
//  qwkipedia
//
//  Created by Anahita Abadian on 4/18/21.
//

import UIKit
import Firebase
import FirebaseStorage

class SetProfileViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?
    let db = Firestore.firestore()
    let storage = Storage.storage().reference()
    var name:String = ""
    
    @IBOutlet weak var collectionview: UICollectionView!    
    @IBOutlet weak var skipButton: UIButton!
    
    //setting up the view
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
                              width: 150,height: 100)
        aboutTextField.delegate = aboutTextField

        view.addSubview(interestLabel)
        interestLabel.anchor(top:aboutTextField.bottomAnchor, left: view.leftAnchor, paddingTop: 10, paddingLeft: 10)
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
        //label.text = name
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
        label.text = "Choose your interests:"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .darkGray
        return label
    }()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.addSubview(containerView)
        containerView.anchor(top: view.topAnchor, left: view.leftAnchor,
                             right: view.rightAnchor, height: 500)
        aboutTextField.textViewDidEndEditing(aboutTextField)
        
        collectionview.register(UINib(nibName: "SelectInterestsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: Constants.Identifiers.interestCellIdentifier)
        collectionview.dataSource = self
        collectionview.delegate = self
        collectionview.allowsMultipleSelection = true
        skipButton.setTitleColor(QwkColors.buttonColor, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        self.nameLabel.text = self.name
    }
    
    @IBAction func SkipPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarViewController")
        
        //saving user interestss and bio to DB
        if(self.aboutTextField.textColor == .darkGray) {
            self.db.collection(Constants.FStore.usersCollection).document((Auth.auth().currentUser?.email)!.lowercased()).updateData(["bio":self.aboutTextField.text ?? ""])}
        self.db.collection(Constants.FStore.usersCollection).document((Auth.auth().currentUser?.email)!.lowercased()).updateData(["interests":arrSelectedData])
        let photoPath = "gs://qwkipeda.appspot.com/profileimages/"+Auth.auth().currentUser!.uid
        self.db.collection(Constants.FStore.usersCollection).document((Auth.auth().currentUser?.email)!.lowercased()).updateData(["profilePhotoRef":photoPath])
       
            // This is to get the SceneDelegate object from your view controller
            // then call the change root view controller function to change to main tab bar
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        
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
            guard let imageData = imageSelected.pngData() else {
                return
            }
            let ref = storage.child("profileimages").child(Auth.auth().currentUser?.uid ?? "image.png")
            print(ref)
            ref.putData(imageData, metadata: nil) { (metadata, error) in
                guard let metadata = metadata else {
                  // Uh-oh, an error occurred!
                  return
                }
                // Metadata contains file metadata such as size, content-type.
                let size = metadata.size
                // You can also access to download URL after upload.
                ref.downloadURL { (url, error) in
                  guard let downloadURL = url else {
                    // Uh-oh, an error occurred!
                    return
                  }
                }
              }
        }
        
        if let imageOriginal = info[UIImagePickerController.InfoKey.editedImage] as?
            UIImage {
            profileImageView.image = imageOriginal
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
        
}
var arrSelectedIndex = [IndexPath]() // This is selected cell Index array
var arrSelectedData = [String]() // This is selected cell data array

extension SetProfileViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.interestCellIdentifier, for: indexPath as IndexPath) as! SelectInterestsCollectionViewCell
        
        cell.imageView.image = InterestChoices.interestsToChoose[indexPath[1]].image
        cell.label.text = InterestChoices.interestsToChoose[indexPath[1]].title
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.size.width/3.0 - 8,
                      height: collectionView.frame.size.height/3.0 - 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item+1)!")
        let cell = collectionView.cellForItem(at: indexPath) as? SelectInterestsCollectionViewCell
        cell?.toggleSelected()
        cell?.isSelected = true
        let strData = InterestChoices.interestsToChoose[indexPath.item].title
        if arrSelectedIndex.contains(indexPath) {
                    arrSelectedIndex = arrSelectedIndex.filter { $0 != indexPath}
                    arrSelectedData = arrSelectedData.filter { $0 != strData}
                }
                else {
                    arrSelectedIndex.append(indexPath)
                    arrSelectedData.append(strData)
                }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

        let cell = collectionView.cellForItem(at: indexPath) as? SelectInterestsCollectionViewCell

        cell?.toggleSelected()
        cell?.isSelected = false
        
        let strData = InterestChoices.interestsToChoose[indexPath.item].title
        if arrSelectedIndex.contains(indexPath) {
                    arrSelectedIndex = arrSelectedIndex.filter { $0 != indexPath}
                    arrSelectedData = arrSelectedData.filter { $0 != strData}
                }
                else {
                    arrSelectedIndex.append(indexPath)
                    arrSelectedData.append(strData)
                }

    }

}


