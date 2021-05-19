//
//  EditQwkDescriptionViewController.swift
//  qwkipedia
//
//  Created by Jeff Omidvaran on 5/18/21.
//

import UIKit

class EditQwkDescriptionViewController: UIViewController {

    @IBOutlet weak var qwkDescriptionTextView: UITextView!
    @IBOutlet weak var trashButtonObject: UIButton!
    @IBOutlet weak var textFieldHeigthConstraint: NSLayoutConstraint!
    var currentQwkDescription = "Empty Description"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trashButtonObject.tintColor = QwkColors.buttonColor
        qwkDescriptionTextView.text = currentQwkDescription
    }

    @IBAction func trashButtonAction(_ sender: Any) {
        qwkDescriptionTextView.text = ""
        // MARK: update database here
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // MARK: update database here
    }
    

}
