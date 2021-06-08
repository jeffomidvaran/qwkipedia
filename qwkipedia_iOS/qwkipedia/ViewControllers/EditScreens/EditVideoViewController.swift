//
//  EditVideoViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/18/21.
//

import UIKit
import youtube_ios_player_helper
import Firebase
import FirebaseStorage
class EditVideoViewController: UIViewController {

    @IBOutlet weak var urlEntryTextField: UITextField!
    @IBOutlet weak var videoViewContainer: YTPlayerView!
    @IBOutlet weak var trashButtonObject: UIBarButtonItem!
    
    let db = Firestore.firestore()
    let storage = Storage.storage().reference()
    let user = Auth.auth().currentUser?.email
    var topic = ""
    var docid = "1"
    var currentVideoURL: String? {
        didSet {
            handleVideo()
        }
    }
    
    func handleVideo() {
        if let unwrappedVideoLink = currentVideoURL {
            if let _ = videoViewContainer {
                videoViewContainer.isHidden = false
                let videoID = unwrappedVideoLink.deletingPrefix("https://www.youtube.com/watch?v=")
                videoViewContainer.load(withVideoId: videoID)
            }
        } else {
            if let _ = videoViewContainer {
                videoViewContainer.isHidden = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlEntryTextField.delegate = self
        trashButtonObject.tintColor = QwkColors.buttonColor
        handleVideo()
        urlEntryTextField.becomeFirstResponder()
        
        db.collection("topics-v2").document(self.topic).collection("descriptions").addSnapshotListener { (querySnapshot, error) in

                if let e = error {
                     print("There was an issue retrieving data. \(e)")
                } else {
                    if let snapShotDocuments = querySnapshot?.documents { //generate id for the new desc
                    self.docid = String(snapShotDocuments.count+1)
                    print("new doc id is \(self.docid)")
            }
          }
        }
    }
    
    @IBAction func trashButtonAction(_ sender: Any) {
        currentVideoURL = ""
        videoViewContainer.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // MARK: DATA update database here (get url from currentVideoURL)
        urlEntryTextField.resignFirstResponder()
        
        let ownerName = UserDefaults.standard.string(forKey: "Name")
        
        db.collection("topics-v2").document(self.topic).collection("videos").document(docid)
            .setData(["body": self.currentVideoURL!,"owner": user!, "ownerName": ownerName!, "voteSum":0])
            print("data saved successfully")
         
        //incremenet number of users' contributions
        self.db.collection(Constants.FStore.usersCollection).document((Auth.auth().currentUser!.email?.lowercased())!)
            .updateData(["qwktributionCount": FieldValue.increment(Int64(1))])
        
            //add a refernece to the contribution under user
        
}
}

extension EditVideoViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        currentVideoURL = urlEntryTextField.text
        urlEntryTextField.text = ""
        handleVideo()
        return false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        currentVideoURL = urlEntryTextField.text
        urlEntryTextField.text = ""
        handleVideo()
    }
}



//     https://www.youtube.com/watch?v=7Gfu51_TgIA
