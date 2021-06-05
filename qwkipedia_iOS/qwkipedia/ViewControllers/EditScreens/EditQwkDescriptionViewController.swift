//
//  EditQwkDescriptionViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/18/21.
//

import UIKit
import Firebase
import FirebaseStorage
class EditQwkDescriptionViewController: UIViewController {
    
    let db = Firestore.firestore()
    let storage = Storage.storage().reference()
    let user = Auth.auth().currentUser?.email

    @IBOutlet weak var qwkDescriptionTextView: UITextView!
    @IBOutlet weak var trashButtonObject: UIBarButtonItem!
    
    var currentQwkDescription = "Empty Description"
    
    var topic = ""
    var docid = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qwkDescriptionTextView.delegate = self
//        qwkDescriptionTextView.isEditable = true
        trashButtonObject.tintColor = QwkColors.buttonColor
        qwkDescriptionTextView.text = currentQwkDescription
        qwkDescriptionTextView.layer.borderWidth = 0.5
        qwkDescriptionTextView.layer.borderColor = QwkColors.outlineColor.cgColor
        qwkDescriptionTextView.layer.cornerRadius = 5
        
        // Generating the new id is a bit early at this point, but also too late in view will disappear
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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        qwkDescriptionTextView.becomeFirstResponder()
    }
    

    @IBAction func trashButtonAction(_ sender: Any) {
        qwkDescriptionTextView.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // MARK: DATA update database here
        let ownerName = UserDefaults.standard.string(forKey: "Name")
        let ownerImageRef = "gs://qwkipeda.appspot.com/profileimages/"+Auth.auth().currentUser!.uid
        
        if (!(qwkDescriptionTextView.text.isEmpty) && (qwkDescriptionTextView.text != "Empty Qwk Description")) {
        db.collection("topics-v2").document(self.topic).collection("descriptions").document(docid)
            .setData(["body": self.qwkDescriptionTextView.text!,"owner": user!, "ownerName": ownerName!,"ownerImageRef": ownerImageRef, "voteSum":0])
            print("data saved successfully")
            
            //add a refernece to the contribution under user
        let docRef = db.collection("topics-v2").document(self.topic).collection("descriptions").document(docid)
        
        self.db.collection(Constants.FStore.usersCollection).document((Auth.auth().currentUser!.email?.lowercased())!)
            .updateData(["qwktributionCount": FieldValue.increment(Int64(1))])
                         //"qwktributionRefs":FieldValue.arrayUnion([docRef])])
            
            self.db.collection("users").document((Auth.auth().currentUser!.email?.lowercased())!).collection("contributions").addDocument(data: ["title":self.topic, "desc":self.qwkDescriptionTextView.text!])
            }
    }
    }


extension EditQwkDescriptionViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        qwkDescriptionTextView.resignFirstResponder()
        return true
    }
}
