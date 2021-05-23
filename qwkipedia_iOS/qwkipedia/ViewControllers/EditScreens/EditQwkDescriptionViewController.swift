//
//  EditQwkDescriptionViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/18/21.
//

import UIKit

class EditQwkDescriptionViewController: UIViewController {

    @IBOutlet weak var qwkDescriptionTextView: UITextView!
    @IBOutlet weak var trashButtonObject: UIBarButtonItem!
    
    var currentQwkDescription = "Empty Description"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qwkDescriptionTextView.delegate = self
        qwkDescriptionTextView.isEditable = true
        trashButtonObject.tintColor = QwkColors.buttonColor
        qwkDescriptionTextView.text = currentQwkDescription
        qwkDescriptionTextView.layer.borderWidth = 0.5
        qwkDescriptionTextView.layer.borderColor = QwkColors.outlineColor.cgColor
        qwkDescriptionTextView.layer.cornerRadius = 5
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
    }
}


extension EditQwkDescriptionViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        qwkDescriptionTextView.resignFirstResponder()
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        qwkDescriptionTextView.resignFirstResponder()
        return true
    }
}
