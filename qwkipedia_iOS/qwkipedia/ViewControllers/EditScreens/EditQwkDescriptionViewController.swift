//
//  EditQwkDescriptionViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/18/21.
//

import UIKit

class EditQwkDescriptionViewController: UIViewController {

    @IBOutlet weak var qwkDescriptionTextView: UITextView!
//    @IBOutlet weak var trashButtonObject: UIButton!
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
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let width: CGFloat = view.safeAreaLayoutGuide.layoutFrame.width-16
        let newSize = qwkDescriptionTextView.sizeThatFits(
                                            CGSize(width: width,
                                                   height: CGFloat.greatestFiniteMagnitude))
        let height = newSize.height
        textFieldHeigthConstraint.constant = height
    }
    


    @IBAction func trashButtonAction(_ sender: Any) {
        qwkDescriptionTextView.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // MARK: DATA update database here
    }
    

}


extension EditQwkDescriptionViewController: UITextViewDelegate {
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        print("should end")
        return true
    }
}
