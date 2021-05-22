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
    @IBOutlet weak var textFieldHeigthConstraint: NSLayoutConstraint!
    var currentQwkDescription = "Empty Description"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        qwkDescriptionTextView.delegate = self
        trashButtonObject.tintColor = QwkColors.buttonColor
        qwkDescriptionTextView.text = currentQwkDescription
        qwkDescriptionTextView.layer.borderWidth = 0.5
        qwkDescriptionTextView.layer.borderColor = QwkColors.outlineColor.cgColor
        qwkDescriptionTextView.layer.cornerRadius = 5
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let newHeight = view.bounds.height - keyboardSize.height + 30
            textFieldHeigthConstraint.constant = view.bounds.height - newHeight
        }
    }
    

    @objc func keyboardWillHide(notification: Notification) {
        textFieldHeigthConstraint.constant = view.bounds.height - 30
    }
    
    
    var keyboardHeight:CGFloat = 0.0
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
